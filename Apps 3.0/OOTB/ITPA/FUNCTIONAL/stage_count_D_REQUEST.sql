select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH validation failed for d_request.stage_count' else 'SUCCESS' end as Message 
from <<tenant>>_mdwdb.d_request d
LEFT JOIN (SELECT task_key,count(1) as stage_count, etl_run_number from <<tenant>>_mdwdb.f_request_activity 
           WHERE task_attribute_wh_name = 'stage'
           GROUP BY task_key) A
ON d.row_key = A.task_key
WHERE d.etl_run_number = A.etl_run_number and ( d.stage_count <> A.stage_count OR d.stage_count IS NULL);
