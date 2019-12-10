SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_request_item.u_cei_flag_c' ELSE 'SUCCESS' END as Message 
 FROM cox_mdsdb.sc_req_item_final  SRC JOIN cox_mdwdb.d_request_item TRGT ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id ) 
 WHERE (CASE WHEN SRC.u_cei = 1 then 'Y' else 'N' END)<>(TRGT.u_cei_flag_c) 
