SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from wow_mdsdb.u_incident_outage_final a
left join wow_mdwdb.d_incident b
 on a.sys_id=b.row_id and a.sourceinstance=b.source_id 
where case when a.u_on_generator='0'then 'N' else 'Y' end<>b.on_generator_c)g
