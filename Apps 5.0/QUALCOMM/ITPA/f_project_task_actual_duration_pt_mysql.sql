

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_task.actual_duration' ELSE 'SUCCESS' END as Message
 FROM qualcomm_mdsdb.pm_project_task_final SRC 
 LEFT JOIN qualcomm_mdwdb.f_project_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
WHERE ROUND(CAST( TIMESTAMPDIFF(hour,'1970-01-01 00:00:00', work_duration)/24 as decimal(28,10)),2)<>  COALESCE(TRGT.actual_duration,'') 
