SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 then case when (COALESCE(timestampdiff(second, SRC.created, SRC.resolutiondate), '') - COALESCE(TRGT.duration_created_to_resolve,'')) in (-3600, 3600) 
 then 'Failing due to timezone conversion issue for f_work_item.duration_created_to_resolve'
 ELSE  'MDS to DWH data validation failed for f_work_item.duration_created_to_resolve' END ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.issue_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item TRGT 
 ON (concat(SRC.id, '')=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id)
 WHERE COALESCE(timestampdiff(second, SRC.created, SRC.resolutiondate), '')<> COALESCE(TRGT.duration_created_to_resolve,'');