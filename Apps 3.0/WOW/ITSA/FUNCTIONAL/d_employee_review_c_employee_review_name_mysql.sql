SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_employee_review_c.employee_review_name' ELSE 'SUCCESS' END as Message 
FROM wow_mdwdb.d_employee_review_c trgt
RIGHT JOIN wow_mdsdb.u_employee_review_final  src
ON src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
where src.u_name  <> trgt.employee_review_name
;