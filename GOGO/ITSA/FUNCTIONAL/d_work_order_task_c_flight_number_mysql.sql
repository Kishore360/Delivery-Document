
 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) cnt from gogo_mdsdb.wm_task_final a
left join gogo_mdwdb.d_work_order_task_c b on a.sourceinstance=b.source_id and a.sys_id=b.row_id
where a.u_flight_number  <>b.flight_number


)i; 



