SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_activity.assigned_to_key' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.issue_changelog_final SRC
 left join #MDS_TABLE_SCHEMA.issue_changelog_items_final SRC2
 on SRC.id = SRC2.issuechangelogid and SRC.sourceinstance=SRC2.sourceinstance
 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item_activity TRGT 
 ON (concat(SRC.issueid, '~', SRC2.issuechangelogid, '~', SRC2.field) = TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id)
 
 where SRC2.field = 'status' and coalesce(CASE WHEN SRC2.field = 'assignee' THEN SRC2.to ELSE NULL END, case when SRC2.to is null then 0 else -1 end) <> COALESCE(TRGT.assigned_to_key ,'');