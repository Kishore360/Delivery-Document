SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from wow_mdsdb.u_incident_task_final s
left join wow_mdwdb.f_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
LEFT JOIN wow_mdwdb.d_domain LKP 
 ON ( s.sys_domain= LKP.row_id 
AND s.sourceinstance= LKP.source_id )
where  COALESCE(LKP.row_key,CASE WHEN s.sys_domain IS NULL THEN 0 else -1 end) <>  t.domain_key 
) temp