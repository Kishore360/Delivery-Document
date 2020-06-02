SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_activity.work_item_key' ELSE 'SUCCESS' END as Message
 FROM #STG_TABLE_SCHEMA.issue_activity_temp tmp
 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item_activity TRGT 
 ON (tmp.sys_id = TRGT.row_id 
 AND tmp.issue_changelog_sourceinstance=TRGT.source_id)
 
 left join #DWH_TABLE_SCHEMA.f_work_item F
 ON (concat(tmp.issue_changelog_issueid, '')=F.row_id 
 AND tmp.issue_changelog_sourceinstance=F.source_id)

 WHERE tmp.field in ('STATUS', 'ITERATION', 'STORY POINTS', 'TIMEORIGINALESTIMATE', 'BUSINESS VALUE') and COALESCE(F.work_item_key, case when tmp.issue_changelog_issueid is null then 0 else -1 end)<> COALESCE(TRGT.work_item_key,'');