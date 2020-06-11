SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_activity.created_time_key' ELSE 'SUCCESS' END as Message
FROM #STG_TABLE_SCHEMA.issue_activity_temp SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item_activity TRGT 
 ON (SRC.sys_id = TRGT.row_id 
 AND SRC.issue_changelog_sourceinstance=TRGT.source_id)
LEFT JOIN  #DWH_TABLE_SCHEMA.d_calendar_time LKP
ON (date_format(convert_tz(SRC.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'%H%i') = LKP.row_id AND LKP.source_id=0)
 WHERE SRC.field in ('STATUS', 'ITERATION', 'STORY POINTS', 'TIMEORIGINALESTIMATE', 'BUSINESS VALUE') and coalesce(LKP.row_key, 0) <> coalesce(TRGT.created_time_key,'');