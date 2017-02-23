SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM cardinalhealth_mdsdb.problem_task_final SRC 
 LEFT JOIN cardinalhealth_mdsdb.problem_final lkp_s ON SRC.problem=lkp_s.sys_id 
	AND SRC.sourceinstance=lkp_s.sourceinstance
 LEFT JOIN cardinalhealth_mdwdb.f_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN cardinalhealth_mdwdb.d_internal_contact LKP 
 ON COALESCE(CONCAT('INTERNAL_CONTACT','~',lkp_s.u_requested_for),'UNSPECIFIED')= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id 
 WHERE COALESCE(LKP.row_key,CASE WHEN lkp_s.u_requested_for IS NULL THEN 0 else -1 end)<> (TRGT.requested_for_c_key)