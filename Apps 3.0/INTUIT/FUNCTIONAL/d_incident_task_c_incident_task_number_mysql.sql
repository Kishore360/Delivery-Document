SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.u_incident_task_final s
left join intuit_mdwdb.d_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
where s.number<>t.incident_task_number) temp