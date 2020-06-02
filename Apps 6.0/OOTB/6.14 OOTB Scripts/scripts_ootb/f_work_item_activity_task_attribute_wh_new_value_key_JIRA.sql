SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_activity.task_attribute_wh_new_value_key' ELSE 'SUCCESS' END as Message
FROM 
(
select TRGT.row_id, TRGT.task_attribute_wh_new_value_key, lov.row_key
from  #STG_TABLE_SCHEMA.issue_activity_temp tmp
 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item_activity TRGT 
 ON (tmp.sys_id = TRGT.row_id 
 AND tmp.sourceinstance=TRGT.source_id)
 
 left join #DWH_TABLE_SCHEMA.d_lov lov
 on lov.row_id = concat('STATUS~WORK_ITEM~', IF(TRIM(tmp.from)=TRIM(tmp.to) OR LENGTH(tmp.to)=0,NULL,TRIM(SUBSTRING_INDEX(tmp.to, ',', -1)))) and lov.dimension_class = 'STATUS~WORK_ITEM' and tmp.sourceinstance = lov.source_id
  
 where tmp.field in ('STATUS') and coalesce(lov.row_key, case when IF(TRIM(tmp.from)=TRIM(tmp.to) OR LENGTH(tmp.to)=0,NULL,TRIM(SUBSTRING_INDEX(tmp.to, ',', -1))) is null then 0 else -1 end) <>coalesce(TRGT.task_attribute_wh_new_value_key,'')
 
 union all
 
select TRGT.row_id, TRGT.task_attribute_wh_new_value_key, ITE.row_key
from  #STG_TABLE_SCHEMA.issue_activity_temp tmp
 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item_activity TRGT 
 ON (tmp.sys_id = TRGT.row_id 
 AND tmp.sourceinstance=TRGT.source_id)
 
 left join #DWH_TABLE_SCHEMA.d_iteration ITE
 on ITE.row_id = IF(TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(tmp.from, ',', -2),',',1))=TRIM(SUBSTRING_INDEX(tmp.to, ',', -1)) 
 OR LENGTH(TRIM(SUBSTRING_INDEX(tmp.to, ',', -1)))=0,null,TRIM(SUBSTRING_INDEX(tmp.to, ',', -1))) and tmp.sourceinstance = ITE.source_id
  
 where tmp.field in ('ITERATION') and coalesce(ITE.row_key, case when IF(TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(tmp.from, ',', -2),',',1))=TRIM(SUBSTRING_INDEX(tmp.to, ',', -1)) 
 OR LENGTH(TRIM(SUBSTRING_INDEX(tmp.to, ',', -1)))=0,null,TRIM(SUBSTRING_INDEX(tmp.to, ',', -1))) is null then 0 else -1 end) <>
  coalesce(TRGT.task_attribute_wh_new_value_key,'')
 
 union all
 
 select TRGT.row_id, TRGT.task_attribute_wh_new_value_key, 0 as task_attribute_wh_new_value_key
 from  #STG_TABLE_SCHEMA.issue_activity_temp tmp
 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item_activity TRGT 
 ON (tmp.sys_id = TRGT.row_id 
 AND tmp.sourceinstance=TRGT.source_id)
 
 where tmp.field in ('STORY POINTS', 'TIMEORIGINALESTIMATE', 'BUSINESS VALUE') and coalesce(0) <>coalesce(TRGT.task_attribute_wh_new_value_key,'')
) SQ;