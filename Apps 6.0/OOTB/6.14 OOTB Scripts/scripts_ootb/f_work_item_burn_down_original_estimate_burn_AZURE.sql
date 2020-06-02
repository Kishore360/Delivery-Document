SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_burn_down.original_estimate_burn' ELSE 'SUCCESS' END as Message

/*select TRGT.row_id, SRC.work_item_key, SRC.source_id,
  cast(COALESCE(SRC.original_estimate_burn,0) as decimal(28,10)) sr, COALESCE(TRGT.original_estimate_burn ,'') tg*/
FROM (
 select SR.work_item_key, SR.source_id, SR.burn_on_key burn_on_key, max(coalesce(LKP.primary_sequence_id,0)) max_primary_sequence_id, 
  LKP.task_attribute_wh_new_value, COALESCE(LKP.task_attribute_wh_new_value,0) original_estimate_burn, 
  SR.sys_id, IF(COALESCE(LKP.ended_on_key,0)=0,'99991231',LKP.ended_on_key) X, LKP.ended_on_key
 from #STG_TABLE_SCHEMA.burn_down_temp_azure SR
 left join #DWH_TABLE_SCHEMA.f_work_item_activity LKP
 on SR.work_item_key = LKP.work_item_key
 and SR.source_id = LKP.source_id
 and LKP.task_attribute_wh_name = 'TIMEORIGINALESTIMATE'
 and SR.burn_on_key >= LKP.started_on_key
 and SR.burn_on_key < IF(COALESCE(LKP.ended_on_key,0)=0,'99991231',LKP.ended_on_key)
group by SR.work_item_key, SR.source_id, SR.burn_on_key
 ) SRC

LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item_burn_down TRGT 
-- ON (SRC.work_item_key = TRGT.work_item_key and SRC.burn_on_key = TRGT.work_item_burn_date_key
ON (SRC.sys_id = TRGT.row_id
AND SRC.source_id=TRGT.source_id)
 
WHERE TRGT.soft_deleted_flag = 'N' and cast(COALESCE(SRC.original_estimate_burn,0) as decimal(28,10)) <> COALESCE(TRGT.original_estimate_burn ,'');