SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.opened_on_key' ELSE 'SUCCESS' END as Message
FROM 
	nbcu_mdsdb.sc_item_option_final SRC
join
nbcu_mdsdb.sc_item_option_mtom_final SRC2
on SRC2.sc_item_option = SRC.sys_id and SRC.sourceinstance=SRC2.sourceinstance
join
	nbcu_mdwdb.f_request_item_variable_c TRGT 
	ON ((concat(SRC.sys_id,'~',SRC2.request_item) =TRGT.row_id) AND SRC.sourceinstance= TRGT.source_id  )
WHERE  COALESCE(SRC.u_string_value,'UNSPECIFIED')<>TRGT.string_value