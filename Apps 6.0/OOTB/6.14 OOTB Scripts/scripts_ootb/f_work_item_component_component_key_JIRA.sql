SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_component.component_key' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.issue_components_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item_component TRGT 
 ON (concat(SRC.issueId, '~', SRC.Id) = TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id)
 LEFT JOIN #DWH_TABLE_SCHEMA.d_component LKP 
 ON (SRC.Id = LKP.row_id 
 AND SRC.sourceinstance=LKP.source_id)
 WHERE COALESCE(LKP.row_key, case when SRC.Id is null then 0 else -1 end) <> COALESCE(TRGT.component_key ,'');