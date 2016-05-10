SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select count(1) as cnt from (
select u_total_work_duration + u_total_travel_duration as duration ,total_duration from gogo_mdsdb.wm_order_final a
left join gogo_mdwdb.f_work_order_c b on a.sourceinstance=b.source_id and a.sys_id=b.row_id
)s where duration <>total_duration

)i;
