SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_task.schedule_variance' ELSE 'SUCCESS' END as Message 
   FROM  (select * from #MDS_TABLE_SCHEMA.prtask_final SRC  where cdctype<>'D') SRC 
inner join(select * from #MDS_TABLE_SCHEMA.inv_investments_final where odf_object_code='project' and cdctype<>'D') SRC1 
on SRC.prprojectid=SRC1.id
INNER join(select * from  #MDS_TABLE_SCHEMA.inv_projects_final WHERE is_program=0 and is_template=0)SRC10
 ON  SRC1.id=SRC10.prid
inner join (select * from  #MDS_TABLE_SCHEMA.prj_ev_history_final   where object_type='TASK') SRC2
on  SRC.prid = SRC2.object_id and SRC.sourceinstance = SRC2.sourceinstance
       LEFT JOIN #DWH_TABLE_SCHEMA.f_project_task TRGT 
   on SRC.PRID = TRGT.row_id and SRC.sourceinstance = TRGT.source_id
 	LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map LKP
ON LKP.row_id=concat('PROJECT_TASK~STATE~',SRC.PRSTATUS)
AND LKP.source_id=SRC.sourceinstance
where round(coalesce(CASE WHEN LKP.dimension_wh_code IN ('OPEN') THEN 0 
WHEN TRGT.actual_percent_complete = 0 THEN 0 
WHEN TRGT.planned_duration = 0 AND TRGT.actual_duration = 0 THEN 0
 WHEN TRGT.planned_duration = 0 AND TRGT.actual_duration > 0 THEN 1 
 WHEN TRGT.planned_duration != 0 AND LKP.dimension_wh_code IN ('CLOSED') THEN ROUND((TRGT.actual_duration - TRGT.planned_duration)/TRGT.planned_duration,4)
 ELSE ROUND((TRGT.week_day_count - (TRGT.actual_percent_complete * TRGT.planned_duration)) / (TRGT.actual_percent_complete * TRGT.planned_duration),4) END,0),10)
<> coalesce(TRGT.schedule_variance,10)
 