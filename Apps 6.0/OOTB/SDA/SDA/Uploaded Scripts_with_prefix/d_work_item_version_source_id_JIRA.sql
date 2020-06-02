SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project_version.source_id' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.project_versions_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_work_item_version TRGT 
 ON (concat(SRC.id, '')=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE COALESCE(SRC.sourceinstance, '')<> COALESCE(TRGT.source_id ,'');