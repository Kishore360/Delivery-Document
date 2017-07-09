SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_assessment_metrics_c.metric_scale_src_c_code' ELSE 'SUCCESS' END as Message 
FROM wow_mdwdb.d_assessment_metrics_c trgt
RIGHT JOIN wow_mdsdb.asmt_metric_final  src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
where src.scale <> trgt.metric_scale_src_c_code
;