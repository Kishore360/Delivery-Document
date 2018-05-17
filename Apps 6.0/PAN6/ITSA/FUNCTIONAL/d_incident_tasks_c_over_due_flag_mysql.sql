SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'MDS TO MDW DATA VALIDATION FAILED'
ELSE 'Data Matched' END AS Message
FROM (
select count(1) as cnt
from pan6_mdwdb.d_incident_tasks_c lkp join pan6_mdsdb.u_incident_tasks_final i 
LEFT JOIN pan6_mdwdb.o_data_freshness fresh 
ON i.SourceInstance = fresh.source_id
AND i.sourceinstance= lkp.source_id where
IF(i.active = TRUE AND i.due_date < fresh.lastupdated,'Y','N') <> lkp.over_due_flag)a;