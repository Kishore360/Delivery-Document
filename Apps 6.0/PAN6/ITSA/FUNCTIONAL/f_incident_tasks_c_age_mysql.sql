SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from pan6_mdsdb.u_incident_tasks_final s 
left join pan6_mdwdb.f_incident_tasks_c f 
on s.sys_id=f.row_id and s.sourceinstance = f.source_id 
JOIN pan6_mdwdb.d_incident_tasks_c a 
ON s.sys_id= a.row_id AND s.sourceinstance= a.source_id
JOIN  pan6_mdwdb.d_lov_map br 
ON  a.state_src_key = br.src_key AND br.dimension_wh_code ='OPEN' 
WHERE TIMESTAMPDIFF(second,a.opened_on,(SELECT MAX(lastupdated) AS lastupdated
FROM pan6_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%')) <> f.age ) temp





