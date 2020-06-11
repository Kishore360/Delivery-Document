SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project_task.is_in_effort_flag' ELSE 'SUCCESS' END as Message
FROM  (select * from  #MDS_TABLE_SCHEMA.hp_wp_tasks_final where cdctype<>'D') SRC 
LEFT JOIN (select * from   #DWH_TABLE_SCHEMA.d_project_task)TRGT   
	ON SRC.task_id =TRGT.row_id 
	and SRC.sourceinstance=TRGT.source_id
LEFT JOIN (select * from #DWH_TABLE_SCHEMA.d_lov_map)LKP
ON TRGT.project_task_state_src_key=LKP.src_key     
where CASE WHEN dimension_wh_code IN ('IN PROGRESS') THEN 'Y' ELSE 'N' END <> TRGT.is_active_flag 