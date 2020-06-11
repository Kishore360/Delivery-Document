SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
from ( SELECT * FROM  #MDS_TABLE_SCHEMA.hp_wp_tasks_final  WHERE CDCTYPE<>'D') SRC
LEFT JOIN  #MDS_TABLE_SCHEMA.hp_wp_task_info_final SRC5
on SRC.TASK_INFO_ID = SRC5.TASK_INFO_ID 
and SRC.sourceinstance = SRC5.sourceinstance 
LEFT JOIN  #DWH_TABLE_SCHEMA.f_project_task TRGT 
ON SRC.TASK_ID=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id 
LEFT JOIN  #DWH_TABLE_SCHEMA.d_lov_map LKP
ON LKP.row_id=concat('PROJECT_TASK~STATE~',SRC5.STATUS)
AND LKP.source_id=SRC.sourceinstance
where LKP.dimension_wh_code NOT IN ('CLOSED') and round(coalesce(TRGT.effort_variance,0),5) <>
CASE WHEN LKP.dimension_wh_code IN ('OPEN') THEN 0
 WHEN TRGT.planned_effort = 0 AND TRGT.actual_effort = 0 THEN 0 
 WHEN TRGT.planned_effort = 0 AND TRGT.actual_effort > 0 THEN 1 
 WHEN TRGT.planned_percent_complete = 0 AND TRGT.actual_effort>0 THEN 1 
 WHEN TRGT.planned_percent_complete = 0 AND TRGT.actual_effort=0 THEN 0 ELSE ROUND( ( TRGT.actual_effort - (TRGT.planned_effort * actual_percent_complete) )/(TRGT.planned_effort * actual_percent_complete),4) END