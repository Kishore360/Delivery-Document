SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item_variable_c.catalog_item_key' ELSE 'SUCCESS' END as Message
FROM qualcomm_mdsdb.item_option_new_final SRC
join qualcomm_mdsdb.sc_item_option_final SRC1
on SRC.sys_id = SRC1.item_option_new AND SRC.sourceinstance = SRC1.sourceinstance
join qualcomm_mdsdb.sc_item_option_mtom_final SRC2
on SRC2.sc_item_option = SRC1.sys_id AND SRC2.sourceinstance = SRC1.sourceinstance
join qualcomm_mdwdb.f_request_item_variable_c TRGT 
ON ((concat(SRC1.sys_id,'~',SRC2.request_item) =TRGT.row_id) AND SRC1.sourceinstance= TRGT.source_id  )
join qualcomm_mdwdb.d_master_item LKP
on COALESCE(SRC.cat_item ,'UNSPECIFIED')  = LKP.row_id and SRC.sourceinstance=LKP.source_id
WHERE  COALESCE(LKP.row_key,case when SRC.cat_item is null then 0 else -1 end ) <> TRGT.catalog_item_key and SRC.cdctype='X'