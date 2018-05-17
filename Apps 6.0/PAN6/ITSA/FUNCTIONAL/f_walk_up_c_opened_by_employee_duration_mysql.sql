
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_walk_up_c.opened_by_employee_duration' ELSE 'SUCCESS' END as Message
 FROM pan6_mdwdb.f_walk_up_c f 
JOIN pan6_mdwdb.d_internal_contact a 
ON a.row_key = f.opened_by_key 
where f.opened_by_employee_duration <> COALESCE(TIMESTAMPDIFF(day,a.employee_start_date_c,f.created_on),0)







 
