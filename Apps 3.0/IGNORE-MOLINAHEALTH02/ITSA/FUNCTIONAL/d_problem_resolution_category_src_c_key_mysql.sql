 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.state_src_key' ELSE 'SUCCESS' END as Message
 FROM molinahealth_mdsdb.problem_final SRC 
 LEFT JOIN molinahealth02_mdwdb.d_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN molinahealth02_mdwdb.d_lov LKP 
 ON ( concat('RESOLUTION_CATEGORY_C~PROBLEM~~~',SRC.u_resolution_category))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id 
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_resolution_category IS NULL THEN 0 else -1 end)<> (TRGT.resolution_category_src_c_key)