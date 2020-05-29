SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_activity.changed_on' ELSE 'SUCCESS' END as Message
 FROM #STG_TABLE_SCHEMA.issue_activity_temp tmp
 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item_activity TRGT 
 ON (tmp.sys_id = TRGT.row_id 
 AND tmp.sourceinstance=TRGT.source_id)
 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item_activity TRGT_NXT 
 ON (TRGT.work_item_key = TRGT_NXT.work_item_key and TRGT_NXT.primary_sequence_id = (TRGT.primary_sequence_id + 1) and TRGT.source_id = TRGT_NXT.source_id
 and TRGT.task_attribute_wh_name = TRGT_NXT.task_attribute_wh_name)
 
WHERE tmp.field in ('STATUS', 'ITERATION', 'STORY POINTS', 'TIMEORIGINALESTIMATE', 'BUSINESS VALUE') and coalesce(TRGT_NXT.created_on, '') <> coalesce(TRGT.changed_on,'');