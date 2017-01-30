SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.opened_by_key' ELSE 'SUCCESS' END as Message from pan_mdwdb.f_request_item f 
JOIN pan_mdwdb.d_internal_contact a 
ON a.row_key = f.opened_by_key 
WHERE f.opened_by_employee_duration <> TIMESTAMPDIFF(day,f.created_on,a.employee_start_date_c)