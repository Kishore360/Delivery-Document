
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_service_request_c.open_to_close_duration' ELSE 'SUCCESS' END as Message
 FROM pan_mdwdb.f_service_request_c f 
JOIN pan_mdwdb.d_internal_contact a 
ON a.row_key = f.opened_by_key 
where f.opened_by_employee_duration <> COALESCE(TIMESTAMPDIFF(day,a.employee_start_date_c,f.created_on),0)


