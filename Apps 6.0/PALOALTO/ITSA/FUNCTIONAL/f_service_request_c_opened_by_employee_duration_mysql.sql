
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_service_request_c.open_to_close_duration' ELSE 'SUCCESS' END as Message
 FROM paloalto_mdwdb.f_service_request_c f 
 join paloalto_mdwdb.d_service_request_c d
 on f.service_request_c_key=d.row_key
JOIN paloalto_mdwdb.d_internal_contact a 
ON a.row_key = f.opened_by_key 
where f.opened_by_employee_duration <> COALESCE(TIMESTAMPDIFF(day,a.employee_start_date_c,d.opened_on),0)
and(f.opened_by_employee_duration - COALESCE(TIMESTAMPDIFF(day,a.employee_start_date_c,d.opened_on),0)) not in (1,-1) 
and d.soft_deleted_flag='N'


