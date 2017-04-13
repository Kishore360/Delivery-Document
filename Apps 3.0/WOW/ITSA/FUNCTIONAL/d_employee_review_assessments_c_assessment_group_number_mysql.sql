SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_employee_review_assessments_c.assessment_group_number' ELSE 'SUCCESS' END as Message 
FROM wow_mdwdb.d_employee_review_assessments_c trgt
RIGHT JOIN wow_mdsdb.asmt_assessment_instance_final  src ON src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
LEFT JOIN wow_mdsdb.asmt_assessment_final src2 ON src.assessment_group = src2.sys_id and src.sourceinstance = src.sourceinstance
where src2.number <> trgt.assessment_group_number
;
