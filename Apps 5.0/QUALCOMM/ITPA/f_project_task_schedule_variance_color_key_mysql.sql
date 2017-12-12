

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_task.schedule_variance_color_key' ELSE 'SUCCESS' END as Message
 FROM qualcomm_mdwdb.f_project_task TRGT 
LEFT JOIN qualcomm_mdwdb.d_lov LKP 
 ON ( LKP.dimension_class='PROJECT' AND dimension_subtype='SCHEDULE_VARIANCE'AND dimension_type='COLOR'
AND TRGT.schedule_variance BETWEEN LKP.lower_range_value AND LKP.upper_range_value
AND TRGT.source_id= LKP.source_id )
 WHERE LKP.row_key<> COALESCE(TRGT.schedule_variance_color_key ,'')
