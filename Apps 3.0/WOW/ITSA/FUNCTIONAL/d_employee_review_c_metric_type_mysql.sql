

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_employee_review_c.metric_type' ELSE 'SUCCESS' END as Message 
FROM wow_mdwdb.d_employee_review_c trgt
RIGHT JOIN wow_mdsdb.u_employee_review_final  src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
JOIN wow_mdsdb.asmt_metric_type_final src2 
ON src.u_assessment_metric_type = src2.sys_id and src.sourceinstance = src2.sourceinstance

where src2.name  <> trgt.metric_type
;