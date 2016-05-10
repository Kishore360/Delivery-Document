SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.opened_on_key' ELSE 'SUCCESS' END as Message
From
	nbcu_workdb.temp1 SRC
join 
	nbcu_mdsdb.sc_item_option_mtom_final SRC1
	on SRC1.sc_item_option=SRC.sys_id
join 
	nbcu_mdsdb.sc_req_item_final SRC2
	on SRC1.request_item=SRC2.sys_id
JOIN 
	nbcu_mdwdb.d_master_item LKP 
	ON (SRC2.cat_item =LKP.row_id 
	AND SRC.sourceinstance= LKP.source_id  )
JOIN 
	nbcu_mdwdb.f_request_item_variable_c TRGT 
	ON ((SRC.row_id =TRGT.row_id) AND SRC.sourceinstance= TRGT.source_id  )
WHERE  COALESCE(LKP.row_key,CASE WHEN SRC2.cat_item IS NULL THEN 0 else -1 end) <> TRGT.catalog_item_key


