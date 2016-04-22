SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.opened_on_key' ELSE 'SUCCESS' END as Message
FROM 
	nbcu_mdsdb.sc_item_option_final SRC
LEFT JOIN 
	nbcu_mdwdb.f_request_item_variable_c TRGT 
	ON (SRC.sys_id =TRGT.row_id AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN 
	nbcu_mdwdb.d_variable_c LKP 
	ON (SRC.item_option_new =LKP.row_id AND SRC.sourceinstance= LKP.source_id  )
WHERE  COALESCE(LKP.row_key,CASE WHEN SRC.item_option_new IS NULL THEN 0 else -1 end) <> TRGT.variable_key
