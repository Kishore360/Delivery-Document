

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_task.effort_variance_color_key' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdwdb.f_project_task TRGT 
LEFT JOIN <<tenant>>_mdwdb.d_lov LKP 
 ON ( LKP.dimension_class='PROJECT' AND dimension_subtype='EFFORT_VARIANCE'AND dimension_type='COLOR'
AND TRGT.effort_variance BETWEEN LKP.lower_range_value AND LKP.upper_range_value
AND TRGT.source_id= LKP.source_id )
 WHERE LKP.row_key<> COALESCE(TRGT.effort_variance_color_key ,'')
