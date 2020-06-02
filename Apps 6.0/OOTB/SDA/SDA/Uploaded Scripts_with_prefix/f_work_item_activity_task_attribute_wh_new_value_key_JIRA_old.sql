SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_activity.task_attribute_wh_new_value_key' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.issue_changelog_final SRC
 left join #MDS_TABLE_SCHEMA.issue_changelog_items_final SRC2
 on SRC.id = SRC2.issuechangelogid and SRC.sourceinstance=SRC2.sourceinstance
 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item_activity TRGT 
 ON (concat(SRC.issueid, '~', SRC2.issuechangelogid, '~', SRC2.field) = TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id)
 
 left join #DWH_TABLE_SCHEMA.d_lov_map LM
 on LM.row_id = concat('STATUS~WORK_ITEM~', SRC2.to) and LM.dimension_class = 'STATUS~WORK_ITEM' 
  
 where SRC2.field = 'status' and coalesce(LM.wh_key, case when SRC2.tostring is null then 0 else -1 end) <>coalesce(TRGT.task_attribute_wh_new_value_key,'');