SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.opened_on_key' ELSE 'SUCCESS' END as Message
FROM 
	qualcomm_mdsdb.sc_item_option_final SRC
JOIN 
qualcomm_mdsdb.item_option_new_final SRC1 
on SRC1.sys_id = SRC.item_option_new
join
qualcomm_mdsdb.sc_item_option_mtom_final SRC2
on SRC2.sc_item_option = SRC.sys_id and SRC.sourceinstance=SRC2.sourceinstance
join
	qualcomm_mdwdb.f_request_item_variable_c TRGT 
	ON ((concat(SRC.sys_id,'~',SRC2.request_item) =TRGT.row_id) AND SRC.sourceinstance= TRGT.source_id  )
join
qualcomm_mdwdb.d_lov LKP
on COALESCE(CONCAT('TYPE~QUESTION~~~',SRC1.type),'UNSPECIFIED') = LKP.row_id and SRC.sourceinstance=LKP.source_id 
WHERE  COALESCE(LKP.row_key,case when SRC1.type is null then 0 else -1 end)<>TRGT.question_type_src_key