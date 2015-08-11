SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  from homedepot_mdsdb.incident_final a
left join homedepot_mdwdb.d_calendar_date c
on  DATE_FORMAT(a.u_incident_resolved_date_time,'%Y%m%d') = c.row_id 
and a.sourceinstance =c.source_id
inner  JOIN  homedepot_mdwdb.f_incident b
on  a.SYS_ID =  b.ROW_ID and a.sourceinstance=b.source_id 
 where c.row_key<> b.last_resolved_on_key)b;

