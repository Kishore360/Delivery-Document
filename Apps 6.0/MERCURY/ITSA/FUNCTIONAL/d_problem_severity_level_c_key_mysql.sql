SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.severity_src_key' ELSE 'SUCCESS' END as Message
 FROM mercury_mdsdb.problem_final SRC 
 LEFT JOIN mercury_mdwdb.d_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN mercury_mdwdb.d_lov LKP 
 ON ( concat('SEVERITY_LEVEL~PROBLEM~~~',SRC.u_severity_level))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id 
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_severity_level IS NULL THEN 0 else -1 end)<> (TRGT.severity_level_c_key)
 

