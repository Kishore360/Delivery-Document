
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.category_src_code' ELSE 'SUCCESS' END as Message
 FROM rambus_mdsdb.problem_final SRC 
 LEFT JOIN rambus_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( u_application,'')<> COALESCE(TRGT.category_src_code ,'')