SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item_variable_c.row_id' ELSE 'SUCCESS' END as Message
FROM 
	qualcomm_mdsdb.sc_item_option_final SRC
JOIN 
qualcomm_mdsdb.sc_item_option_mtom_final SRC2
on SRC2.sc_item_option = SRC.sys_id and SRC.sourceinstance=SRC2.sourceinstance
join
	qualcomm_mdwdb.f_request_item_variable_c TRGT 
	ON ((concat(SRC.sys_id,'~',SRC2.request_item) =TRGT.row_id) AND SRC.sourceinstance= TRGT.source_id  )
WHERE  (concat(SRC.sys_id,'~',SRC2.request_item))<> TRGT.row_id