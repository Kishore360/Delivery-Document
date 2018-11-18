SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project_task.is_upcoming_flag' ELSE 'SUCCESS' END as Message
FROM  (select * from fidelity_mdsdb.hp_wp_tasks_final where cdctype<>'D') SRC 
LEFT JOIN (select * from  fidelity_mdwdb.d_project_task)TRGT   
	ON SRC.task_id =TRGT.row_id 
	and SRC.sourceinstance=TRGT.source_id
where (is_upcoming_flag<>'N')