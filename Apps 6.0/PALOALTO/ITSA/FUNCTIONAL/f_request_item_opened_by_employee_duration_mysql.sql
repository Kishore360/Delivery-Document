SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.opened_by_key' ELSE 'SUCCESS' END as Message 
 from paloalto_mdwdb.f_request_item f 
 join paloalto_mdwdb.d_request_item d
 on f.request_item_key=d.row_key
 JOIN paloalto_mdwdb.d_internal_contact a 
ON a.row_key = f.opened_by_key 
WHERE f.opened_by_employee_duration <> COALESCE(TIMESTAMPDIFF(DAY,a.employee_start_date_c,d.opened_on),0)