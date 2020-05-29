SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_activity.assigned_to_ended_on' ELSE 'SUCCESS' END as Message
 FROM #STG_TABLE_SCHEMA.issue_activity_temp tmp
 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item_activity TRGT 
 ON (tmp.sys_id = TRGT.row_id 
 AND tmp.sourceinstance=TRGT.source_id)
 
WHERE tmp.field in ('STATUS', 'ITERATION', 'STORY POINTS', 'TIMEORIGINALESTIMATE', 'BUSINESS VALUE') and coalesce(CASE WHEN tmp.field = 'assignee' and tmp.created is null THEN null WHEN tmp.field = 'assignee' THEN ADDDATE(CONVERT_TZ(tmp.created, '<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), INTERVAL TRGT.primary_duration SECOND) ELSE NULL END,'') <> coalesce(TRGT.assigned_to_ended_on,'')