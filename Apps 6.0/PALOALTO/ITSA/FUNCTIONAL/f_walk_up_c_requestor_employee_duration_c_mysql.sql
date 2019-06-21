SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_walk_up_c.requestor_employee_duration_c' ELSE 'SUCCESS' END as Message 
FROM pan6_mdwdb.f_walk_up_c trgt
JOIN  (select * from pan6_mdsdb.u_walk_up_final where cdctype<>'D') src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
JOIN pan6_mdwdb.d_walk_up_c d 
 ON trgt.walk_up_c_key = d.row_key
LEFT JOIN pan6_mdwdb.d_internal_contact lkp
ON COALESCE(CONCAT('INTERNAL_CONTACT~',u_requestor),'UNSPECIFIED') =lkp.row_id and src.sourceinstance = lkp.source_id
WHERE requestor_employee_duration_c<>COALESCE(TIMESTAMPDIFF(day,date(a.employee_start_date_c),date(d.opened_on)),0);