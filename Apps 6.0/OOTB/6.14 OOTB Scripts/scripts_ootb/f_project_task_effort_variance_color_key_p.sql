SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_task.effort_variance_color_key' ELSE 'SUCCESS' END as Message
 FROM #DWH_TABLE_SCHEMA.f_project_task TRGT 
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
 ON ( LKP.dimension_class='WH_PROJECT~COLOR~EFFORT_VARIANCE'
AND TRGT.effort_variance BETWEEN LKP.lower_range_value AND LKP.upper_range_value)
 WHERE coalesce(LKP.row_key,  -1) <> COALESCE(TRGT.effort_variance_color_key ,'');