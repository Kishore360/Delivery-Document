 
 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from wow_mdsdb.u_rel_incident_final a 
left join wow_mdwdb.d_incident b 
on COALESCE(a.u_parent_incident,'UNSPECIFIED') = b.row_id and a.sourceinstance = b.source_id
 left join wow_mdwdb.f_rel_incident_c c
 on a.sys_id = c.row_id  AND b.source_id =  c.source_id 
 where b.row_key <> c.maintenance_rel_incident_c_key ) temp