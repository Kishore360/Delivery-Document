

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_task.actual_percent_complete' ELSE 'SUCCESS' END as Message
 FROM qualcomm_mdsdb.pm_project_final SRC
 LEFT JOIN qualcomm_mdwdb.f_project_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE ROUND(CAST( SRC.percent_complete as decimal(28,10)),2)<> COALESCE(TRGT.actual_percent_complete ,'')
