-- START
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.opened_by_employee_duration' ELSE 'SUCCESS' END as Message
 from
pan6_mdwdb.f_incident f 
join pan6_mdwdb.d_incident d
on f.incident_key=d.row_key
JOIN pan6_mdwdb.d_internal_contact a 
ON a.row_key = f.opened_by_c_key 
WHERE f.opened_by_employee_duration <> COALESCE(TIMESTAMPDIFF(day,a.employee_start_date_c,d.opened_on),0);
-- END 

