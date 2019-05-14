SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' ELSE 'SUCCESS' END AS Message 
FROM (
select count(1) as cnt 
from mcdonalds_mdsdb.incident_task_final s
left join mcdonalds_mdwdb.d_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
where CONVERT_TZ(s.closed_at,'GMT','US/Central')<>t.closed_on) temp;