SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.incident_final s
left join intuit_mdwdb.d_incident t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
where t.started_on_c <> CONVERT_TZ(s.u_start_date,'GMT','America/Los_Angeles')) temp


