SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_task.cost_variance_color_key' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM   #MDS_TABLE_SCHEMA.hp_wp_tasks_final  WHERE CDCTYPE<>'D') SRC
LEFT JOIN   #MDS_TABLE_SCHEMA.hp_wp_task_info_final SRC5
on SRC.TASK_INFO_ID = SRC5.TASK_INFO_ID 
and SRC.sourceinstance = SRC5.sourceinstance 
LEFT JOIN   #DWH_TABLE_SCHEMA.f_project_task TRGT 
ON SRC.TASK_ID=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id 
LEFT JOIN   #DWH_TABLE_SCHEMA.d_lov LKP 
ON coalesce(TRGT.effort_variance,'') BETWEEN LKP.lower_range_value AND LKP.upper_range_value
AND LKP.dimension_class = 'WH_PROJECT~COLOR~EFFORT_VARIANCE'
WHERE COALESCE(LKP.row_key,CASE WHEN TRGT.effort_variance IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.effort_variance_color_key,'')    


