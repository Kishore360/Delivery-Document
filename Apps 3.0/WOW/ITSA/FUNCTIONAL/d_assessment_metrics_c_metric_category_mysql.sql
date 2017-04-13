

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_assessment_metrics_c.metric_category' ELSE 'SUCCESS' END as Message 
FROM wow_mdwdb.d_assessment_metrics_c trgt
RIGHT JOIN wow_mdsdb.asmt_metric_final  src
ON src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
LEFT JOIN wow_mdsdb.asmt_metric_category_final src2 on src.category = src2.sys_id and src.sourceinstance = src2.sourceinstance
where src2.name  <> trgt.metric_category
;