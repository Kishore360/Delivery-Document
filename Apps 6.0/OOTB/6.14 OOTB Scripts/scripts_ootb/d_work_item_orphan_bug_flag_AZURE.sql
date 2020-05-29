SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.orphan_bug_flag' ELSE 'SUCCESS' END as Message

/*select SRC.__numerify__primary_key,SRC.sourceinstance, typ.dimension_wh_code,
coalesce(case when typ.dimension_wh_code = 'BUG' then 
  case when isu_lnk.issueid is null or isu_lnk.inward_issue_type not in ('STORY','EPIC') 
  or isu_lnk.outward_issue_type not in ('STORY','EPIC') then 'Y' else 'N' end
else 'N' end, 'N') sr,
coalesce(TRGT.orphan_bug_flag,'') tgt*/

from 
(
select SRC.id, SRC.sourceinstance, group_concat(case when typ.dimension_wh_code = 'BUG' then 
  case when isu_lnk.issueid is null or (isu_lnk.inward_issue_type is null and isu_lnk.inwardissueid is null) then 'Y'
  when isu_lnk.issueid is null or (isu_lnk.outward_issue_type is null and isu_lnk.outwardissueid is null) then 'Y' else 'N' end
  else 'N' end) as orphan_bug_flag

FROM #STG_TABLE_SCHEMA.workitem_temp_azure SRC

left join #DWH_TABLE_SCHEMA.d_lov_map typ
 on concat('TYPE~WORK_ITEM','~',upper(SRC.workItemType))=typ.src_rowid
 and SRC.sourceinstance=typ.source_id

left join 
(
select isu_lnk.targetKey issueid, isu_lnk.sourceinstance, isu_lnk.sourceKey inwardissueid, inward_typ.dimension_wh_code inward_issue_type,
out_isu_lnk.targetKey outwardissueid, outward_typ.dimension_wh_code outward_issue_type
from #STG_TABLE_SCHEMA.work_item_link_base isu_lnk
left join #STG_TABLE_SCHEMA.workitem_temp_azure in_isu
on in_isu.__numerify__primary_key = isu_lnk.sourceKey
and in_isu.sourceinstance = isu_lnk.sourceinstance
left join #DWH_TABLE_SCHEMA.d_lov_map inward_typ
on concat('TYPE~WORK_ITEM','~',upper(in_isu.workItemType))=inward_typ.src_rowid
and in_isu.sourceinstance=inward_typ.source_id
left join #STG_TABLE_SCHEMA.work_item_link_base out_isu_lnk
on out_isu_lnk.sourceKey = isu_lnk.targetKey and isu_lnk.sourceinstance = out_isu_lnk.sourceinstance
left join #STG_TABLE_SCHEMA.workitem_temp_azure out_isu
on out_isu.__numerify__primary_key = out_isu_lnk.targetKey
and out_isu.sourceinstance = out_isu_lnk.sourceinstance
left join #DWH_TABLE_SCHEMA.d_lov_map outward_typ
on concat('TYPE~WORK_ITEM','~',upper(out_isu.workItemType))=outward_typ.src_rowid
and out_isu.sourceinstance=outward_typ.source_id
) isu_lnk
on SRC.__numerify__primary_key = isu_lnk.issueid
and SRC.sourceinstance = isu_lnk.sourceinstance

group by SRC.__numerify__primary_key, SRC.sourceinstance
) SQ

LEFT JOIN  #DWH_TABLE_SCHEMA.d_work_item TRGT
on concat(SQ.id, '')=TRGT.row_id
and SQ.sourceinstance=TRGT.source_id
 
where TRGT.soft_deleted_flag <> 'Y' and
coalesce(IF(SQ.orphan_bug_flag like '%N%', 'N', 'Y'), 'N')<>coalesce(TRGT.orphan_bug_flag,'');