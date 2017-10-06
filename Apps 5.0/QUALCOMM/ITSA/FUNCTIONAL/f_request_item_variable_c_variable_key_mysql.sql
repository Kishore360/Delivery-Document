SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item_variable_c.variable_c_key' 
ELSE 'SUCCESS' END as Message
FROM 
	qualcomm_mdsdb.sc_item_option_final SRC
join
qualcomm_mdsdb.sc_item_option_mtom_final SRC2
on SRC2.sc_item_option = SRC.sys_id and SRC.sourceinstance=SRC2.sourceinstance
join
	qualcomm_mdwdb.f_request_item_variable_c TRGT 
	ON ((concat(SRC.sys_id,'~',SRC2.request_item) =TRGT.row_id) AND SRC.sourceinstance= TRGT.source_id  )
join
qualcomm_mdwdb.d_variable_c LKP
on SRC.item_option_new = LKP.Row_id and SRC.sourceinstance=LKP.source_id
WHERE  COALESCE(LKP.row_key,case when SRC.item_option_new is null then 0 else -1 end )<>TRGT.variable_c_key;