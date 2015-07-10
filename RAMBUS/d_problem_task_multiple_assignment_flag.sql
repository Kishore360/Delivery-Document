

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem_task.multiple_assignment_flag' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.u_problem_task_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.d_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( CASE WHEN SRC.reassignment_count >= 1 then 'Y' else 'N' END,'')<> COALESCE(TRGT.multiple_assignment_flag ,'')

