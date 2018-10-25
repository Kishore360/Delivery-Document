SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident_tasks_c.OPEN_TO_CLOSE_DURATION' ELSE 'SUCCESS' END as Message 
from mcdonalds_mdwdb.f_incident_tasks_c f
join mcdonalds_mdsdb.u_incident_tasks_final i ON f.row_id=i.sys_id AND f.source_id=i.sourceinstance
where 
TIMESTAMPDIFF(second,i.opened_at,i.closed_at) <> f.OPEN_TO_CLOSE_DURATION