SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from wow_mdsdb.u_rel_incident_final a
left join wow_mdwdb.f_rel_incident_c b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id 
where  a.u_rel_battery_date_code <> b.rel_battery_date_code_c)g


