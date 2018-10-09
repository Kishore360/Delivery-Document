
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident_tasks_c.short_description' ELSE 'SUCCESS' END as Message 
from pan6_mdwdb.d_incident_tasks_c d
JOIN pan6_mdsdb.u_incident_tasks_final i ON d.row_id=i.sys_id AND d.source_id=i.sourceinstance
where 
d.short_description<>i.short_description;