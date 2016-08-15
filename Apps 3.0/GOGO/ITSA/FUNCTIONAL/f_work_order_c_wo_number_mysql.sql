SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) cnt from gogo_mdsdb.wm_order_final a
left join gogo_mdwdb.f_work_order_c b on a.sourceinstance=b.source_id and a.sys_id=b.row_id
where a.number <>b.wo_number

)i;