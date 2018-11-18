SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project_task.row_id' ELSE 'SUCCESS' END as Message
FROM  (select * from fidelity_mdsdb.hp_wp_tasks_final where cdctype<>'D') SRC 
LEFT JOIN(select * from fidelity_mdsdb.hp_wp_task_info_final)SRC1
on SRC.task_id=SRC1.task_info_id
LEFT JOIN (select * from  fidelity_mdwdb.d_project_task)TRGT   
	ON SRC.task_id =TRGT.row_id 
	and SRC.sourceinstance=TRGT.source_id
LEFT JOIN fidelity_mdwdb.d_lov LKP 
 ON (concat('PROJECT_TASK','~','STATE','~',status) = LKP.src_rowid 
AND SRC.sourceinstance = LKP.source_id )
WHERE COALESCE(LKP.row_key,CASE WHEN SRC1.status IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.project_task_state_src_key,'')    
