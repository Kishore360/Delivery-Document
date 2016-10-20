SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.opened_on_key' ELSE 'SUCCESS' END as Message
FROM 
	nbcu_mdsdb.sc_item_option_final SRC
LEFT JOIN 
	nbcu_mdwdb.f_request_item_variable_c TRGT 
	ON (SRC.sys_id =TRGT.row_id AND SRC.sourceinstance= TRGT.source_id  )
WHERE  SRC.u_string_value <> TRGT.string_value