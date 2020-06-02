SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_burn_down.original_estimates_burn' ELSE 'SUCCESS' END as Message
FROM (
select DIT.row_id iteration_id, FWIACT.started_on_key, DWI.row_id work_item_id, FWIACT.source_id, FWIACT.changed_by, FWIACT.changed_on, FWIACT.created_by, FWIACT.created_on, FWIACT.work_item_key, FWIACT.cdctype
from #DWH_TABLE_SCHEMA.f_work_item_activity FWIACT
join #DWH_TABLE_SCHEMA.d_work_item DWI
on FWIACT.work_item_key = DWI.row_key
and FWIACT.source_id = DWI.source_id
join #DWH_TABLE_SCHEMA.d_iteration DIT
ON ((FWIACT.task_attribute_wh_name = 'ITERATION' 
AND (FWIACT.task_attribute_wh_new_value_key = DIT.row_key OR FWIACT.task_attribute_wh_old_value_key = DIT.row_key))
and DIT.source_id = FWIACT.source_id)
) SRC
 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item_burn_down TRGT 
 ON (concat(SRC.iteration_id, '~', SRC.started_on_key, '~', SRC.work_item_id) = TRGT.row_id 
 AND SRC.source_id=TRGT.source_id)
  
 left join 
 (
 select SR.work_item_key, SR.source_id, COALESCE(LKP.task_attribute_wh_new_value,0) original_estimates_burn
 from #DWH_TABLE_SCHEMA.f_work_item_activity SR
 left join #DWH_TABLE_SCHEMA.f_work_item_activity LKP
 on LKP.work_item_key = SR.work_item_key
 and LKP.source_id = SR.source_id
 and LKP.task_attribute_wh_name = 'TIMEORIGINALESTIMATE'
 and SR.started_on_key >= LKP.started_on_key 
 and SR.started_on_key < LKP.ended_on_key
 ORDER BY SR.primary_sequence_id DESC LIMIT 1
 ) LKP
 on LKP.work_item_key = SRC.work_item_key and LKP.source_id = SRC.source_id
 
WHERE TRGT.soft_deleted_flag = 'N' and COALESCE(LKP.original_estimates_burn,0) <> COALESCE(TRGT.original_estimates_burn ,'');