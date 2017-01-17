

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.change_request_key' ELSE 'SUCCESS' END as Message
 FROM mercuryins_mdsdb.problem_final SRC 
 LEFT JOIN mercuryins_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN mercuryins_mdwdb.d_change_request LKP 
 ON ( COALESCE(SRC.u_caused_by_change,'UNSPECIFIED')= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_caused_by_change IS NULL THEN 0 else -1 end)<> (TRGT.change_request_key)
