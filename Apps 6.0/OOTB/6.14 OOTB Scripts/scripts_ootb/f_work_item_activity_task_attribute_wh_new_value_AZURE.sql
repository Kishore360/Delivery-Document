SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_activity.task_attribute_wh_new_value' ELSE 'SUCCESS' END as Message
 from (
 SELECT tmp.sys_id, tmp.field, 
 COALESCE(tmp.to,tmp.tostring) sr, coalesce(TRGT.task_attribute_wh_new_value,'')
 from (select * from #STG_TABLE_SCHEMA.issue_activity_azure_base base where base.field in ('STATUS', 'ITERATION', 'STORY POINTS', 'TIMEORIGINALESTIMATE', 'BUSINESS VALUE')) tmp
 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item_activity TRGT 
 ON (tmp.sys_id = TRGT.row_id 
 AND tmp.sourceinstance=TRGT.source_id)
 
WHERE tmp.field in ('STATUS', 'ITERATION', 'PRIORITY', 'ASSIGNEE', 'ISSUETYPE') 
and COALESCE(tmp.to,tmp.tostring, '') <> coalesce(TRGT.task_attribute_wh_new_value,'')

union all

 SELECT tmp.sys_id, tmp.field, 
 coalesce(tmp.to, tmp.tostring) sr, coalesce(TRGT.task_attribute_wh_new_value,'')
 from (select * from #STG_TABLE_SCHEMA.issue_activity_azure_base base where base.field in ('STATUS', 'ITERATION', 'STORY POINTS', 'TIMEORIGINALESTIMATE', 'BUSINESS VALUE')) tmp
 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item_activity TRGT 
 ON (tmp.sys_id = TRGT.row_id 
 AND tmp.sourceinstance=TRGT.source_id)
 
WHERE tmp.field in ('STORY POINTS', 'TIMEORIGINALESTIMATE', 'BUSINESS VALUE') 
and round(case when coalesce(tmp.to, tmp.tostring) < 0 then null else coalesce(tmp.to, tmp.tostring) end,10) <> coalesce(TRGT.task_attribute_wh_new_value,'')
)SQ;