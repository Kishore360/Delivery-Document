SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_activity.task_attribute_wh_old_value_key' ELSE 'SUCCESS' END as Message
 FROM 
(
select TRGT.row_id, TRGT.task_attribute_wh_old_value_key, lov.row_key
FROM #STG_TABLE_SCHEMA.issue_activity_temp tmp
 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item_activity TRGT 
 ON (tmp.sys_id = TRGT.row_id 
 AND tmp.issue_changelog_sourceinstance=TRGT.source_id)
 
 left join #DWH_TABLE_SCHEMA.d_lov lov
 on lov.row_id = concat('STATUS~WORK_ITEM~', tmp.from) and lov.dimension_class = 'STATUS~WORK_ITEM' and tmp.issue_changelog_sourceinstance = lov.source_id
 
 where tmp.field in ('STATUS') and  
 coalesce(lov.row_key, case when TRIM(SUBSTRING_INDEX(tmp.from, ',', -1)) is null then 0 else -1 end) <>coalesce(TRGT.task_attribute_wh_old_value_key,'')
 
union all

select TRGT.row_id, TRGT.task_attribute_wh_old_value_key, ITE.row_key
FROM #STG_TABLE_SCHEMA.issue_activity_temp tmp

left join #STG_TABLE_SCHEMA.issue_activity_temp tmp_prev
on tmp.issue_changelog_issueid = tmp_prev.issue_changelog_issueid and tmp.issue_changelog_sourceinstance = tmp_prev.issue_changelog_sourceinstance 
and tmp.`field` = tmp_prev.`field` and tmp.primary_sequence_id - 1 = tmp_prev.primary_sequence_id
 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item_activity TRGT 
 ON (tmp.sys_id = TRGT.row_id 
 AND tmp.issue_changelog_sourceinstance=TRGT.source_id)
 
 left join #DWH_TABLE_SCHEMA.d_iteration ITE
 on ITE.row_id = coalesce(case when IF(TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(COALESCE(tmp_prev.from,tmp_prev.fromstring), ',', -2), ',', 1))=TRIM(SUBSTRING_INDEX(COALESCE(tmp_prev.to,tmp_prev.tostring),',', -1)) 
OR LENGTH(TRIM(SUBSTRING_INDEX(COALESCE(tmp_prev.to,tmp_prev.tostring), ',', -1)))=0, NULL, TRIM(SUBSTRING_INDEX(COALESCE(tmp_prev.to,tmp_prev.tostring), ',', -1))) is null then null 
else IF(LENGTH(COALESCE(tmp.from,tmp.fromstring))=0, NULL, TRIM(SUBSTRING_INDEX(COALESCE(tmp.from,tmp.fromstring), ',', -1))) end, 'UNSPECIFIED') and (tmp.issue_changelog_sourceinstance = ITE.source_id or ITE.source_id = 0)
 
 where tmp.field in ('ITERATION') and  
 coalesce(ITE.row_key, case when TRIM(SUBSTRING_INDEX(tmp.from, ',', -1)) is null then 0 else -1 end) <>coalesce(TRGT.task_attribute_wh_old_value_key,'')
  
union all
 
 select TRGT.row_id, TRGT.task_attribute_wh_old_value_key, 0 as task_attribute_wh_old_value_key
 from  #STG_TABLE_SCHEMA.issue_activity_temp tmp
 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item_activity TRGT 
 ON (tmp.sys_id = TRGT.row_id 
 AND tmp.issue_changelog_sourceinstance=TRGT.source_id)
 
 where tmp.field in ('STORY POINTS', 'TIMEORIGINALESTIMATE', 'BUSINESS VALUE') and coalesce(0) <>coalesce(TRGT.task_attribute_wh_old_value_key,'')
 
union all

 select TRGT.row_id, TRGT.task_attribute_wh_old_value_key, 0 as task_attribute_wh_old_value_key
 from #DWH_TABLE_SCHEMA.f_work_item_activity TRGT 
 where TRGT.task_attribute_wh_name in ('STATUS', 'ITERATION') and TRGT.primary_sequence_id = 0 and
 coalesce(TRGT.task_attribute_wh_old_value_key,'') <> coalesce(0,'')
) SQ ;