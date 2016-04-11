

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem_task.problem_key' ELSE 'SUCCESS' END as Message
 FROM molinahealth_mdsdb.problem_task_final SRC 
 LEFT JOIN molinahealth_mdwdb.f_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN molinahealth_mdwdb.d_problem LKP 
 ON ( SRC.problem= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.problem IS NULL THEN 0 else -1 end)<> (TRGT.problem_key)
