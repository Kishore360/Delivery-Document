SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_task.cost_variance' ELSE 'SUCCESS' END as Message
FROM  (select * from    #MDS_TABLE_SCHEMA.prtask_final  where cdctype<>'D') SRC 
inner join(select * from    #MDS_TABLE_SCHEMA.inv_investments_final where odf_object_code='project' and cdctype<>'D') SRC1 
on SRC.prprojectid=SRC1.id
INNER join(select * from     #MDS_TABLE_SCHEMA.inv_projects_final WHERE is_program=0 and is_template=0)SRC10
 ON  SRC1.id=SRC10.prid
inner join (select * from     #MDS_TABLE_SCHEMA.prj_ev_history_final   where object_type='TASK') SRC2
on  SRC.prid = SRC2.object_id and SRC.sourceinstance = SRC2.sourceinstance
LEFT JOIN   #DWH_TABLE_SCHEMA.f_project_task TRGT 
ON SRC10.PRID=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id 
LEFT JOIN   #DWH_TABLE_SCHEMA.d_lov_map LKP
ON LKP.row_id=concat('PROJECT_TASK~STATE~',SRC.PRSTATUS)
AND LKP.source_id=SRC.sourceinstance
WHERE COALESCE(CASE WHEN LKP.dimension_wh_code IN ('OPEN','CLOSED') THEN 0
       WHEN TRGT.estimated_doc_cost=0 AND TRGT.total_actual_doc_cost=0 THEN 0
		   WHEN TRGT.estimated_doc_cost=0 AND TRGT.total_actual_doc_cost>0 THEN 1
		   WHEN TRGT.planned_percent_complete = 0 AND TRGT.total_actual_doc_cost>0 THEN 1
		   WHEN TRGT.planned_percent_complete = 0 AND TRGT.total_actual_doc_cost=0 THEN 0
       WHEN TRGT.estimated_doc_cost <>0 AND LKP.dimension_wh_code IN ('IN PROGRESS')
       then ROUND((TRGT.total_actual_doc_cost - (TRGT.estimated_doc_cost * TRGT.actual_percent_complete)) /(TRGT.estimated_doc_cost * TRGT.actual_percent_complete) , 4) 
       ELSE 0 END,'')<>round(COALESCE(TRGT.cost_variance,''),4)
