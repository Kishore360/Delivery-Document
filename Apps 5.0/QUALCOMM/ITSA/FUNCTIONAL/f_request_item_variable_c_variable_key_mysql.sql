SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item_variable_c.variable_c_key' ELSE 'SUCCESS' END as Message
FROM qualcomm_mdsdb.item_option_new_final SRC
join qualcomm_mdsdb.sc_item_option_final SRC1
on SRC.sys_id = SRC1.item_option_new AND SRC.sourceinstance = SRC1.sourceinstance
join qualcomm_mdsdb.sc_item_option_mtom_final SRC2
on SRC2.sc_item_option = SRC1.sys_id AND SRC2.sourceinstance = SRC1.sourceinstance
join qualcomm_mdwdb.d_variable_c LKP
on SRC1.item_option_new = LKP.Row_id and SRC1.sourceinstance=LKP.source_id
join qualcomm_mdsdb.sc_req_item_final d 
on d.sys_id = SRC2.request_item and d.sourceinstance = SRC2.sourceinstance
join qualcomm_mdsdb.sc_task_final tf
on tf.request_item = SRC2.request_item
and tf.sourceinstance = SRC2.sourceinstance
join  qualcomm_mdsdb.sc_item_variables_task_final vt 
on vt.variable = SRC.sys_id and vt.task =  tf.sys_id 
join qualcomm_mdwdb.f_request_item_variable_c TRGT 
ON ((concat(SRC1.sys_id,'~',vt.task) =TRGT.row_id) AND SRC1.sourceinstance= TRGT.source_id  )
and SRC.type  in (1,2,3,5,6,7,8,9,10,16,18,24,4)
WHERE  COALESCE(LKP.row_key,case when SRC1.item_option_new is null then 0 else -1 end )= TRGT.variable_c_key;