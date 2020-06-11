SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_activity.sequence_id' ELSE 'SUCCESS' END as Message
 from (
 select TRGT.row_id, TRGT.work_item_key, TRGT.task_attribute_wh_name, main.issueid, main.sequence_id as int_sequence_id, main.field, main.created,
 TRGT.sequence_id,
 (
 select count(*)
 from (
 SELECT tmp.sys_id, tmp.issueid issueid, tmp.id, tmp.sequence_id, tmp.field, tmp.created, tmp.sourceinstance sourceinstance
 from (select * from #STG_TABLE_SCHEMA.issue_activity_azure_base base where base.field in ('STATUS', 'ITERATION', 'STORY POINTS', 'TIMEORIGINALESTIMATE', 'BUSINESS VALUE')) tmp
 ) base
 where base.issueid = main.issueid and base.sourceinstance = main.sourceinstance and (main.created > base.created or (main.created = base.created and main.sequence_id > base.sequence_id))
 ) sequence_id1
 from 
 (
 SELECT tmp.sys_id, tmp.issueid issueid, tmp.id, tmp.sequence_id, tmp.field, tmp.created, tmp.sourceinstance sourceinstance
 from (select * from #STG_TABLE_SCHEMA.issue_activity_azure_base base where base.field in ('STATUS', 'ITERATION', 'STORY POINTS', 'TIMEORIGINALESTIMATE', 'BUSINESS VALUE')) tmp
 ) main
 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item_activity TRGT
 ON (main.sys_id = TRGT.row_id 
 AND main.sourceinstance=TRGT.source_id)
 ) DRVD
 WHERE COALESCE(DRVD.sequence_id, -1)<> COALESCE(DRVD.sequence_id1,'');