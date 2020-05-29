SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.hp_wp_tasks_final SRC WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #MDS_TABLE_SCHEMA.hp_wp_task_actuals_final SRC2
 on SRC.TASK_ACTUALS_ID = SRC2.ACTUALS_ID and SRC.sourceinstance = SRC2.sourceinstance
  LEFT JOIN #MDS_TABLE_SCHEMA.hp_wp_task_schedule_final SRC3
 on SRC.TASK_SCHEDULE_ID = SRC3.TASK_SCHEDULE_ID and SRC.sourceinstance = SRC3.sourceinstance
   LEFT JOIN #MDS_TABLE_SCHEMA.hp_wp_task_costs_final SRC4
  on SRC.TASK_COST_ID = SRC4.TASK_COST_ID and SRC.sourceinstance = SRC4.sourceinstance
  LEFT JOIN #MDS_TABLE_SCHEMA.hp_wp_task_info_final SRC5
  on SRC.TASK_INFO_ID = SRC5.TASK_INFO_ID and SRC.sourceinstance = SRC5.sourceinstance
  LEFT JOIN (select * from #MDS_TABLE_SCHEMA.hp_pm_work_plans_final where entity_type='WORK_PLAN')SRC6
  on SRC.WORK_PLAN_ID = SRC6.WORK_PLAN_ID and SRC.sourceinstance = SRC6.sourceinstance
  left join (select * from  #MDS_TABLE_SCHEMA.hp_pm_projects_final where cdctype<>'D') SRC7
on SRC6.project_id=SRC7.project_id
and SRC6.sourceinstance=SRC7.sourceinstance
 LEFT JOIN #DWH_TABLE_SCHEMA.f_project_task TRGT
 ON (SRC.TASK_ID=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id )
left join #DWH_TABLE_SCHEMA.d_project LKP
on  LKP.row_id=SRC7.project_id
and LKP.source_id=SRC7.sourceinstance
where COALESCE(LKP.row_key,case when SRC7.project_id is null then 0 else -1 end)<>COALESCE(TRGT.project_key,'');