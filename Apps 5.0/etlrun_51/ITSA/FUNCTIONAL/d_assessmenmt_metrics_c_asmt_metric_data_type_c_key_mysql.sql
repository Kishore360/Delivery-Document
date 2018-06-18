
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_employee_review_c.asmt_metric_data_type_c_key' ELSE 'SUCCESS' END as Message 
FROM wow_mdwdb.d_assessment_metrics_c trgt
RIGHT JOIN wow_mdsdb.asmt_metric_final  src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
LEFT JOIN wow_mdwdb.d_lov lkp
ON COALESCE(CONCAT('DATATYPE_C~ASSESSMENT_METRIC_C~~~',src.datatype),'UNSPECIFIED') =lkp.row_id and src.sourceinstance = lkp.source_id
where COALESCE(lkp.row_key,CASE WHEN src.datatype IS NULL THEN 0 else -1 end)<> trgt.asmt_metric_data_type_c_key
;