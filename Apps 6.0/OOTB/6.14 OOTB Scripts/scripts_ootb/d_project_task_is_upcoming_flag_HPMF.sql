SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project_task.is_upcoming_flag' ELSE 'SUCCESS' END as Message
FROM  (select * from #MDS_TABLE_SCHEMA.hp_wp_tasks_final where cdctype<>'D') SRC 
LEFT JOIN (select * from  #DWH_TABLE_SCHEMA.d_project_task)TRGT   
	ON SRC.task_id =TRGT.row_id 
	and SRC.sourceinstance=TRGT.source_id
LEFT JOIN(SELECT * FROM #DWH_TABLE_SCHEMA.d_lov_map)LKP
on TRGT.project_task_state_src_key=LKP.src_key    
LEFT join (select source_id,max(lastupdated) as lastupdated from
  #DWH_TABLE_SCHEMA.d_o_data_freshness TRGT
group by source_id) FRSH
on FRSH.source_id=TRGT.source_id
where  case when LKP.dimension_wh_code IN ('OPEN')  AND TRGT.planned_start_date > FRSH.lastupdated then 'Y' else 'N' end <> COALESCE(TRGT.is_upcoming_flag,'')