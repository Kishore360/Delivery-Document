 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem.it_problem_technical_data_c' ELSE 'SUCCESS' END as Message
 FROM bbandt_mdsdb.problem_final SRC 
  JOIN   bbandt_mdwdb.d_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE SRC.u_it_problem_technical_data  <>TRGT.it_problem_technical_data_c
 
 
 