SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_task.new_requested_for_employee_ticket_c_flag' ELSE 'SUCCESS' END as Message
 from pan6_mdwdb.d_request_task a11
JOIN pan6_mdwdb.f_request_task  a12
ON a12.request_task_key = a11.row_key
     LEFT OUTER JOIN
        pan6_mdwdb.d_request d_request 
            ON a12.request_key=d_request.row_key 
left JOIN pan6_mdwdb.d_internal_contact a13 
ON d_request.requested_for_c_key = a13.row_key
WHERE a11.new_requestor_employee_ticket_c_flag <> IF(COALESCE(TIMESTAMPDIFF(DAY,date(a13.employee_start_date_c),
date(a11.opened_on)),-1) >=0 AND COALESCE(TIMESTAMPDIFF(DAY,date(a13.employee_start_date_c),date(a11.opened_on)),-1) <=30,'Y','N')
;

