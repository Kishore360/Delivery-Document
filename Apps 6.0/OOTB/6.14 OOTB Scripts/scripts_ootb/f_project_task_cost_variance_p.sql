SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_task.cost_variance' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.pm_project_final WHERE CDCTYPE<>'D') SRC 
  LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map DLM
 ON(DLM.src_rowid=CONCAT('PROJECT~STATE~',SRC.state)
 and DLM.source_id=SRC.sourceinstance)
 LEFT JOIN #DWH_TABLE_SCHEMA.f_project_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE CAST(CASE WHEN DLM.dimension_wh_code IN ('OPEN') THEN 0
       WHEN TRGT.estimated_doc_cost=0 AND TRGT.total_actual_doc_cost=0 THEN 0
		   WHEN TRGT.estimated_doc_cost=0 AND TRGT.total_actual_doc_cost>0 THEN 1
		   WHEN TRGT.planned_percent_complete = 0 AND TRGT.total_actual_doc_cost>0 THEN 1
		   WHEN TRGT.planned_percent_complete = 0 AND TRGT.total_actual_doc_cost=0 THEN 0
       WHEN TRGT.estimated_doc_cost <>0 AND DLM.dimension_wh_code IN ('CLOSED', 'IN PROGRESS')
       then ROUND( (TRGT.total_actual_doc_cost- (TRGT.estimated_doc_cost * TRGT.actual_percent_complete)) /(TRGT.estimated_doc_cost * TRGT.actual_percent_complete) , 4) 
       ELSE 0 END
	   as decimal(28,2) )<>CAST(TRGT.cost_variance as decimal(28,2) )
