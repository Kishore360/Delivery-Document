

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project.is_top_flag' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.pm_project_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_project TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE COALESCE( case when top_task=sys_id then 'Y' else 'N' end ,'')<> COALESCE(TRGT.is_top_flag ,'')
