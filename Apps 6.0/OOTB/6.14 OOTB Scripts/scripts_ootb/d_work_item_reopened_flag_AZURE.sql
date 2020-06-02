SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.reopened_flag' ELSE 'SUCCESS' END as Message
from #STG_TABLE_SCHEMA.workitem_temp_azure SRC
left join (
select tmp.issueid,tmp.sourceinstance, count(1) as reopened_count
from (select * from (select * from #STG_TABLE_SCHEMA.issue_activity_azure_base base where base.field in ('STATUS', 'ITERATION', 'STORY POINTS', 'TIMEORIGINALESTIMATE', 'BUSINESS VALUE')) tmp where tmp.field in ('STATUS', 'ITERATION', 'STORY POINTS', 'TIMEORIGINALESTIMATE', 'BUSINESS VALUE')) tmp
 
left join #DWH_TABLE_SCHEMA.d_lov_map LM_TO
on concat('STATUS~WORK_ITEM~',upper(tmp.to))=LM_TO.src_rowid

left join #DWH_TABLE_SCHEMA.d_lov_map LM_FROM
on concat('STATUS~WORK_ITEM~',upper(tmp.from))=LM_FROM.src_rowid
 
where lower(tmp.field) = 'status' and LM_FROM.dimension_wh_code in ('COMPLETED','RESOLVED','CANCELLED') and LM_TO.dimension_wh_code in ('PROPOSED', 'IN PROGRESS')

group by tmp.issueid,tmp.sourceinstance
) reopen_cnt
on SRC.__numerify__primary_key=reopen_cnt.issueid
and SRC.sourceinstance=reopen_cnt.sourceinstance
 
left join #DWH_TABLE_SCHEMA.d_work_item TRGT
on concat(SRC.__numerify__primary_key, '')=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
 
where coalesce(case when reopen_cnt.reopened_count>0 then 'Y' else 'N' end,'N') <> coalesce(TRGT.reopened_flag,'');