SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from wow_mdsdb.u_incident_task_final s
left join wow_mdwdb.f_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
LEFT JOIN wow_mdwdb.d_calendar_date LKP 
on LKP.row_id = 
COALESCE(DATE_FORMAT(CONVERT_TZ(s.opened_at,'GMT','US/Central'),'%H%i'),'UNSPECIFIED')
WHERE LKP.row_key <> t.opened_time_key) temp