

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.state_src_code' ELSE 'SUCCESS' END as Message
 FROM uclahealth_mdsdb.problem_final SRC 
 LEFT JOIN uclahealth_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.state,'')<> COALESCE(TRGT.state_src_code ,'')
