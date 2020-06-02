SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_component.work_item_key' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.issue_components_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item_component TRGT 
 ON (concat(SRC.issueId, '~', SRC.Id) = TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id)
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item LKP 
 ON (concat(SRC.issueId, '') = LKP.row_id 
 AND SRC.sourceinstance=LKP.source_id)
 WHERE COALESCE(LKP.work_item_key, case when SRC.issueId is null then 0 else -1 end) <> COALESCE(TRGT.work_item_key ,'');