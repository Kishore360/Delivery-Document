SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM ( select count(1) as cnt from gogo_mdsdb.change_request_final s
inner join gogo_mdwdb.f_change_request i on s.sys_id=i.row_id 
and s.sourceinstance=i.source_id
LEFT JOIN gogo_mdwdb.d_calendar_date LKP 
on LKP.row_id = date_format(convert_tz(s.u_planned_outage_start_date,'GMT','America/Chicago'),'%Y%m%d')  
where 
coalesce(LKP.ROW_KEY,case when u_planned_outage_start_date=null then 0 else -1 end)
<>coalesce(i.planned_outage_start_date_c_key))C;
