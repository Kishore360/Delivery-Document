SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.priority_src_key' ELSE 'SUCCESS' END as Message
 from svb_mdsdb.sc_item_option_final qa  
inner join  svb_mdsdb.sc_item_option_mtom_final b 
on qa.sys_id=b.sc_item_option and qa.sourceinstance = b.sourceinstance 
join svb_mdwdb.d_variable_c d on d.row_id =  qa.item_option_new AND d.source_id =  b.sourceinstance
join svb_mdwdb.f_request_item_variable_c f on concat(qa.sys_id,'~',qa.item_option_new)=f.row_id
where coalesce(d.row_key,case when qa.item_option_new is null then 0 else -1 end )<>variable_c_key


