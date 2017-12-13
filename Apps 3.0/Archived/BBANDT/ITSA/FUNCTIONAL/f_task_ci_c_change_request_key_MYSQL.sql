
SELECT 
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_task_ci_c_change_request_key' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdsdb.task_ci_final SRC 
JOIN bbandt_mdwdb.f_task_ci_c TRGT 
ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) 
join bbandt_mdwdb.d_change_request lkp
on SRC.task=lkp.row_id and SRC.sourceinstance = lkp.source_id
WHERE coalesce(lkp.row_key,case when SRC.task is NULL then 0 else -1 end) <> TRGT.change_request_key