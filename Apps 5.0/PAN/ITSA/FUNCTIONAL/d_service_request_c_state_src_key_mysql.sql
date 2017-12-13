SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_service_request_c.state_src_key' ELSE 'SUCCESS' END as Message
 FROM pan_mdsdb.u_service_request_final SRC
LEFT JOIN pan_mdwdb.d_lov LKP 
 ON ( concat('STATE_C~SERVICE_REQUEST_C~~~',upper(state))= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id ) 
 LEFT JOIN pan_mdwdb.d_service_request_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.state IS NULL THEN 0 else -1 end)<> (TRGT.state_src_key)