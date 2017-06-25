SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_task.opened_on_c' ELSE 'SUCCESS' END as Message  
FROM nypres_mdsdb.task_final SRC  
JOIN nypres_mdwdb.d_task TRGT  
ON SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id
WHERE convert_tz(SRC.opened_at,'GMT','America/New_York')<> (TRGT.opened_on_c)