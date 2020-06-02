SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.project_key' ELSE 'SUCCESS' END as Message
 
 FROM #STG_TABLE_SCHEMA.issue_activity_temp SRC
 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item_activity TRGT 
 ON (concat(SRC.sys_id, '') = TRGT.row_id 
 AND SRC.issue_changelog_sourceinstance=TRGT.source_id)

 left join #MDS_TABLE_SCHEMA.issue_final LKP_SRC
 ON (concat(SRC.issue_changelog_issueid, '')=LKP_SRC.id 
 AND SRC.issue_changelog_sourceinstance=LKP_SRC.sourceinstance)
 
 left join #DWH_TABLE_SCHEMA.d_project LKP
 on LKP_SRC.project_id=LKP.row_id
 and LKP_SRC.sourceinstance=LKP.source_id
 
 where SRC.field in ('STATUS', 'ITERATION', 'STORY POINTS', 'TIMEORIGINALESTIMATE', 'BUSINESS VALUE') and coalesce(LKP.row_key,case when LKP_SRC.project_id is null then 0 else -1 end )<>coalesce(TRGT.project_key,'')