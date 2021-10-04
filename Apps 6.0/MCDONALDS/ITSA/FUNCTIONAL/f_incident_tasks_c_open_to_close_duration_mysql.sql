SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident_tasks_c.OPEN_TO_CLOSE_DURATION' ELSE 'SUCCESS' END as Message 
from mcd_mdwdb.f_incident_task_c f
join mcd_mdsdb.incident_task_final i ON f.row_id=i.sys_id AND f.source_id=i.sourceinstance
where 
TIMESTAMPDIFF(second,convert_tz(i.opened_at,'GMT','America/Los_Angeles'),convert_tz(i.closed_at,'GMT','America/Los_Angeles')) <> f.OPEN_TO_CLOSE_DURATION