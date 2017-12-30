

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item_variable_c.request_item_key' ELSE 'SUCCESS' END as Message
 FROM qualcomm_mdsdb.sc_item_option_mtom_final SRC 
 LEFT JOIN qualcomm_mdwdb.f_request_item_variable_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN qualcomm_mdwdb.d_request_item LKP 
 ON ( SRC.sys_id= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.sys_id IS NULL THEN 0 else -1 end)<> (TRGT.request_item_key)

 
 