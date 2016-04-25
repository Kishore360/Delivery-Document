SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.u_incident_task_final s 
left join intuit_mdwdb.f_incident_task_c f 
on s.sys_id=f.row_id and s.sourceinstance = f.source_id 
JOIN   intuit_mdwdb.d_lov_map br 
ON  f.state_src_key = br.src_key   AND br.dimension_wh_code = 'OPEN' 
WHERE DATEDIFF((SELECT MAX(lastupdated) AS lastupdated
FROM intuit_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%'),f.changed_on)<>f.dormancy_age ) temp