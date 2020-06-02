SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_activity.task_attribute_wh_new_value_key' ELSE 'SUCCESS' END as Message
FROM 
(
select TRGT.row_id, TRGT.task_attribute_wh_new_value_key, lov.row_key
from (select * from #STG_TABLE_SCHEMA.issue_activity_azure_base base where base.field in ('STATUS', 'ITERATION', 'STORY POINTS', 'TIMEORIGINALESTIMATE', 'BUSINESS VALUE')) tmp
 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item_activity TRGT 
 ON (tmp.sys_id = TRGT.row_id 
 AND tmp.sourceinstance=TRGT.source_id)
 
 left join #DWH_TABLE_SCHEMA.d_lov lov
 on lov.row_id = concat('STATUS~WORK_ITEM~', TRIM(tmp.to)) and lov.dimension_class = 'STATUS~WORK_ITEM' and tmp.sourceinstance = lov.source_id
  
 where tmp.field in ('STATUS') and coalesce(lov.row_key, case when TRIM(tmp.to) is null then 0 else -1 end) <>coalesce(TRGT.task_attribute_wh_new_value_key,'')
 
 union all
 
select TRGT.row_id, TRGT.task_attribute_wh_new_value_key, ITE.row_key
from (select * from #STG_TABLE_SCHEMA.issue_activity_azure_base base where base.field in ('STATUS', 'ITERATION', 'STORY POINTS', 'TIMEORIGINALESTIMATE', 'BUSINESS VALUE')) tmp
 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item_activity TRGT 
 ON (tmp.sys_id = TRGT.row_id 
 AND tmp.sourceinstance=TRGT.source_id)
 
 left join #DWH_TABLE_SCHEMA.d_iteration ITE
 on ITE.row_id = coalesce(tmp.to, tmp.tostring) and tmp.sourceinstance = ITE.source_id
  
 where tmp.field in ('ITERATION') and coalesce(ITE.row_key, case when coalesce(tmp.to, tmp.tostring) is null then 0 else -1 end) <>
  coalesce(TRGT.task_attribute_wh_new_value_key,'')
 
 union all
 
 select TRGT.row_id, TRGT.task_attribute_wh_new_value_key, lov.row_key
from (select * from #STG_TABLE_SCHEMA.issue_activity_azure_base base where base.field in ('STATUS', 'ITERATION', 'STORY POINTS', 'TIMEORIGINALESTIMATE', 'BUSINESS VALUE')) tmp
 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item_activity TRGT 
 ON (tmp.sys_id = TRGT.row_id 
 AND tmp.sourceinstance=TRGT.source_id)
 
 left join #DWH_TABLE_SCHEMA.d_lov lov
 on lov.row_id = concat('PRIORITY~WORK_ITEM~', TRIM(tmp.to)) and lov.dimension_class = 'PRIORITY~WORK_ITEM' and tmp.sourceinstance = lov.source_id
  
 where tmp.field in ('PRIORITY') and 
 -- coalesce(lov.row_key, case when TRIM(tmp.to) is null then 0 else -1 end) <>coalesce(TRGT.task_attribute_wh_new_value_key,'')
 coalesce(null, 0) <>coalesce(TRGT.task_attribute_wh_old_value_key,'')
 
 union all
 
select TRGT.row_id, TRGT.task_attribute_wh_new_value_key, DIC.row_key
from (select * from #STG_TABLE_SCHEMA.issue_activity_azure_base base where base.field in ('STATUS', 'ITERATION', 'STORY POINTS', 'TIMEORIGINALESTIMATE', 'BUSINESS VALUE')) tmp
 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item_activity TRGT 
 ON (tmp.sys_id = TRGT.row_id 
 AND tmp.sourceinstance=TRGT.source_id)
 
 left join #DWH_TABLE_SCHEMA.d_internal_contact DIC
 on DIC.row_id = coalesce(case when COALESCE(tmp.to, tmp.tostring) is null then null else CONCAT('INTERNAL_CONTACT~',COALESCE(tmp.to, tmp.tostring)) end, 'UNSPECIFIED') and (tmp.sourceinstance = DIC.source_id or DIC.source_id = 0)
  
 where tmp.field in ('ASSIGNEE') and 
 -- coalesce(DIC.row_key, case when CONCAT('INTERNAL_CONTACT~',COALESCE(tmp.to, tmp.tostring)) is null then 0 else -1 end) <> coalesce(TRGT.task_attribute_wh_new_value_key,'')
 coalesce(null, 0) <>coalesce(TRGT.task_attribute_wh_old_value_key,'')
 
 union all
 
 select TRGT.row_id, TRGT.task_attribute_wh_new_value_key, lov.row_key
from (select * from #STG_TABLE_SCHEMA.issue_activity_azure_base base where base.field in ('STATUS', 'ITERATION', 'STORY POINTS', 'TIMEORIGINALESTIMATE', 'BUSINESS VALUE')) tmp
 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item_activity TRGT 
 ON (tmp.sys_id = TRGT.row_id 
 AND tmp.sourceinstance=TRGT.source_id)
 
 left join #DWH_TABLE_SCHEMA.d_lov lov
 on lov.row_id = concat('ISSUETYPE~WORK_ITEM~', TRIM(tmp.to)) and lov.dimension_class = 'ISSUETYPE~WORK_ITEM' and tmp.sourceinstance = lov.source_id
  
 where tmp.field in ('ISSUETYPE') and coalesce(lov.row_key, case when TRIM(tmp.to) is null then 0 else -1 end) <>coalesce(TRGT.task_attribute_wh_new_value_key,'')
 
 union all
 
 select TRGT.row_id, TRGT.task_attribute_wh_new_value_key, 0 as task_attribute_wh_new_value_key
from (select * from #STG_TABLE_SCHEMA.issue_activity_azure_base base where base.field in ('STATUS', 'ITERATION', 'STORY POINTS', 'TIMEORIGINALESTIMATE', 'BUSINESS VALUE')) tmp
 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item_activity TRGT 
 ON (tmp.sys_id = TRGT.row_id 
 AND tmp.sourceinstance=TRGT.source_id)
 
 where tmp.field in ('STORY POINTS', 'TIMEORIGINALESTIMATE', 'BUSINESS VALUE') and coalesce(null,0) <>coalesce(TRGT.task_attribute_wh_new_value_key,'')
) SQ;