
 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.problem_cause_src_c_key' ELSE 'SUCCESS' END as Message
 FROM nypres_mdsdb.problem_final SRC 
 LEFT JOIN nypres_mdwdb.d_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN nypres_mdwdb.d_lov LKP 
 ON ( concat('U_PROBLEM_CAUSE~PROBLEM~~~',upper(u_problem_cause))= LKP.row_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_problem_cause IS NULL THEN 0 else -1 end)<> COALESCE(TRGT.problem_cause_c_key)
 
 