select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH validation failed for d_request_item.stage_count' else 'SUCCESS' end as Message
-- select SRC.sys_id, TRGT.stage_count tg, coalesce(stage.stage_count,0) sr
from #MDS_TABLE_SCHEMA.sc_req_item_final SRC
left join #DWH_TABLE_SCHEMA.d_request_item TRGT
on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
left join (
select base.request_item_key, base.source_id, 
count(case when base.task_attribute_wh_old_value_key <> 0 then 
case when base.task_attribute_wh_new_value_key <> 0 and coalesce(base.task_attribute_wh_old_value, '') <> coalesce(base.task_attribute_wh_new_value, '') then base.row_id 
when base.task_attribute_wh_new_value_key = 0 and base.task_attribute_wh_next_value_key <> 0 then base.row_id 
else null end
else null end) as stage_count
from #DWH_TABLE_SCHEMA.f_request_item_activity base
where base.task_attribute_wh_name = 'stage' and base.primary_sequence_id <> 0
group by base.request_item_key, base.source_id 
) stage
on stage.request_item_key = TRGT.row_key and stage.source_id = TRGT.source_id
where coalesce(TRGT.stage_count,'')<>coalesce(stage.stage_count,0);