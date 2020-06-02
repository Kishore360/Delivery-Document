SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.story_to_epic_flag' ELSE 'SUCCESS' END as Message

/*Select SQ.id, SQ.sourceinstance, TRGT.work_item_number, SQ.story_to_epic_flag,
coalesce(if(SQ.story_to_epic_flag like '%Y%', 'Y', 'N'), 'N') sr,
coalesce(TRGT.story_to_epic_flag,'') tgt*/
from 
(
select SRC.id, SRC.sourceinstance, group_concat(case when typ.dimension_wh_code = 'STORY' then 
  case when ((isu_lnk.issueid is not null and (isu_lnk.inward_issue_type in ('EPIC') or isu_lnk.outward_issue_type in ('EPIC')))
  or EXT.customfield_10008 is not null) then 'Y' else 'N' end else 'N' end) as story_to_epic_flag
FROM #MDS_TABLE_SCHEMA.issue_final SRC
join #MDS_TABLE_SCHEMA.issue_ext_final EXT
on SRC.id = EXT.record_id and SRC.sourceinstance = EXT.sourceinstance

left join #DWH_TABLE_SCHEMA.d_lov_map typ
 on concat('TYPE~WORK_ITEM','~',upper(SRC.issuetype_id))=typ.src_rowid
 and SRC.sourceinstance=typ.source_id

left join 
(
select isu_lnk.issueid issueid, isu_lnk.sourceinstance, isu_lnk.inwardissue_id inwardissue_id, inward_typ.dimension_wh_code inward_issue_type,
isu_lnk.outwardissue_id outwardissue_id, outward_typ.dimension_wh_code outward_issue_type
from #MDS_TABLE_SCHEMA.issue_issuelinks_final isu_lnk
left join #MDS_TABLE_SCHEMA.issue_final in_isu
on in_isu.id = isu_lnk.inwardissue_id
and in_isu.sourceinstance = isu_lnk.sourceinstance
left join #DWH_TABLE_SCHEMA.d_lov_map inward_typ
on concat('TYPE~WORK_ITEM','~',upper(in_isu.issuetype_id))=inward_typ.src_rowid
and in_isu.sourceinstance=inward_typ.source_id
left join #MDS_TABLE_SCHEMA.issue_final out_isu
on out_isu.id = isu_lnk.outwardissue_id
and out_isu.sourceinstance = isu_lnk.sourceinstance
left join #DWH_TABLE_SCHEMA.d_lov_map outward_typ
on concat('TYPE~WORK_ITEM','~',upper(out_isu.issuetype_id))=outward_typ.src_rowid
and out_isu.sourceinstance=outward_typ.source_id
) isu_lnk
on SRC.id = isu_lnk.issueid
and SRC.sourceinstance = isu_lnk.sourceinstance
group by SRC.id, SRC.sourceinstance
) SQ

LEFT JOIN  #DWH_TABLE_SCHEMA.d_work_item TRGT
on concat(SQ.id, '')=TRGT.row_id
and SQ.sourceinstance=TRGT.source_id
 
where coalesce(if(SQ.story_to_epic_flag like '%Y%', 'Y', 'N'), 'N')<>coalesce(TRGT.story_to_epic_flag,'');