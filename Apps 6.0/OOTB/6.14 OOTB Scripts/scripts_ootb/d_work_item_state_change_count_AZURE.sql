SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.state_change_count' ELSE 'SUCCESS' END as Message
/*select TRGT.row_key, TRGT.row_id,
coalesce(LKP.state_chng_cnt, 0) expc, coalesce(TRGT.state_change_count, '') actl*/
from #STG_TABLE_SCHEMA.workitem_temp_azure SRC
left join (
select tmp.issueid, tmp.sourceinstance, tmp.field, count(*)-1 state_chng_cnt
from (select * from #STG_TABLE_SCHEMA.issue_activity_azure_base base where base.field in ('STATUS', 'ITERATION', 'STORY POINTS', 'TIMEORIGINALESTIMATE', 'BUSINESS VALUE')) tmp
WHERE tmp.field = 'STATUS' 
GROUP by tmp.issueid, tmp.sourceinstance, tmp.field
) LKP
on SRC.__numerify__primary_key = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance
left join #DWH_TABLE_SCHEMA.d_work_item TRGT
 ON (concat(SRC.__numerify__primary_key, '')=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id)

WHERE TRGT.soft_deleted_flag <> 'Y' and coalesce(LKP.state_chng_cnt, 0) <> coalesce(TRGT.state_change_count, '');