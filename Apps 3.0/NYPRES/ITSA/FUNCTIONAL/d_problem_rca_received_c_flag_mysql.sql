
  SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem.rca_received_c_flag' ELSE 'SUCCESS' END as Message
 FROM nypres_mdsdb.problem_final SRC 
 LEFT JOIN nypres_mdwdb.d_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE ( CASE WHEN u_rca_received = 1 then 'Y' else 'N' END)<> (TRGT.rca_received_c_flag) 
 
 