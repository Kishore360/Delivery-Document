SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem.rca_created_c_flag' ELSE 'SUCCESS' END as Message
 FROM truist_mdsdb.problem_final SRC 
 LEFT JOIN truist_mdwdb.d_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE ( CASE WHEN SRC.u_rca_created =1 then 'Y' else 'N' END)<> (TRGT.rca_created_c_flag )
