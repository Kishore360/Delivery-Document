SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_request.request_status_c_key' ELSE 'SUCCESS' END as Message 
 FROM cox_mdsdb.sc_request_final  SRC JOIN cox_mdwdb.d_request TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id ) 
 LEFT JOIN cox_mdwdb.d_lov LKP ON ( concat( 'STATUS_C~SC_REQUEST~' ,upper( SRC.u_status)) = LKP.row_id AND SRC.sourceinstance = LKP.source_id ) 
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_status IS NULL THEN 0 else -1 end)<>(TRGT.request_status_c_key) 
