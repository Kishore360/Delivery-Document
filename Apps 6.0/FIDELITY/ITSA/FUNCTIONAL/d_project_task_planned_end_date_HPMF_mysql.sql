SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project_task.row_id' ELSE 'SUCCESS' END as Message
FROM  (select * from fidelity_mdsdb.hp_wp_tasks_final where cdctype<>'D') SRC 
LEFT JOIN(select * from fidelity_mdsdb.hp_wp_task_schedule_final)SRC1
on SRC.task_id=SRC1.task_schedule_id
LEFT JOIN (select * from  fidelity_mdwdb.d_project_task)TRGT   
	ON SRC.task_id =TRGT.row_id 
	and SRC.sourceinstance=TRGT.source_id
where COALESCE(convert_tz(SRC1.sched_finish_date,'GMT','America/Los_Angeles'),'')<> COALESCE(TRGT.planned_end_date ,'')