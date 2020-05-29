SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_activity.task_attribute_wh_old_value' ELSE 'SUCCESS' END as Message
from (
 SELECT tmp.sys_id, tmp.field, 
 coalesce(tmp.from, tmp.fromstring) sr, coalesce(TRGT.task_attribute_wh_old_value,'')
 FROM #STG_TABLE_SCHEMA.issue_activity_temp tmp
 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item_activity TRGT 
 ON (tmp.sys_id = TRGT.row_id 
 AND tmp.sourceinstance=TRGT.source_id)
 
 where tmp.field in ('STATUS') and 
 coalesce(TRIM(SUBSTRING_INDEX(tmp.from, ',', -1)), '') <> coalesce(TRGT.task_attribute_wh_old_value,'')
 
 union all
 
 SELECT tmp.sys_id, tmp.field, 
 coalesce(tmp.from, tmp.fromstring) sr, coalesce(TRGT.task_attribute_wh_old_value,'')
 FROM #STG_TABLE_SCHEMA.issue_activity_temp tmp

left join #STG_TABLE_SCHEMA.issue_activity_temp tmp_prev
on tmp.issueid = tmp_prev.issueid and tmp.sourceinstance = tmp_prev.sourceinstance 
and tmp.`field` = tmp_prev.`field` and tmp.primary_sequence_id - 1 = tmp_prev.primary_sequence_id
 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item_activity TRGT 
 ON (tmp.sys_id = TRGT.row_id 
 AND tmp.sourceinstance=TRGT.source_id)
 
 where tmp.field in ('ITERATION') and 
 coalesce(case when IF(TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(COALESCE(tmp_prev.from,tmp_prev.fromstring), ',', -2), ',', 1))=TRIM(SUBSTRING_INDEX(COALESCE(tmp_prev.to,tmp_prev.tostring),',', -1)) 
OR LENGTH(TRIM(SUBSTRING_INDEX(COALESCE(tmp_prev.to,tmp_prev.tostring), ',', -1)))=0, NULL, TRIM(SUBSTRING_INDEX(COALESCE(tmp_prev.to,tmp_prev.tostring), ',', -1))) is null then null 
else IF(LENGTH(COALESCE(tmp.from,tmp.fromstring))=0, NULL, TRIM(SUBSTRING_INDEX(COALESCE(tmp.from,tmp.fromstring), ',', -1))) end, '') <> coalesce(TRGT.task_attribute_wh_old_value,'')
 
 union all

 SELECT tmp.sys_id, tmp.field, 
 coalesce(tmp.from, tmp.fromstring) sr, coalesce(TRGT.task_attribute_wh_old_value,'')
 FROM #STG_TABLE_SCHEMA.issue_activity_temp tmp
 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item_activity TRGT 
 ON (tmp.sys_id = TRGT.row_id 
 AND tmp.sourceinstance=TRGT.source_id)
 
WHERE tmp.field in ('STORY POINTS', 'TIMEORIGINALESTIMATE', 'BUSINESS VALUE') 
and case when coalesce(tmp.from, tmp.fromstring) = 0 then null else coalesce(tmp.from, tmp.fromstring) end <> coalesce(TRGT.task_attribute_wh_old_value,'')
)SQ;