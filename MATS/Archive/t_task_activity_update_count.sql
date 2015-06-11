

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for t_task_activity.update_count' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.sys_audit_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.t_task_activity TRGT 
 ON (convert(SRC.sys_id using utf8) =convert(TRGT.row_id using utf8) 
 AND convert(SRC.sourceinstance using utf8)= convert(TRGT.source_id using utf8) )
 WHERE COALESCE( CONVERT(SRC.record_checkpoint using utf8),'')<> COALESCE(CONVERT(TRGT.update_count using utf8),'')
