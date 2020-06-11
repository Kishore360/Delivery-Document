SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_task.cost_variance' ELSE 'SUCCESS' END as Message 
   FROM  (select * from #MDS_TABLE_SCHEMA.prtask_final SRC  where cdctype<>'D') SRC 
inner join(select * from #MDS_TABLE_SCHEMA.inv_investments_final where odf_object_code='project' and cdctype<>'D') SRC1 
on SRC.prprojectid=SRC1.id
       LEFT JOIN #DWH_TABLE_SCHEMA.f_project_task TRGT 
   on SRC.PRID = TRGT.row_id and SRC.sourceinstance = TRGT.source_id
 	LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map LKP
ON LKP.row_id=concat('PROJECT_TASK~STATE~',SRC.PRSTATUS)
AND LKP.source_id=SRC.sourceinstance
where round(coalesce(case WHEN LKP.dimension_wh_code IN ('OPEN') THEN 0
       WHEN TRGT.estimated_doc_cost=0 AND TRGT.total_actual_doc_cost=0 THEN 0
		   WHEN TRGT.estimated_doc_cost=0 AND TRGT.total_actual_doc_cost>0 THEN 1
		   WHEN TRGT.planned_percent_complete = 0 AND TRGT.total_actual_doc_cost>0 THEN 1
		   WHEN TRGT.planned_percent_complete = 0 AND TRGT.total_actual_doc_cost=0 THEN 0
       WHEN  TRGT.estimated_doc_cost <>0 and
       LKP.dimension_wh_code IN ('CLOSED', 'IN PROGRESS')
       then ROUND((TRGT.total_actual_doc_cost - (TRGT.estimated_doc_cost * TRGT.actual_percent_complete)) /(TRGT.estimated_doc_cost * TRGT.actual_percent_complete) , 4) 
       ELSE 0 END,0),10)<> round(COALESCE(TRGT.cost_variance,''),10)
 