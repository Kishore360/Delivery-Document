SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM ( 
select count(*) as cnt from rei_mdwdb.d_incident a
JOIN rei_mdsdb.incident_final b ON (a.row_id =b.sys_id AND b.opened_by=b.u_original_resolver AND b.u_original_resolver=b.u_last_resolver AND DATE(b.opened_at) = DATE(u_last_resolution_date)
AND DATE(b.opened_at) = DATE(b.u_original_resolution_date))
where first_call_resolution_flag <>'Y')c;