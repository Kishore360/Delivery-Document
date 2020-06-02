SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.state_change_count' ELSE 'SUCCESS' END as Message
/*select TRGT.row_key, TRGT.row_id,
coalesce(SRC.state_chng_cnt, 0) expc, coalesce(TRGT.state_change_count, '') actl*/
from (
select tmp.issueid, tmp.sourceinstance, tmp.field, count(*)-1 state_chng_cnt
FROM #STG_TABLE_SCHEMA.issue_activity_temp tmp
WHERE tmp.field = 'STATUS' 
GROUP by tmp.issueid, tmp.sourceinstance, tmp.field
) SRC
left join #DWH_TABLE_SCHEMA.d_work_item TRGT
 ON (concat(SRC.issueid, '')=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id)

 WHERE SRC.field = 'STATUS' and coalesce(SRC.state_chng_cnt, 0) <> coalesce(TRGT.state_change_count, '');