SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.opened_by_employee_duration' ELSE 'SUCCESS' END as Message
 FROM 
 
(select count(1) as cnt 
 
from 
(select sys_id, sourceinstance, caller_id from paloalto_mdsdb.incident_final where CDCTYPE<>'D' ) SRC 

JOIN paloalto_mdwdb.f_incident TRGT ON SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
 
JOIN paloalto_mdwdb.d_incident TRGT1 on TRGT.incident_key=TRGT1.row_key
 
join paloalto_mdwdb.d_internal_contact LKP on COALESCE(CONCAT('INTERNAL_CONTACT~',SRC.caller_id),'UNSPECIFIED')=LKP.row_id
 
WHERE TRGT.caller_by_employee_duration_c <> COALESCE(TIMESTAMPDIFF(day,date(LKP.employee_start_date_c),date(TRGT1.opened_on)),0))temp;