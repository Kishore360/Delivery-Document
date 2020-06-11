SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_activity.updated_by' ELSE 'SUCCESS' END as Message
 FROM #STG_TABLE_SCHEMA.issue_activity_temp tmp
 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item_activity TRGT 
 ON (tmp.sys_id = TRGT.row_id 
 AND tmp.sourceinstance=TRGT.source_id)
 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item_activity TRGT_NXT 
 ON (TRGT.work_item_key = TRGT_NXT.work_item_key and TRGT_NXT.primary_sequence_id = (TRGT.primary_sequence_id + 1) and TRGT.source_id = TRGT_NXT.source_id)

 LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact LKP 
 ON ( CONCAT('INTERNAL_CONTACT~',case when ASCII(COALESCE(TRGT_NXT.created_by,'')) = 0 then null else TRGT_NXT.created_by end) = LKP.row_id 
 AND TRGT_NXT.source_id = LKP.source_id )
  
 WHERE tmp.field in ('STATUS', 'ITERATION', 'STORY POINTS', 'TIMEORIGINALESTIMATE', 'BUSINESS VALUE') and COALESCE(case when ASCII(COALESCE(TRGT_NXT.created_by,'')) = 0 then null else LKP.full_name end, 'UNSPECIFIED')<> COALESCE(TRGT.updated_by ,'');