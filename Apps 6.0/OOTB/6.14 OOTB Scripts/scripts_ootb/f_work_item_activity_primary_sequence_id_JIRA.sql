SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_activity.primary_sequence_id' ELSE 'SUCCESS' END as Message
 from (
 select TRGT.work_item_key, TRGT.task_attribute_wh_name, main.issueid, main.issuechangelogid, main.field, main.created,
 TRGT.primary_sequence_id,
 (
 select count(*)
 from (
 SELECT tmp.sys_id, tmp.issueid issueid, tmp.id, tmp.issuechangelogid, tmp.field, tmp.created, tmp.sourceinstance sourceinstance
 FROM #STG_TABLE_SCHEMA.issue_activity_temp tmp
 WHERE tmp.field in ('STATUS', 'ITERATION', 'STORY POINTS', 'TIMEORIGINALESTIMATE', 'BUSINESS VALUE')
 ) base
 where base.issueid = main.issueid and base.field = main.field and base.sourceinstance = main.sourceinstance and (main.created > base.created or (main.created = base.created and main.issuechangelogid > base.issuechangelogid))
 ) primary_sequence_id1
 from 
 (
 SELECT tmp.sys_id, tmp.issueid issueid, tmp.id, tmp.issuechangelogid, tmp.field, tmp.created, tmp.sourceinstance sourceinstance
 FROM #STG_TABLE_SCHEMA.issue_activity_temp tmp
 WHERE tmp.field in ('STATUS', 'ITERATION', 'STORY POINTS', 'TIMEORIGINALESTIMATE', 'BUSINESS VALUE')
 ) main
 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item_activity TRGT
 ON (main.sys_id = TRGT.row_id 
 AND main.sourceinstance=TRGT.source_id)
 ) DRVD
 where DRVD.field in ('STATUS', 'ITERATION', 'STORY POINTS', 'TIMEORIGINALESTIMATE', 'BUSINESS VALUE') and 
 DRVD.primary_sequence_id <> DRVD.primary_sequence_id1