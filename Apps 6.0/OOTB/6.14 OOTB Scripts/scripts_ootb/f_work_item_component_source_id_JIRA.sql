SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_component.source_id' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.issue_components_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item_component TRGT 
 ON (concat(SRC.issueId, '~', SRC.Id) = TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id)
 WHERE COALESCE(SRC.sourceinstance, '')<> COALESCE(TRGT.source_id ,'');