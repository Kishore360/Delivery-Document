
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_employee_review_assessment_c.employee_review_c_key' ELSE 'SUCCESS' END as Message 
FROM ( SELECT CONCAT(src1.sys_id,'~',src3.sys_id) as sys_id,src1.sourceinstance,src2.sys_id as val
FROM
wow_mdsdb.asmt_assessment_instance_final src1 
JOIN wow_mdsdb.u_employee_review_final src2 ON src1.trigger_id = src2.sys_id AND src1.sourceinstance = src2.sourceinstance AND src1.trigger_table ='u_employee_review'
JOIN wow_mdsdb.asmt_assessment_instance_question_final src3 ON src1.sys_id = src3.instance AND src1.sourceinstance = src3.sourceinstance
LEFT JOIN wow_mdsdb.asmt_metric_result_final src4 ON src1.sys_id = src4.instance AND src3.sys_id = src4.instance_question) MAIN_SRC1
LEFT JOIN wow_mdwdb.f_employee_review_assessment_c TRGT ON MAIN_SRC1.sys_id = TRGT.row_id and MAIN_SRC1.sourceinstance= TRGT.source_id
LEFT JOIN wow_mdwdb.d_employee_review_c lkp
ON COALESCE(MAIN_SRC1.val,'UNSPECIFIED') = lkp.row_id and MAIN_SRC1.sourceinstance = lkp.source_id
WHERE COALESCE(lkp.row_key,CASE WHEN MAIN_SRC1.val IS NULL THEN 0 else -1 end) <>employee_review_c_key
;