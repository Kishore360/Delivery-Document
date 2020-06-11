SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.orphan_story_flag' ELSE 'SUCCESS' END as Message

/*select SQ.__numerify__primary_key,SQ.sourceinstance, SQ.dimension_wh_code,
SQ.id, SQ.orphan_story_flag, TRGT.orphan_story_flag*/

from (select SRC.__numerify__primary_key,SRC.sourceinstance, typ.dimension_wh_code, SRC.id,
group_concat(case when typ.dimension_wh_code in ('STORY') then 
case when (LNK_PAR.targetKey is null and LNK_CHL.sourceKey is null) then 'Y'
when LNK_PAR.targetKey is not null and LNK_CHL.sourceKey is null then case when LNK_PAR.par_lnk_type not in ('EPIC', 'STORY') then 'Y' else 'N' end
when LNK_PAR.targetKey is null and LNK_CHL.sourceKey is not null then case when LNK_CHL.ch_lnk_type not in ('EPIC', 'STORY') then 'Y' else 'N' end
when (LNK_PAR.targetKey is not null and LNK_CHL.sourceKey is not null) then case when LNK_PAR.par_lnk_type in ('EPIC', 'STORY') then 'N' when LNK_CHL.ch_lnk_type in ('EPIC', 'STORY') then 'N' else 'Y' end
else 'N' end
else 'N' end) as orphan_story_flag

FROM #STG_TABLE_SCHEMA.workitem_temp_azure SRC

left join #DWH_TABLE_SCHEMA.d_lov_map typ
 on concat('TYPE~WORK_ITEM','~',upper(SRC.workItemType))=typ.src_rowid
 and SRC.sourceinstance=typ.source_id

 left join (
 select distinct lnk.sourceKey, lnk.sourceinstance, lnk.targetKey, typ.dimension_wh_code ch_lnk_type
 from #STG_TABLE_SCHEMA.work_item_link_base lnk
 left join #MDS_TABLE_SCHEMA.azure_workitem_relation_type_final lnk_typ
 on lnk.linkType = lnk_typ.oppositeEndReferenceName and lnk.sourceinstance = lnk_typ.sourceinstance
 left join #STG_TABLE_SCHEMA.workitem_temp_azure SRC
 on lnk.sourceKey = SRC.__numerify__primary_key and SRC.sourceinstance=lnk.sourceinstance
 left join #DWH_TABLE_SCHEMA.d_lov_map typ
 on concat('TYPE~WORK_ITEM','~',upper(SRC.workItemType))=typ.src_rowid
 and SRC.sourceinstance=typ.source_id
 where lnk.isActive = 1
 ) LNK_CHL
 on LNK_CHL.targetKey = SRC.__numerify__primary_key and SRC.sourceinstance=LNK_CHL.sourceinstance
 
  left join (
 select distinct lnk.sourceKey, lnk.sourceinstance, lnk.targetKey, typ.dimension_wh_code par_lnk_type
 from #STG_TABLE_SCHEMA.work_item_link_base lnk
 left join #MDS_TABLE_SCHEMA.azure_workitem_relation_type_final lnk_typ
 on lnk.linkType = lnk_typ.oppositeEndReferenceName and lnk.sourceinstance = lnk_typ.sourceinstance
 left join #STG_TABLE_SCHEMA.workitem_temp_azure SRC
 on lnk.targetKey = SRC.__numerify__primary_key and SRC.sourceinstance=lnk.sourceinstance
 left join #DWH_TABLE_SCHEMA.d_lov_map typ
 on concat('TYPE~WORK_ITEM','~',upper(SRC.workItemType))=typ.src_rowid
 and SRC.sourceinstance=typ.source_id
 where lnk.isActive = 1 
 ) LNK_PAR
 on LNK_PAR.sourceKey = SRC.__numerify__primary_key and SRC.sourceinstance=LNK_PAR.sourceinstance

group by SRC.__numerify__primary_key,SRC.sourceinstance, typ.dimension_wh_code, SRC.id
) SQ

LEFT JOIN  #DWH_TABLE_SCHEMA.d_work_item TRGT
on concat(SQ.__numerify__primary_key, '')=TRGT.row_id
and SQ.sourceinstance=TRGT.source_id

where TRGT.soft_deleted_flag <> 'Y'  and
coalesce(case when SQ.orphan_story_flag like '%N%' then 'N' else 'Y' end, 'N')<>coalesce(TRGT.orphan_story_flag,'');