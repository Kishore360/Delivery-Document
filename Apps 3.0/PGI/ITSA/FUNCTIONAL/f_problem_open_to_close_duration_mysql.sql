

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.open_to_close_duration' ELSE 'SUCCESS' END as Message
 FROM pgi_mdsdb.problem_final SRC
 LEFT JOIN pgi_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
WHERE  TIMESTAMPDIFF(second, sys_created_on, closed_at)<>  COALESCE(TRGT.open_to_close_duration,'') 
