SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project_task.project_task_priority_src_key' ELSE 'SUCCESS' END as Message
FROM  (SELECT CASE when priority between 0 and 500 then 1
when priority between  500 and 800 then 2
when priority between 800 and 1000 then 3
else null end as prt,task_info_id,sourceinstance from fidelity_mdsdb.hp_wp_task_info_final where cdctype<>'D')SRC1
left join (select * from fidelity_mdsdb.hp_wp_tasks_final where cdctype<>'D') SRC 
on SRC.task_id=SRC1.task_info_id
LEFT JOIN (select * from  fidelity_mdwdb.d_project_task)TRGT   
	ON SRC.task_id =TRGT.row_id 
	and SRC.sourceinstance=TRGT.source_id
LEFT JOIN fidelity_mdwdb.d_lov LKP 
 ON (concat('PROJECT_TASK','~','PRIORITY','~',SRC1.prt) = LKP.src_rowid 
AND SRC.sourceinstance = LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC1.prt IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.project_task_priority_src_key,'')
 
 
