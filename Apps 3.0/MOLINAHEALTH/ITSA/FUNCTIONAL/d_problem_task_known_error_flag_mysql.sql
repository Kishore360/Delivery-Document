

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem_task.known_error_flag' ELSE 'SUCCESS' END as Message
 FROM molinahealth_mdsdb.problem_task_final SRC 
 
 
 LEFT JOIN molinahealth_mdsdb.problem_final PRB 
 ON (SRC.problem =PRB.sys_id  
 AND SRC.sourceinstance= PRB.sourceinstance  )
 
 LEFT JOIN molinahealth_mdwdb.d_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( 
 -- CASE WHEN PRB.known_error= 1 then 'Y' else 
 'N' 
 -- END 
,'')<> COALESCE(TRGT.known_error_flag ,'')
