SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_walk_up_c.new_requestor_employee_ticket_c_flag' ELSE 'SUCCESS' END as Message
 from
 paloalto_mdwdb.d_walk_up_c a11
JOIN paloalto_mdwdb.f_walk_up_c  a12
 ON a12.walk_up_c_key = a11.row_key
JOIN paloalto_mdwdb.d_internal_contact a13 
ON a12.requestor_c_key = a13.row_key
WHERE a11.new_requestor_employee_ticket_c_flag <> IF(COALESCE(TIMESTAMPDIFF(DAY,date(a13.employee_start_date_c),date(a11.opened_on)),-1) >=0 AND COALESCE(TIMESTAMPDIFF(DAY,date(a13.employee_start_date_c),date(a11.opened_on)),-1) <=30,'Y','N')
;