SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message  from (
select count(1) cnt from gilead_mdsdb.sc_task_final gh join  
(select a.value,d.sys_id,d.sourceinstance from gilead_mdsdb.sc_req_item_final d join 
gilead_mdsdb.sc_item_option_mtom_final c
on c.request_item = d.sys_id
join gilead_mdsdb.sc_item_option_final a
on c.sc_item_option = a.sys_id 
join gilead_mdsdb.item_option_new_final b
on b.sys_id = a.item_option_new
where b.sys_id='2ed9c51b379f4600580265e2b3990e31')src
on  gh.request_item = src.sys_id #and trgt.source_id = src.sourceinstance
left join gilead_mdwdb.d_request_task trgt
on  gh.sys_id=trgt.row_id and gh.sourceinstance=trgt.source_id 

where trgt.service_item_c<>src.value

)x