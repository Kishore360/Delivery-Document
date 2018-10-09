SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident_tasks_c.due_on' ELSE 'SUCCESS' END as Message 
from pan6_mdwdb.d_incident_tasks_c f
join pan6_mdsdb.u_incident_tasks_final i ON f.row_id=i.sys_id AND f.source_id=i.sourceinstance
where
CONVERT_TZ(i.due_date,'GMT','America/Los_Angeles') <> f.due_on;