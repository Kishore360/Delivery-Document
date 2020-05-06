SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_task_ci_c.pivot_date' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdsdb.task_ci_final SRC 
LEFT OUTER JOIN bbandt_mdsdb.task_final task 
ON task.sourceinstance=SRC.sourceinstance AND task.sys_id=SRC.task  
JOIN bbandt_mdwdb.f_task_ci_c TRGT 
ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) 
WHERE CONVERT_TZ(SRC.sys_created_on,'GMT','America/New_York')<> TRGT.pivot_date
and SRC.cdctype='X' and task.CDCTYPE='X';

/*long running query*/