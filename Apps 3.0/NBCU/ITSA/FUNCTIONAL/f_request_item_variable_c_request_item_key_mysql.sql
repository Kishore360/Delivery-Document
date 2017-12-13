

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item_variable_c.request_item_key' ELSE 'SUCCESS' END as Message
 FROM nbcu_mdsdb.sc_item_option_final src1 join 
 nbcu_mdsdb.sc_item_option_mtom_final SRC on SRC.sc_item_option = src1.sys_id and SRC.sourceinstance=src1.sourceinstance
 JOIN nbcu_mdwdb.f_request_item_variable_c TRGT 
 ON (concat(src1.sys_id,'~',SRC.request_item) =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN nbcu_mdwdb.d_request_item LKP 
 ON ( SRC.request_item= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.request_item IS NULL THEN 0 else -1 end)<> (TRGT.request_item_key)