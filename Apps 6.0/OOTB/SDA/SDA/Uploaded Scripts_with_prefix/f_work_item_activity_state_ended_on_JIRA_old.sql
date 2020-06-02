SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_activity.state_ended_on' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.issue_changelog_final SRC
 left join #MDS_TABLE_SCHEMA.issue_changelog_items_final SRC2
 on SRC.id = SRC2.issuechangelogid and SRC.sourceinstance=SRC2.sourceinstance
 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item_activity TRGT 
 ON (concat(SRC.issueid, '~', SRC2.issuechangelogid, '~', SRC2.field) = TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id)
WHERE SRC2.field = 'status' and coalesce(CASE WHEN SRC2.field = 'status' THEN ADDDATE(CONVERT_TZ(SRC.created, '<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), INTERVAL TRGT.primary_duration SECOND) ELSE NULL END, '') <> coalesce(TRGT.state_ended_on,'');