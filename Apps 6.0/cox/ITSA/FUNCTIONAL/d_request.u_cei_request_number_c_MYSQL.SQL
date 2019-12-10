SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_request.u_cei_request_number_c' ELSE 'SUCCESS' END as Message
 FROM cox_mdsdb.sc_request_final  SRC JOIN cox_mdwdb.d_request TRGT ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id ) 
 WHERE SRC.u_cei_request_number <> (TRGT.u_cei_request_number_c) 
