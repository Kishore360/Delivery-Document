SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from jnj_mdsdb.incident_final s
left join jnj_mdwdb.f_incident t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
where t.customer_time_c <> TIMESTAMPDIFF(second, '1970-01-01 00:00:00', s.u_customer_time)) temp