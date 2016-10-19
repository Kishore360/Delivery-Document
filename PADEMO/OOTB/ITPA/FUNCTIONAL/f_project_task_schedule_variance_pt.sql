SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_task.schedule_variance' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.pm_project_task_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.d_lov_map DLM
 ON(DLM.src_rowid=CONCAT('PROJECT~STATE~~',SRC.state))
 LEFT JOIN <<tenant>>_mdwdb.f_project_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE   CAST(ROUND(CASE WHEN TRGT.planned_duration = 0 AND TRGT.actual_duration = 0 THEN 0
 	   WHEN TRGT.planned_duration = 0 AND TRGT.actual_duration > 0 THEN 1
       WHEN TRGT.planned_duration != 0 AND DLM.dimension_wh_code IN ('CLOSED') THEN (TRGT.actual_duration - TRGT.planned_duration)/TRGT.planned_duration
       ELSE(TRGT.week_day_count - (TRGT.actual_percent_complete * TRGT.planned_duration)) / TRGT.week_day_count  
  END ,4 ) as decimal(28,2))<>CAST(TRGT.schedule_variance as decimal(28,2) )
  
