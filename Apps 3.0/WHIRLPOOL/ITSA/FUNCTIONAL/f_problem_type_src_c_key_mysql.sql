SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM whirlpool_mdsdb.problem_final SRC 
 LEFT JOIN whirlpool_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN whirlpool_mdwdb.d_lov LKP 
 ON ( COALESCE(CONCAT('U_TYPE~PROBLEM~~~',UPPER(SRC.u_type )),'UNSPECIFIED')= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_type IS NULL THEN 0 else -1 end)<> (TRGT.type_src_c_key)