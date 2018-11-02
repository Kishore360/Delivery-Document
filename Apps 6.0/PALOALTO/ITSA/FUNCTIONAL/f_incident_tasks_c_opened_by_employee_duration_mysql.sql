SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.opened_by_key' ELSE 'SUCCESS' END as Message from paloalto_mdwdb.f_incident_tasks_c f 
JOIN paloalto_mdwdb.d_internal_contact a 
ON a.row_key = f.opened_by_c_key 
WHERE f.opened_by_employee_duration <> COALESCE(TIMESTAMPDIFF(day,a.employee_start_date_c,f.created_on),0);
-- END 
