select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH validation failed for d_request_task.state_count' else 'SUCCESS' end as Message
from <<tenant>>_mdwdb.d_request_task d
LEFT JOIN (SELECT task_key,count(1) as state_count, etl_run_number from <<tenant>>_mdwdb.f_request_task_activity 
           WHERE task_attribute_wh_name = 'state'
           GROUP BY task_key) A
ON d.row_key = A.task_key
WHERE d.etl_run_number = A.etl_run_number and ( d.state_count <> A.state_count OR d.state_count IS NULL);
