

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_task.planned_start_on' ELSE 'SUCCESS' END as Message
 FROM qualcomm_mdsdb.pm_project_final SRC 
 LEFT JOIN qualcomm_mdwdb.f_project_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE COALESCE( convert_tz(SRC.start_date,'GMT','GMT'),'')<> COALESCE(TRGT.planned_start_on ,'')
