SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_activity.duration' ELSE 'SUCCESS' END as Message
 FROM #STG_TABLE_SCHEMA.issue_activity_temp tmp
 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item_activity TRGT 
 ON (tmp.sys_id = TRGT.row_id 
 AND tmp.issue_changelog_sourceinstance=TRGT.source_id)
 
WHERE 
coalesce(timestampdiff(second,CASE WHEN tmp.field = 'STATUS' THEN tmp.created ELSE NULL END, ADDDATE(CASE WHEN tmp.field = 'STATUS' THEN tmp.created ELSE NULL END, INTERVAL TRGT.primary_duration SECOND)),0) <> coalesce(TRGT.duration,'');