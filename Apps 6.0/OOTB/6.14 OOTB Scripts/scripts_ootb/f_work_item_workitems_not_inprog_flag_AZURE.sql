SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.workitems_not_inprog_flag' ELSE 'SUCCESS' END as Message

/*select SRC.id,SRC.sourceinstance, 
coalesce(case when inprog_wi.issueid is null then 'Y' else 'N' end, 'N') sr,
coalesce(TRGT.workitems_not_inprog_flag,'') tgt*/

FROM #STG_TABLE_SCHEMA.workitem_temp_azure SRC

left join
(
select tmp.issueid, tmp.sourceinstance, LM.dimension_wh_code
  -- coalesce(tmp.from, tmp.fromstring), coalesce(tmp.to, tmp.tostring)
from (select * from (select * from #STG_TABLE_SCHEMA.issue_activity_azure_base base where base.field in ('STATUS', 'ITERATION', 'STORY POINTS', 'TIMEORIGINALESTIMATE', 'BUSINESS VALUE')) tmp where tmp.field in ('STATUS', 'ITERATION', 'STORY POINTS', 'TIMEORIGINALESTIMATE', 'BUSINESS VALUE')) tmp
left join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM~',upper(tmp.to))=LM.src_rowid
 
where lower(tmp.field) = 'status' and LM.dimension_wh_code='IN PROGRESS'
) inprog_wi

on concat(SRC.__numerify__primary_key, '')=inprog_wi.issueid
and SRC.sourceinstance=inprog_wi.sourceinstance

LEFT JOIN  #DWH_TABLE_SCHEMA.d_work_item TRGT
on concat(SRC.__numerify__primary_key, '')=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
 
where coalesce(case when inprog_wi.issueid is null then 'Y' else 'N' end, 'N')<>coalesce(TRGT.workitems_not_inprog_flag,'');