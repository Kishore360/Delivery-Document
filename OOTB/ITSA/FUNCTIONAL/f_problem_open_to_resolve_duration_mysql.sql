

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.open_to_resolve_duration' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.problem_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( null,'')<> COALESCE(TRGT.open_to_resolve_duration ,'')