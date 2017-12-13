SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM  (select count(1) as cnt from
(select sourceinstance,sys_id,name  from asu_mdsdb.item_option_new_final  where name='v_department') e
inner join asu_mdsdb.sc_item_option_final b 
on e.sys_id=b.item_option_new
inner join asu_mdsdb.sc_item_option_mtom_final d
on d.sc_item_option=b.sys_id
inner join asu_mdwdb.d_request_item c
on d.request_item=c.row_id and c.source_id=d.sourceinstance
inner join asu_mdwdb.d_internal_organization f on concat('DEPARTMENT~',b.value)=f.row_id and b.sourceinstance=f.source_id
inner join asu_mdwdb.f_request_item_variable_c a 
on SUBSTRING(a.row_id,1,32)= b.sys_id
AND SUBSTRING(a.row_id,34,32)=  d.request_item
 AND a.source_id=b.sourceinstance
WHERE f.row_key <>a.v_department_c_key)a