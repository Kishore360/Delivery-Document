SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project_task.percent_complete' ELSE 'SUCCESS' END as Message
FROM  (select * from #MDS_TABLE_SCHEMA.hp_wp_tasks_final where cdctype<>'D') SRC 
LEFT JOIN(select * from #MDS_TABLE_SCHEMA.hp_wp_task_actuals_final)SRC1
on SRC.task_id=SRC1.actuals_id
and SRC.sourceinstance=SRC1.sourceinstance
LEFT JOIN (select * from  #DWH_TABLE_SCHEMA.d_project_task)TRGT   
	ON SRC.task_id =TRGT.row_id 
	and SRC.sourceinstance=TRGT.source_id
where COALESCE(SRC1.perc_complete,'') <>  round(COALESCE(TRGT.percent_complete,''),5)