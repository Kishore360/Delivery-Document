SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project_version.is_archived_flag' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.project_versions_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_work_item_version TRGT 
 ON (concat(SRC.id, '')=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id)
 WHERE COALESCE(case when SRC.archived = 1 then 'Y' else 'N' end, '')<> COALESCE(TRGT.is_archived_flag ,'');