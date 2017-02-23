SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from cardinalhealth_mdwdb.d_incident_component_c si 
JOIN cardinalhealth_mdsdb.u_incident_component_final id ON id.sys_id=si.row_id
	and id.sourceinstance=si.source_id  
where id.u_component<>si.component)c
