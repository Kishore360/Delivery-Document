SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.new_caller_employee_ticket_c_flag' ELSE 'SUCCESS' END as Message
 from
 pan6_mdwdb.d_incident a11
JOIN pan6_mdwdb.f_incident  a12
 ON a12.incident_key = a11.row_key
JOIN pan6_mdwdb.d_internal_contact a13 
ON a12.opened_by_key = a13.row_key
WHERE a11.new_caller_employee_ticket_c_flag <> IF(COALESCE(TIMESTAMPDIFF(DAY,date(a13.employee_start_date_c),date(a11.opened_on)),-1) >=0 AND COALESCE(TIMESTAMPDIFF(DAY,date(a13.employee_start_date_c),date(a11.opened_on)),-1) <=30,'Y','N')
;


