SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project_task.project_task_state_src_key' ELSE 'SUCCESS' END as Message
FROM  (select * from #MDS_TABLE_SCHEMA.hp_wp_tasks_final where cdctype<>'D') SRC 
LEFT JOIN(select * from #MDS_TABLE_SCHEMA.hp_wp_task_info_final)SRC1
on SRC.task_id=SRC1.task_info_id
and SRC.sourceinstance=SRC1.sourceinstance
LEFT JOIN (select * from  #DWH_TABLE_SCHEMA.d_project_task)TRGT   
	ON SRC.task_id =TRGT.row_id 
	and SRC.sourceinstance=TRGT.source_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
 ON (concat('PROJECT_TASK','~','STATE','~',status) = LKP.src_rowid 
AND SRC.sourceinstance = LKP.source_id )
WHERE COALESCE(LKP.row_key,CASE WHEN SRC1.status IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.project_task_state_src_key,'')    
