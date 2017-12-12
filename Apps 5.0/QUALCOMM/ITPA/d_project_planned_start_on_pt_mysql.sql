

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project.planned_start_on ' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.pm_project_task_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_project TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE COALESCE( convert_tz(SRC.start_date,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>') ,'')<> COALESCE(TRGT.planned_start_on ,'')
