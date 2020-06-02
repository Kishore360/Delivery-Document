SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_activity.created_by' ELSE 'SUCCESS' END as Message
 
 FROM #STG_TABLE_SCHEMA.issue_activity_temp tmp
 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item_activity TRGT 
 ON (tmp.sys_id = TRGT.row_id 
 AND tmp.issue_changelog_sourceinstance=TRGT.source_id)
 
 WHERE tmp.field in ('STATUS', 'ITERATION', 'STORY POINTS', 'TIMEORIGINALESTIMATE', 'BUSINESS VALUE') and COALESCE(tmp.author_key, '')<> COALESCE(TRGT.created_by ,'');