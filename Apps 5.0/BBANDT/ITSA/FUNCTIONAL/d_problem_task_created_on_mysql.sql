SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_problem_task.created_on' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT   
FROM bbandt_mdsdb.problem_task_final SRC  LEFT JOIN bbandt_mdwdb.d_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) 
 WHERE convert_tz(SRC.sys_created_on,'GMT','America/New_York')<> TRGT.created_on)temp;
 
