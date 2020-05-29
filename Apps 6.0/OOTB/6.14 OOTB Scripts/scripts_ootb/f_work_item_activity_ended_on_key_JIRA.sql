SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_activity.ended_on_key' ELSE 'SUCCESS' END as Message
 FROM #STG_TABLE_SCHEMA.issue_activity_temp tmp
 
 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item_activity TRGT 
 ON (tmp.sys_id = TRGT.row_id 
 AND tmp.sourceinstance=TRGT.source_id)
 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date CAL
ON DATE_FORMAT(TRGT.ended_on, '%Y%m%d') = CAL.row_id
 
WHERE tmp.field in ('STATUS', 'ITERATION', 'STORY POINTS', 'TIMEORIGINALESTIMATE', 'BUSINESS VALUE') and coalesce(CAL.row_key,0) <> coalesce(TRGT.ended_on_key,-1);