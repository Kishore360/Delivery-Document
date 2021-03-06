SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM ( select count(1) as cnt from gogo_mdsdb.change_request_final s
inner join gogo_mdwdb.d_change_request i on s.sys_id=i.row_id 
and s.sourceinstance=i.source_id
where  coalesce(CONVERT_TZ(s.u_planned_outage_start_date,'GMT','America/Chicago'),' ')<>coalesce( i.planned_outage_start_date_c,' ')
) c;
 

 

