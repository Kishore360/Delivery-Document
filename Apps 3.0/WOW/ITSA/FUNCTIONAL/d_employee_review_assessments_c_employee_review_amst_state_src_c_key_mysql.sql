

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_employee_review_assessments_c.employee_review_amst_state_src_c_key' ELSE 'SUCCESS' END as Message 

FROM wow_mdwdb.d_employee_review_assessments_c trgt
RIGHT JOIN wow_mdsdb.asmt_assessment_instance_final  src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
LEFT JOIN wow_mdwdb.d_lov lkp
ON COALESCE(CONCAT('STATE_C~EMPLOYEE_REVIEW_ASSESSMENT_C~~~',src.state),'UNSPECIFIED') =lkp.row_id and src.sourceinstance = lkp.source_id
where COALESCE(lkp.row_key,CASE WHEN src.state IS NULL THEN 0 else -1 end)<> trgt.employee_review_amst_state_src_c_key
;