SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project_task.row_id' ELSE 'SUCCESS' END as Message
FROM  (select * from #MDS_TABLE_SCHEMA.hp_wp_tasks_final where cdctype<>'D') SRC 
left JOIN (select * from #DWH_TABLE_SCHEMA.d_project_task)TRGT   
	ON SRC.task_id =TRGT.row_id 
	and SRC.sourceinstance=TRGT.source_id
left join (select * from #DWH_TABLE_SCHEMA.f_project_task)LKP1
on  TRGT.project_task_id=LKP1. row_id  
left join(select * from #DWH_TABLE_SCHEMA.d_lov_map) LKP
on  TRGT.project_task_state_src_key=LKP.src_key   
WHERE case when (LKP.dimension_wh_code='CLOSED' AND LKP1.actual_end_on <= LKP1.planned_end_on) THEN 'Y' ELSE 'N' end 
 <> COALESCE(TRGT.is_closed_ontime_flag,'')
