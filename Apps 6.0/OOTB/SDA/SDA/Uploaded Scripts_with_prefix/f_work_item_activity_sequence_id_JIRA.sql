SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_activity.sequence_id' ELSE 'SUCCESS' END as Message
 from (
 select TRGT.row_id, TRGT.work_item_key, TRGT.task_attribute_wh_name, main.issueid, main.issuechangelogid, main.field, main.created,
 TRGT.sequence_id,
 (
 select count(*) + 1
 from (
 SELECT tmp.sys_id, tmp.issue_changelog_issueid issueid, tmp.id, tmp.issuechangelogid, tmp.field, tmp.created, tmp.issue_changelog_sourceinstance sourceinstance
 FROM #STG_TABLE_SCHEMA.issue_activity_temp tmp
 WHERE tmp.field in ('status')
 ) base
 where base.issueid = main.issueid and base.field = main.field and (main.created > base.created or (main.created = base.created and main.issuechangelogid > base.issuechangelogid))
 ) sequence_id1
 from 
 (
 SELECT tmp.sys_id, tmp.issue_changelog_issueid issueid, tmp.id, tmp.issuechangelogid, tmp.field, tmp.created, tmp.issue_changelog_sourceinstance sourceinstance
 FROM #STG_TABLE_SCHEMA.issue_activity_temp tmp
 WHERE tmp.field in ('status')
 ) main
 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item_activity TRGT
 ON (main.sys_id = TRGT.row_id 
 AND main.sourceinstance=TRGT.source_id)
 ) DRVD
 WHERE DRVD.field = 'status' and COALESCE(DRVD.sequence_id, -1)<> COALESCE(DRVD.sequence_id1,'');