SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_burn_down.work_item_burn_date_key' ELSE 'SUCCESS' END as Message
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
 
WHERE TRGT.soft_deleted_flag = 'N' and coalesce(SRC.started_on_key,-1) <> coalesce(TRGT.work_item_burn_date_key,0);