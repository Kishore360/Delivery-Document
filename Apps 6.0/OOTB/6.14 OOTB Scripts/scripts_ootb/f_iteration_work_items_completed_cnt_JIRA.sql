SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_iteration.work_items_completed_cnt' ELSE 'SUCCESS' END as Message

/*select TRGT.row_id, SR.row_id, SR.iteration_key,
  COALESCE(SRC.work_items_completed_cnt,0) sr, COALESCE(TRGT.work_items_completed_cnt ,'') tg*/
FROM (
select SR.iteration_key, SR.row_id, SR.source_id, sum(SR.is_resolved_count - SR.is_reopened_count) as work_items_completed_cnt
from #STG_TABLE_SCHEMA.f_iteration_temp SR
group by SR.iteration_key, SR.row_id, SR.source_id
 ) SRC

LEFT JOIN #DWH_TABLE_SCHEMA.f_iteration TRGT 
ON (SRC.row_id = TRGT.row_id 
AND SRC.source_id=TRGT.source_id)
 
WHERE TRGT.soft_deleted_flag = 'N' and COALESCE(SRC.work_items_completed_cnt,0) <> COALESCE(TRGT.work_items_completed_cnt, '');