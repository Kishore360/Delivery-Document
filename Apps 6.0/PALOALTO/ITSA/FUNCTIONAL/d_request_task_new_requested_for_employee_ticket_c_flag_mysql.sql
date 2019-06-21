SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_task.new_requested_for_employee_ticket_c_flag' ELSE 'SUCCESS' END as Message
 from
 paloalto_mdwdb.d_request_task a11
JOIN paloalto_mdwdb.f_request_task  a12
 ON a12.request_task_key = a11.row_key
JOIN paloalto_mdwdb.d_internal_contact a13 
ON a12.requested_for_key = a13.row_key
WHERE a11.new_requestor_employee_ticket_c_flag <> IF(COALESCE(TIMESTAMPDIFF(DAY,date(a13.employee_start_date_c),date(a11.opened_on)),-1) >=0 AND COALESCE(TIMESTAMPDIFF(DAY,date(a13.employee_start_date_c),date(a11.opened_on)),-1) <=30,'Y','N')
;