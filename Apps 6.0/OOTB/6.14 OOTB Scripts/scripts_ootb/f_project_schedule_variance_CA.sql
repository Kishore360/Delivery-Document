SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project.schedule_variance' ELSE 'SUCCESS' END as Message
FROM (select * from  #MDS_TABLE_SCHEMA.inv_investments_final  where  cdctype<>'D') SRC 
INNER JOIN(select * from #MDS_TABLE_SCHEMA.inv_projects_final where IS_PROGRAM=0 and IS_TEMPLATE = 0 and cdctype<>'D')SRC1
on SRC.ID=SRC1.PRID
LEFT JOIN (select * from  #DWH_TABLE_SCHEMA.f_project)TRGT   
ON SRC.id =TRGT.row_id 	and SRC.sourceinstance=TRGT.source_id
  	LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map LKP
ON LKP.row_id=concat('PROJECT~STATE~',SRC.PROGRESS)
AND LKP.source_id=SRC.sourceinstance
where round(coalesce(CASE WHEN LKP.dimension_wh_code IN ('OPEN') THEN 0 
WHEN TRGT.actual_percent_complete = 0 THEN 0 
WHEN TRGT.planned_duration = 0 AND TRGT.actual_duration = 0 THEN 0
 WHEN TRGT.planned_duration = 0 AND TRGT.actual_duration > 0 THEN 1 
 WHEN TRGT.planned_duration != 0 AND LKP.dimension_wh_code IN ('CLOSED') THEN ROUND((TRGT.actual_duration - TRGT.planned_duration)/TRGT.planned_duration,4)
 ELSE ROUND((TRGT.week_day_count - (TRGT.actual_percent_complete * TRGT.planned_duration)) / (TRGT.actual_percent_complete * TRGT.planned_duration),4) END,0),10)
<> coalesce(TRGT.schedule_variance,10)