SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,
CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END 
AS Message 
FROM (
select count(1) as cnt  
from  starwood_mdsdb.incident_final c

left join starwood_mdsdb.u_galaxy_module_final d  
on c.u_module=d.sys_id  

left JOIN  starwood_mdwdb.d_incident b 
on d.sys_id=b.row_id
 where  b.module_c <> d.u_name)b
 