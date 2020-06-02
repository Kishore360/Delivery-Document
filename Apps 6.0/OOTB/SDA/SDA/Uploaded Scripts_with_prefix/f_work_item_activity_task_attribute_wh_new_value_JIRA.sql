SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_activity.task_attribute_wh_new_value' ELSE 'SUCCESS' END as Message
 from (
 SELECT tmp.sys_id, tmp.field, 
 coalesce(IF(TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(tmp.from, ',', -2),',',1))=TRIM(SUBSTRING_INDEX(tmp.to, ',', -1)) 
 OR LENGTH(TRIM(SUBSTRING_INDEX(tmp.to, ',', -1)))=0
,NULL,TRIM(SUBSTRING_INDEX(tmp.to, ',', -1))), '') sr, coalesce(TRGT.task_attribute_wh_new_value,'')
 FROM #STG_TABLE_SCHEMA.issue_activity_temp tmp
 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item_activity TRGT 
 ON (tmp.sys_id = TRGT.row_id 
 AND tmp.issue_changelog_sourceinstance=TRGT.source_id)
 
WHERE tmp.field in ('STATUS', 'ITERATION') 
and coalesce(IF(TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(tmp.from, ',', -2),',',1))=TRIM(SUBSTRING_INDEX(tmp.to, ',', -1)) 
 OR LENGTH(TRIM(SUBSTRING_INDEX(tmp.to, ',', -1)))=0
,NULL,TRIM(SUBSTRING_INDEX(tmp.to, ',', -1))), '') <> coalesce(TRGT.task_attribute_wh_new_value,'')

union all

 SELECT tmp.sys_id, tmp.field, 
 coalesce(tmp.to, tmp.tostring) sr, coalesce(TRGT.task_attribute_wh_new_value,'')
 FROM #STG_TABLE_SCHEMA.issue_activity_temp tmp
 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item_activity TRGT 
 ON (tmp.sys_id = TRGT.row_id 
 AND tmp.issue_changelog_sourceinstance=TRGT.source_id)
 
WHERE tmp.field in ('STORY POINTS', 'TIMEORIGINALESTIMATE', 'BUSINESS VALUE') 
and round(case when coalesce(tmp.to, tmp.tostring) < 0 then null else coalesce(tmp.to, tmp.tostring) end,10) <> coalesce(TRGT.task_attribute_wh_new_value,'')
)SQ;