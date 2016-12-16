SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM cardinalhealth_mdsdb.problem_final SRC 
  JOIN cardinalhealth_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id 
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN cardinalhealth_mdwdb.d_lov LKP 
 ON  COALESCE( CONCAT('KNOWN_ERROR_C','~','PROBLEM','~','~','~',UPPER(SRC.u_known_error_status)),'UNSPECIFIED')= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id 
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_known_error_status IS NULL THEN 0 else -1 end)<> (TRGT.known_error_status_c_key)
 