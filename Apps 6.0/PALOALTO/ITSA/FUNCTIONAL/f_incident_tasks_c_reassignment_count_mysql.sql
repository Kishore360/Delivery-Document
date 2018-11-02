SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident_tasks_c.reassignment_count' ELSE 'SUCCESS' END as Message 
from paloalto_mdwdb.f_incident_tasks_c d
JOIN paloalto_mdsdb.u_incident_tasks_final i ON d.row_id=i.sys_id AND d.source_id=i.sourceinstance
where 
d.reassignment_count<>i.reassignment_count;