SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message  from (
select count(1) cnt from 
(select a.value,d.sys_id,d.sourceinstance from gilead_mdsdb.sc_req_item_final d join 
gilead_mdsdb.sc_item_option_mtom_final c
on c.request_item = d.sys_id
join gilead_mdsdb.sc_item_option_final a
on c.sc_item_option = a.sys_id 
join gilead_mdsdb.item_option_new_final b
on b.sys_id = a.item_option_new
where b.sys_id='f3db44240f9e42007f9722d8b1050ee8')src
left join gilead_mdwdb.d_request_item TRGT
on src.sys_id= TRGT.row_id
and src.sourceinstance=TRGT.source_id
where request_type_c<> src.value)x