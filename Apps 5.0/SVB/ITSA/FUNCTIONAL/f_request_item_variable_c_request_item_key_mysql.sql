SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.has_breached_update_c_flag' ELSE 'SUCCESS' END as Message from 
(SELECT b.sourceinstance,d.row_key,concat(qa.sys_id,'~',b.request_item) as row_id,request_item
 from svb_mdsdb.sc_item_option_final qa  
inner join  svb_mdsdb.sc_item_option_mtom_final b 
on qa.sys_id=b.sc_item_option and qa.sourceinstance = b.sourceinstance 
join svb_mdwdb.d_request_item d on d.row_id =  b.request_item AND d.source_id =  b.sourceinstance
)a
join svb_mdwdb.f_request_item_variable_c f on a.row_id=f.row_id and a.sourceinstance=source_id
where coalesce(a.row_key,case when request_item is null then 0 else -1 end )<>request_item_key

