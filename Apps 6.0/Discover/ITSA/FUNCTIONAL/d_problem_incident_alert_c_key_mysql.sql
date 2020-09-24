SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_problem.incident_alert_c_key' ELSE 'SUCCESS' END as Message 
from discover_mdsdb.problem_final src
inner join discover_mdwdb.d_problem tgt
on src.sys_id=tgt.row_id and src.sourceinstance=tgt.source_id
left join discover_mdwdb.d_incident_alert_c lkp
on src.u_incident_alert=lkp.row_id and src.sourceinstance=lkp.source_id
where COALESCE(lkp.row_key,CASE WHEN src.u_incident_alert IS NULL THEN 0 else -1 end)<>tgt.incident_alert_c_key;