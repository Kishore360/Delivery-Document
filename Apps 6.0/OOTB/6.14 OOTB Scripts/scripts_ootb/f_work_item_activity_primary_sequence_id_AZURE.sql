SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_activity.primary_sequence_id' ELSE 'SUCCESS' END as Message
 /*select TRGT.work_item_key, TRGT.task_attribute_wh_name, main.issueid, main.sequence_id, main.field, main.created,
 TRGT.primary_sequence_id, main.primary_sequence_id */
 from (
 SELECT tmp.sys_id, tmp.issueid issueid, tmp.id, tmp.sequence_id, tmp.field, tmp.created, tmp.sourceinstance sourceinstance, tmp.primary_sequence_id
 from (select * from #STG_TABLE_SCHEMA.issue_activity_azure_base base where base.field in ('STATUS', 'ITERATION', 'STORY POINTS', 'TIMEORIGINALESTIMATE', 'BUSINESS VALUE')) tmp
 WHERE tmp.field in ('STATUS', 'ITERATION', 'STORY POINTS', 'TIMEORIGINALESTIMATE', 'BUSINESS VALUE', 'PRIORITY', 'ASSIGNEE', 'ISSUETYPE')
 ) main
 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item_activity TRGT
 ON (main.sys_id = TRGT.row_id 
 AND main.sourceinstance=TRGT.source_id)
 where main.field in ('STATUS', 'ITERATION', 'STORY POINTS', 'TIMEORIGINALESTIMATE', 'BUSINESS VALUE', 'PRIORITY', 'ASSIGNEE', 'ISSUETYPE') and 
 TRGT.primary_sequence_id <> main.primary_sequence_id;