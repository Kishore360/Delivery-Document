 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.state_src_key' ELSE 'SUCCESS' END as Message
 FROM molinahealth_mdsdb.change_request_final SRC 
 LEFT JOIN molinahealth02_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN molinahealth02_mdwdb.d_lov LKP 
 ON ( concat('COMPLETION_STATUS_C~CHANGE_REQUEST~~~',SRC.u_completion_status))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id 
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_completion_status IS NULL THEN 0 else -1 end)<> (TRGT.completion_status_src_c_key)