

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem_task.created_by' ELSE 'SUCCESS' END as Message
 FROM molinahealth_mdsdb.problem_task_final SRC 
 LEFT JOIN molinahealth02_mdwdb.d_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.sys_created_by,'')<> COALESCE(TRGT.created_by ,'')
