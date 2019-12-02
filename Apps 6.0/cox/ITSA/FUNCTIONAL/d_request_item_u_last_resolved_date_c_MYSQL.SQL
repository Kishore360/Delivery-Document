SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_request_item.u_last_resolved_date_c' ELSE 'SUCCESS' END as Message 
 FROM cox_mdsdb.sc_req_item_final  SRC JOIN cox_mdwdb.d_request_item TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id ) 
 WHERE convert_tz(SRC.u_last_resolved_date,'GMT','America/New_York')<> (TRGT.u_last_resolved_date_c) 