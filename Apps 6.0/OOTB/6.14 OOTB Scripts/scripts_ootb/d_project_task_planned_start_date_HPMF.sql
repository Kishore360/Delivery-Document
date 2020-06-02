SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project_task.planned_end_date' ELSE 'SUCCESS' END as Message
FROM  (select * from  #MDS_TABLE_SCHEMA.hp_wp_tasks_final where cdctype<>'D') SRC 
LEFT JOIN(select * from  #MDS_TABLE_SCHEMA.hp_wp_task_schedule_final)SRC1
on SRC.task_id=SRC1.task_schedule_id
and SRC.sourceinstance=SRC1.sourceinstance
LEFT JOIN (select * from   #DWH_TABLE_SCHEMA.d_project_task)TRGT   
	ON SRC.task_id =TRGT.row_id 
	and SRC.sourceinstance=TRGT.source_id
where COALESCE(convert_tz(SRC1.sched_start_date,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'')<> COALESCE(TRGT.planned_start_date ,'')