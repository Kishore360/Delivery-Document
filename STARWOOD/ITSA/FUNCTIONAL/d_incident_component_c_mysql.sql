 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from starwood_mdsdb.task_final a
inner join starwood_mdsdb.incident_final c
 on a.sys_id=c.sys_id
inner  JOIN  starwood_mdsdb.incident_classification b
 on a.u_component=b.sys_id 
left join starwood_mdwdb.d_incident d
 on a.SYS_ID= d.ROW_ID and a.sourceinstance=d.source_id 
where  b.u_component <> d.component_c)z