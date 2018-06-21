SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.opened_by_key' ELSE 'SUCCESS' END as Message 
  from pan6_mdwdb.f_request_task f 
 join pan6_mdwdb.d_request_task d
 on f.request_task_key=d.row_key
JOIN pan6_mdwdb.d_internal_contact a 
ON a.row_key = f.opened_by_key 
WHERE f.opened_by_employee_duration <> COALESCE(TIMESTAMPDIFF(DAY,date(a.employee_start_date_c),date(f.created_on)),0)