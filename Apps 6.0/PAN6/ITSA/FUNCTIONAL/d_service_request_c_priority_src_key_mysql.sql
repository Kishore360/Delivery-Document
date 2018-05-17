SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_service_request_c.priority_src_key' ELSE 'SUCCESS' END as Message
 FROM pan6_mdsdb.u_service_request_final SRC
LEFT JOIN pan6_mdwdb.d_lov LKP 
 ON ( concat('PRIORITY_C~SERVICE_REQUEST_C~~~',upper(priority))= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id ) 
 LEFT JOIN pan6_mdwdb.d_service_request_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.priority IS NULL THEN 0 else -1 end)<> (TRGT.priority_src_key)