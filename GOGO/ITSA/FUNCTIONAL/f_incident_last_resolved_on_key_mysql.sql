SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM ( select count(1) as cnt from gogo_mdsdb.incident_final s
left outer join gogo_mdwdb.d_calendar_date j on 
date_format(s.u_resolved,'%Y%m%%d')=j.row_id
inner join gogo_mdwdb.f_incident i on s.sys_id=i.row_id 
and s.sourceinstance=i.source_id
where  j.row_key
<>coalesce(i.last_resolved_on_key,'0')
) c;

