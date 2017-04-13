

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_employee_review_c.completed_on' ELSE 'SUCCESS' END as Message 
FROM wow_mdwdb.d_employee_review_c trgt
RIGHT JOIN wow_mdsdb.u_employee_review_final  src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
where CONVERT_TZ(src.u_completed_at,'GMT','US/Central') <> trgt.completed_on
;