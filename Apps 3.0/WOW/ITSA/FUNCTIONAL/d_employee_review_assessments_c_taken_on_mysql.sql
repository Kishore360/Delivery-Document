SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_employee_review_assessments_c.taken_on' ELSE 'SUCCESS' END as Message 
FROM wow_mdwdb.d_employee_review_assessments_c trgt
RIGHT JOIN wow_mdsdb.asmt_assessment_instance_final  src
ON src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
where CONVERT_TZ(src.taken_on,'GMT','US/Central') <> trgt.taken_on
;