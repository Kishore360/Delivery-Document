SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.hp_wp_tasks_final SRC WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #MDS_TABLE_SCHEMA.hp_wp_task_actuals_final SRC2
 on SRC.TASK_ACTUALS_ID = SRC2.ACTUALS_ID and SRC.sourceinstance = SRC2.sourceinstance
  LEFT JOIN #MDS_TABLE_SCHEMA.hp_wp_task_schedule_final SRC3
 on SRC.TASK_SCHEDULE_ID = SRC3.TASK_SCHEDULE_ID and SRC.sourceinstance = SRC3.sourceinstance
   LEFT JOIN #MDS_TABLE_SCHEMA.hp_wp_task_costs_final SRC4
  on SRC.TASK_COST_ID = SRC4.TASK_COST_ID and SRC.sourceinstance = SRC4.sourceinstance
 LEFT JOIN #DWH_TABLE_SCHEMA.f_project_task TRGT
 ON (SRC.TASK_ID=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id ) 
 where COALESCE(TRGT.total_actual_doc_cost,'UNSPECIFIED') <> COALESCE(SRC4.ACT_CAP_LABOR_BSE,0)+COALESCE(SRC4.ACT_CAP_NON_LABOR_BSE,0)+COALESCE(SRC4.ACT_OP_LABOR_BSE,0)+COALESCE(SRC4.ACT_OP_NON_LABOR_BSE,0);