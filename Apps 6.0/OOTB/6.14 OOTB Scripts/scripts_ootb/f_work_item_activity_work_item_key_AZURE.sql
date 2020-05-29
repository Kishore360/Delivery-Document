SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_activity.work_item_key' ELSE 'SUCCESS' END as Message
 from (select * from #STG_TABLE_SCHEMA.issue_activity_azure_base base where base.field in ('STATUS', 'ITERATION', 'STORY POINTS', 'TIMEORIGINALESTIMATE', 'BUSINESS VALUE')) tmp
 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item_activity TRGT 
 ON (tmp.sys_id = TRGT.row_id 
 AND tmp.sourceinstance=TRGT.source_id)
 
 left join #DWH_TABLE_SCHEMA.d_work_item D
 ON (concat(tmp.issueid, '')=D.row_id 
 AND tmp.sourceinstance=D.source_id)

 WHERE tmp.field in ('STATUS', 'ITERATION', 'STORY POINTS', 'TIMEORIGINALESTIMATE', 'BUSINESS VALUE', 'PRIORITY', 'ASSIGNEE', 'ISSUETYPE') and COALESCE(D.row_key, case when tmp.issueid is null then 0 else -1 end)<> COALESCE(TRGT.work_item_key,'');