 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from 
svb_mdwdb.d_configuration_item f
join svb_mdsdb.cmdb_ci_final cfid
on f.row_id = cfid.sys_id and f.source_id= cfid.sourceinstance
left join svb_mdsdb.cmdb_ci_server_final cs
on f.row_id = cs.sys_id and f.source_id= cs.sourceinstance
left join svb_mdsdb.cmdb_ci_appl_final ca
on cs.u_primary_application = ca.sys_id and cs.sourceinstance= ca.sourceinstance 
where  ca.name<>f.primary_application_c

 )c
	