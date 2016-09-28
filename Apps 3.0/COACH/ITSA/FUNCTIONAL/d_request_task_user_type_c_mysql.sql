SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
 from  coach_mdsdb.sc_task_final sc
left join  coach_mdsdb.sc_req_item_final a on
sc.request_item=a.sys_id
left JOIN coach_mdwdb.d_request_task b 
on  b.row_id=sc.sys_id and sc.sourceinstance=b.source_id 
left join coach_mdsdb.sys_user_final c
on a.u_requested_for=c.sys_id
where COALESCE(c.u_user_type,'UNSPECIFIED') <> b.user_type_c ) tmp