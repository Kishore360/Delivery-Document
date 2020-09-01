SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_problem.mean_time_to_identify_c' ELSE 'SUCCESS' END as Message 
from discover_mdsdb.problem_final src
inner join discover_mdwdb.d_problem dim
on src.sys_id=dim.row_id and src.sourceinstance=dim.source_id
inner join discover_mdwdb.f_problem fact
on src.sys_id=fact.row_id and src.sourceinstance=fact.source_id
left join discover_mdwdb.d_incident_alert_c lkp
on dim.incident_alert_c_key=lkp.row_key
where (case when fact.u_incident_start_c>lkp.opened_at_c then 0 
else timestampdiff(second, fact.u_incident_start_c, lkp.opened_at_c) end) <>fact.mean_time_to_identify_c;