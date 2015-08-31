SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result

,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 

FROM (
select count(1) as cnt  
from  starwood_mdsdb.task_final a

left join starwood_mdsdb.cmdb_ci_service_final b
 on a.u_service=
b.sys_id
left JOIN  starwood_mdwdb.d_incident c on
 a.sys_id=c.row_id and a.sourceinstance=c.source_id

where  
case when b.name not in ('ISAC - Integrated Sales & Catering') then 'Y' else 'N' end <>c.revenue_impacting_c_flag
)b 