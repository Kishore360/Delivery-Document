SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.incident_final s
left join intuit_mdwdb.d_incident t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
LEFT JOIN intuit_mdsdb.sys_user_group_final c
ON s.u_resolver_group = c.sys_id
where t.resolver_group_c <> COALESCE(c.name,'UNSPECIFIED')) temp