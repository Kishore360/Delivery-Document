SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.opened_on_key' ELSE 'SUCCESS' END as Message
FROM 
	nbcu_mdsdb.sc_item_option_final SRC
LEFT JOIN 
	nbcu_mdsdb.sc_item_option_final SRC1
	on SRC1.item_option_new=SRC.sys_id and SRC.sourceinstance=SRC1.sourceinstance
LEFT JOIN 
 nbcu_mdsdb.sc_item_option_mtom_final SRC2
 on SRC2.sc_item_option = SRC1.sys_id and SRC.sourceinstance=SRC2.sourceinstance
left join
	nbcu_mdwdb.f_request_item_variable_c TRGT 
	ON (concat(SRC.sys_id,'~',SRC2.request_item =TRGT.row_id) AND SRC.sourceinstance= TRGT.source_id  )
WHERE  SRC.sys_id<> TRGT.row_id