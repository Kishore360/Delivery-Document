SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_request_item.request_item_approval_state_src_c_key' ELSE 'SUCCESS' END as Message 
FROM wpl_mdsdb.sc_req_item_final  SRC 
JOIN wpl_mdwdb.d_request_item TRGT 
ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )  
LEFT JOIN wpl_mdwdb.d_lov LKP 
ON ( concat( 'APPROVAL~SC_REQ_ITEM~' ,upper( SRC.approval)) = LKP.row_id AND SRC.sourceinstance = LKP.source_id ) 
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.approval IS NULL THEN 0 else -1 end)<> (TRGT.request_item_approval_state_src_c_key) ;
