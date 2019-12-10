SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_request_item.request_item_sub_status1_c_key' ELSE 'SUCCESS' END as Message 
 FROM cox_mdsdb.sc_req_item_final  SRC JOIN cox_mdwdb.d_request_item TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id ) 
 LEFT JOIN cox_mdwdb.d_lov LKP ON ( concat( 'SUB_STATUS1_C~SC_REQ_ITEM~' ,upper( SRC.u_sub_status1)) = LKP.row_id AND SRC.sourceinstance = LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_sub_status1 IS NULL THEN 0 else -1 end)<>(TRGT.request_item_sub_status1_c_key) 
