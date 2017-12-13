

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project.actual_end_on' ELSE 'SUCCESS' END as Message
 FROM qualcomm_mdsdb.pm_project_task_final SRC 
 LEFT JOIN qualcomm_mdwdb.d_project TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE COALESCE( convert_tz(SRC.work_end,'GMT','GMT') ,'')<> COALESCE(TRGT.actual_end_on ,'')
