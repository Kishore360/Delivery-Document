
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_walk_up_c.opened_by_employee_duration' ELSE 'SUCCESS' END as Message
 FROM pan6_mdwdb.f_walk_up_c f 
 join pan6_mdwdb.d_walk_up_c d
 on f.walk_up_c_key=d.row_key
JOIN pan6_mdwdb.d_internal_contact a 
ON a.row_key = f.opened_by_key 
where f.opened_by_employee_duration <> COALESCE(TIMESTAMPDIFF(day,date(a.employee_start_date_c),date(f.created_on)),0);







 
