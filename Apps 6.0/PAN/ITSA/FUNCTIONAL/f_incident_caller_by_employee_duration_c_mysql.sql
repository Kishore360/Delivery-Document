-- START
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.opened_by_employee_duration' ELSE 'SUCCESS' END as Message
 FROM pan6_mdsdb.incident_final SRC 
JOIN pan6_mdwdb.f_incident TRGT 
ON SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
JOIN pan6_mdwdb.d_incident TRGT1
on TRGT.incident_key=TRGT1.row_key
join pan6_mdwdb.d_internal_contact LKP
on COALESCE(CONCAT('INTERNAL_CONTACT~',SRC.caller_id),'UNSPECIFIED')=LKP.row_id
WHERE TRGT.caller_by_employee_duration_c <> COALESCE(TIMESTAMPDIFF(day,date(LKP.employee_start_date_c),date(TRGT1.opened_on)),0);

