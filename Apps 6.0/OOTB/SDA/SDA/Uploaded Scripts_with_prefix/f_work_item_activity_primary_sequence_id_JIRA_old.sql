SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_activity.primary_sequence_id' ELSE 'SUCCESS' END as Message
 from (
 select TRGT.work_item_key, TRGT.task_attribute_wh_name, main.issueid, main.issuechangelogid, main.field, main.created,
 TRGT.primary_sequence_id,
 (
 select count(*)
 from (
 SELECT SRC.issueid, SRC.id, SRC2.issuechangelogid, SRC2.field, SRC.created, SRC.sourceinstance
 FROM #MDS_TABLE_SCHEMA.issue_changelog_final SRC
 left join #MDS_TABLE_SCHEMA.issue_changelog_items_final SRC2
 on SRC.id = SRC2.issuechangelogid and SRC.sourceinstance=SRC2.sourceinstance
 WHERE SRC2.field = 'status'
 ) base
 where base.issueid = main.issueid and base.field = main.field and main.created >= base.created
 ) primary_sequence_id1
 from 
 (
 SELECT SRC.issueid, SRC.id, SRC2.issuechangelogid, SRC2.field, SRC.created, SRC.sourceinstance
 FROM #MDS_TABLE_SCHEMA.issue_changelog_final SRC
 left join #MDS_TABLE_SCHEMA.issue_changelog_items_final SRC2
 on SRC.id = SRC2.issuechangelogid and SRC.sourceinstance=SRC2.sourceinstance
 WHERE SRC2.field = 'status'
 ) main
 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item_activity TRGT
 ON (concat(main.issueid, '~', main.issuechangelogid, '~', main.field) = TRGT.row_id 
 AND main.sourceinstance=TRGT.source_id)
 ) DRVD
 where DRVD.field = 'status' and 
 DRVD.primary_sequence_id <> DRVD.primary_sequence_id1
 