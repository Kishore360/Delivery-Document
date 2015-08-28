

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem_task.open_to_close_duration' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.problem_task_final SRC
 LEFT JOIN <<tenant>>_mdwdb.f_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
WHERE  TIMESTAMPDIFF(second, opened_at, closed_at)<>  COALESCE(TRGT.open_to_close_duration,'') 
