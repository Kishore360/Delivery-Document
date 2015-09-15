 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from aaa_mdwdb.d_incident d 
JOIN aaa_mdsdb.incident_final i 
ON i.sys_id=d.row_id 
AND i.sourceinstance=d.source_id 
where d.first_call_resolution_flag<>CASE WHEN TRIM(i.assigned_to)=TRIM(i.resolved_by) AND TIMESTAMPDIFF(hour,i.opened_at,i.resolved_at) < 24 
THEN 'Y' ELSE 'N' END;