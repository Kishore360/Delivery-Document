SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_task.cost_variance' ELSE 'SUCCESS' END as Message
  FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.hp_wp_tasks_final  WHERE CDCTYPE<>'D') SRC
LEFT JOIN #MDS_TABLE_SCHEMA.hp_wp_task_info_final SRC5
on SRC.TASK_INFO_ID = SRC5.TASK_INFO_ID 
and SRC.sourceinstance = SRC5.sourceinstance 
LEFT JOIN #DWH_TABLE_SCHEMA.f_project_task TRGT 
ON SRC.TASK_ID=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id 
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map LKP
ON LKP.row_id=concat('PROJECT_TASK~STATE~',SRC5.STATUS)
AND LKP.source_id=SRC.sourceinstance
WHERE COALESCE(CASE WHEN LKP.dimension_wh_code IN ('OPEN') THEN 0
       WHEN TRGT.estimated_doc_cost=0 AND TRGT.total_actual_doc_cost=0 THEN 0
		   WHEN TRGT.estimated_doc_cost=0 AND TRGT.total_actual_doc_cost>0 THEN 1
		   WHEN TRGT.planned_percent_complete = 0 AND TRGT.total_actual_doc_cost>0 THEN 1
		   WHEN TRGT.planned_percent_complete = 0 AND TRGT.total_actual_doc_cost=0 THEN 0
       WHEN TRGT.estimated_doc_cost <>0 AND LKP.dimension_wh_code IN ('IN PROGRESS','CLOSED')
       then ROUND((TRGT.total_actual_doc_cost - (TRGT.estimated_doc_cost * TRGT.actual_percent_complete)) /(TRGT.estimated_doc_cost * TRGT.actual_percent_complete), 4) 
       ELSE 0 END,'')<>round(COALESCE(TRGT.cost_variance,''),4)
