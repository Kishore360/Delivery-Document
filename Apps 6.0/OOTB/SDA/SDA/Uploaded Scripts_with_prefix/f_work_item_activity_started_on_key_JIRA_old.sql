SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_activity.started_on_key' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.issue_changelog_final SRC
 left join #MDS_TABLE_SCHEMA.issue_changelog_items_final SRC2
 on SRC.id = SRC2.issuechangelogid and SRC.sourceinstance=SRC2.sourceinstance
 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item_activity TRGT 
 ON (concat(SRC.issueid, '~', SRC2.issuechangelogid, '~', SRC2.field) = TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id)
 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date CAL
 ON DATE_FORMAT(greatest(TRGT.assigned_to_created_on, TRGT.state_created_on), '%Y%m%d') = DATE_FORMAT(CAL.calendar_date, '%Y%m%d')
 
WHERE SRC2.field = 'status' and coalesce(CAL.row_key,-1) <> coalesce(TRGT.started_on_key,-1);