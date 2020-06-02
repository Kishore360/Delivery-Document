SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.workitems_not_inprog_flag' ELSE 'SUCCESS' END as Message

/*select SRC.id,SRC.sourceinstance, 
coalesce(case when inprog_wi.issue_changelog_issueid is null and STS.dimension_wh_code <> 'IN PROGRESS' then 'Y' else 'N' end, 'N') sr,
coalesce(TRGT.workitems_not_inprog_flag,'') tgt*/

FROM #MDS_TABLE_SCHEMA.issue_final SRC

left join
(
select tmp.issue_changelog_issueid, tmp.issue_changelog_sourceinstance, LM.dimension_wh_code
  -- coalesce(tmp.from, tmp.fromstring), coalesce(tmp.to, tmp.tostring)
from #STG_TABLE_SCHEMA.issue_activity_temp tmp
left join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM~',upper(tmp.to))=LM.src_rowid and tmp.issue_changelog_sourceinstance = LM.source_id
 
where lower(tmp.field) = 'status' and LM.dimension_wh_code='IN PROGRESS'
) inprog_wi

on concat(SRC.id, '')=inprog_wi.issue_changelog_issueid
and SRC.sourceinstance=inprog_wi.issue_changelog_sourceinstance

left join #DWH_TABLE_SCHEMA.d_lov_map STS
on concat('STATUS~WORK_ITEM~',upper(SRC.status_id))=STS.src_rowid and SRC.sourceinstance = STS.source_id

LEFT JOIN  #DWH_TABLE_SCHEMA.d_work_item TRGT
on concat(SRC.id, '')=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
 
where coalesce(case when inprog_wi.issue_changelog_issueid is null and STS.dimension_wh_code <> 'IN PROGRESS' then 'Y' else 'N' end, 'N')<>coalesce(TRGT.workitems_not_inprog_flag,'');