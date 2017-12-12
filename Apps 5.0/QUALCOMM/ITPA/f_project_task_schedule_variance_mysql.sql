SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_task.schedule_variance' ELSE 'SUCCESS' END as Message
FROM qualcomm_mdwdb.f_project_task TRGT 
 LEFT JOIN qualcomm_mdwdb.d_lov_map DLM
 ON(DLM.src_key= TRGT.project_state_src_key and DLM.dimension_class = 'PROJECT')
 WHERE
CAST(ROUND(CASE WHEN TRGT.planned_duration = 0 AND TRGT.actual_duration > 0 THEN 1
WHEN TRGT.planned_duration = 0 then 0 
when TRGT.actual_percent_complete = 0 then 0
WHEN TRGT.planned_duration != 0 AND DLM.dimension_wh_code IN ('CLOSED') THEN (TRGT.actual_duration - TRGT.planned_duration)/TRGT.planned_duration
WHEN TRGT.planned_duration != 0 AND DLM.dimension_wh_code IN ('IN PROGRESS') THEN (TRGT.week_day_count - (TRGT.planned_duration * TRGT.actual_percent_complete))/(TRGT.planned_duration * TRGT.actual_percent_complete)
WHEN TRGT.planned_duration != 0 AND DLM.dimension_wh_code IN ('OPEN') THEN  0 END ,4 ) as decimal(8,2))<>CAST(TRGT.schedule_variance as decimal(8,2) )
  