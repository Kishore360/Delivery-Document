SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project.effort_variance' ELSE 'SUCCESS' END as Message
FROM (select * from   #MDS_TABLE_SCHEMA.inv_investments_final  where  cdctype<>'D') SRC 
INNER JOIN(select * from  #MDS_TABLE_SCHEMA.inv_projects_final where IS_PROGRAM=0 and IS_TEMPLATE = 0 and cdctype<>'D')SRC1
on SRC.ID=SRC1.PRID
LEFT JOIN (select * from   #DWH_TABLE_SCHEMA.f_project)TRGT   
ON SRC.id =TRGT.row_id 	and SRC.sourceinstance=TRGT.source_id
  	LEFT JOIN  #DWH_TABLE_SCHEMA.d_lov_map LKP
ON LKP.row_id=concat('PROJECT~STATE~',SRC.PROGRESS)
AND LKP.source_id=SRC.sourceinstance
where LKP.dimension_wh_code NOT IN ('CLOSED') and round(coalesce(TRGT.effort_variance,0),4) <>
CASE WHEN LKP.dimension_wh_code IN ('OPEN') THEN 0
 WHEN TRGT.planned_effort = 0 AND TRGT.actual_effort = 0 THEN 0 
 WHEN TRGT.planned_effort = 0 AND TRGT.actual_effort > 0 THEN 1 
 WHEN TRGT.planned_percent_complete = 0 AND TRGT.actual_effort>0 THEN 1 
 WHEN TRGT.planned_percent_complete = 0 AND TRGT.actual_effort=0 THEN 0 ELSE ROUND( ( TRGT.actual_effort - (TRGT.planned_effort * actual_percent_complete) )/(TRGT.planned_effort * actual_percent_complete),4) END