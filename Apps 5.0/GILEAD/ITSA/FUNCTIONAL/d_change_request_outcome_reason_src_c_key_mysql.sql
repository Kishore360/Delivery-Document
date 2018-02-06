SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.change_outcome_c_key' ELSE 'SUCCESS' END as Message
 FROM gilead_mdsdb.change_request_final SRC 
 LEFT JOIN gilead_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN gilead_mdwdb.d_lov LKP 
 ON ( concat('OUTCOME_REASON_C~CHANGE_REQUEST~~~',SRC.u_outcome_reason))= LKP.src_rowid 
 WHERE COALESCE(LKP.row_key,CASE WHEN u_outcome_reason IS NULL THEN 0 else -1 end)<> (TRGT.outcome_reason_src_c_key);
 
 
	
	