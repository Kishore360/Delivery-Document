SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_activity.task_attribute_wh_old_value' ELSE 'SUCCESS' END as Message
from (
 SELECT tmp.sys_id, tmp.field, 
 coalesce(tmp.from, tmp.fromstring) sr, coalesce(TRGT.task_attribute_wh_old_value,'')
 from (select * from #STG_TABLE_SCHEMA.issue_activity_azure_base base where base.field in ('STATUS', 'ITERATION', 'STORY POINTS', 'TIMEORIGINALESTIMATE', 'BUSINESS VALUE')) tmp
 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item_activity TRGT 
 ON (tmp.sys_id = TRGT.row_id 
 AND tmp.sourceinstance=TRGT.source_id)
 
 where tmp.field in ('STATUS') and 
 coalesce(tmp.from, '') <> coalesce(TRGT.task_attribute_wh_old_value,'')
 
 union all
 
 SELECT tmp.sys_id, tmp.field, 
 coalesce(tmp.from, tmp.fromstring) sr, coalesce(TRGT.task_attribute_wh_old_value,'')
 from (select * from #STG_TABLE_SCHEMA.issue_activity_azure_base base where base.field in ('STATUS', 'ITERATION', 'STORY POINTS', 'TIMEORIGINALESTIMATE', 'BUSINESS VALUE')) tmp
 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item_activity TRGT 
 ON (tmp.sys_id = TRGT.row_id 
 AND tmp.sourceinstance=TRGT.source_id)
 
 where tmp.field in ('ITERATION') and 
 COALESCE(tmp.from,tmp.fromstring, '') <> coalesce(TRGT.task_attribute_wh_old_value,'')
 
 union all

select TRGT.row_id, tmp.field, tmp.from, TRGT.task_attribute_wh_old_value
from (select * from #STG_TABLE_SCHEMA.issue_activity_azure_base base where base.field in ('STATUS', 'ITERATION', 'STORY POINTS', 'TIMEORIGINALESTIMATE', 'BUSINESS VALUE')) tmp
 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item_activity TRGT
 ON (tmp.sys_id = TRGT.row_id 
 AND tmp.sourceinstance=TRGT.source_id)
 
 where tmp.field in ('PRIORITY') and  
 coalesce(tmp.from, '') <>coalesce(TRGT.task_attribute_wh_old_value,'')
 
 union all

 select TRGT.row_id, tmp.field, tmp.from, TRGT.task_attribute_wh_old_value
 from (select * from #STG_TABLE_SCHEMA.issue_activity_azure_base base where base.field in ('STATUS', 'ITERATION', 'STORY POINTS', 'TIMEORIGINALESTIMATE', 'BUSINESS VALUE')) tmp
 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item_activity TRGT 
 ON (tmp.sys_id = TRGT.row_id 
 AND tmp.sourceinstance=TRGT.source_id)
 
 where tmp.field in ('ASSIGNEE') and  
 COALESCE(tmp.from,tmp.fromstring, '') <> coalesce(TRGT.task_attribute_wh_old_value,'')
   
 union all

select TRGT.row_id, tmp.field, tmp.from, TRGT.task_attribute_wh_old_value
from (select * from #STG_TABLE_SCHEMA.issue_activity_azure_base base where base.field in ('STATUS', 'ITERATION', 'STORY POINTS', 'TIMEORIGINALESTIMATE', 'BUSINESS VALUE')) tmp
 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item_activity TRGT
 ON (tmp.sys_id = TRGT.row_id 
 AND tmp.sourceinstance=TRGT.source_id)
 
 where tmp.field in ('ISSUETYPE') and  
 coalesce(tmp.from, '') <>coalesce(TRGT.task_attribute_wh_old_value,'')
 
 union all

 SELECT tmp.sys_id, tmp.field, 
 coalesce(tmp.from, tmp.fromstring) sr, coalesce(TRGT.task_attribute_wh_old_value,'')
 from (select * from #STG_TABLE_SCHEMA.issue_activity_azure_base base where base.field in ('STATUS', 'ITERATION', 'STORY POINTS', 'TIMEORIGINALESTIMATE', 'BUSINESS VALUE')) tmp
 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item_activity TRGT 
 ON (tmp.sys_id = TRGT.row_id 
 AND tmp.sourceinstance=TRGT.source_id)
 
WHERE tmp.field in ('STORY POINTS', 'TIMEORIGINALESTIMATE', 'BUSINESS VALUE') 
and case when coalesce(tmp.from, tmp.fromstring) = 0 then null else coalesce(tmp.from, tmp.fromstring) end <> coalesce(TRGT.task_attribute_wh_old_value,'')
)SQ;