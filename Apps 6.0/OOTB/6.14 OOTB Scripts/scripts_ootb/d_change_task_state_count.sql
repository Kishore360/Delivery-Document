select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH validation failed for d_change_task.state_count' else 'SUCCESS' end as Message
-- select SRC.sys_id, TRGT.state_count tg, coalesce(state.state_count,0) sr
from #MDS_TABLE_SCHEMA.change_task_final SRC
left join #DWH_TABLE_SCHEMA.d_change_task TRGT
on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
left join (
select base.change_task_key, base.source_id, 
count(case when base.task_attribute_wh_old_value_key <> 0 then 
case when base.task_attribute_wh_new_value_key <> 0 and coalesce(base.task_attribute_wh_old_value, '') <> coalesce(base.task_attribute_wh_new_value, '') then base.row_id 
when base.task_attribute_wh_new_value_key = 0 and base.task_attribute_wh_next_value_key <> 0 then base.row_id 
else null end
else null end) as state_count
from #DWH_TABLE_SCHEMA.f_change_task_activity base
where base.task_attribute_wh_name = 'state' and base.primary_sequence_id <> 0
group by base.change_task_key, base.source_id 
) state
on state.change_task_key = TRGT.row_key and state.source_id = TRGT.source_id
where coalesce(TRGT.state_count,'')<>coalesce(state.state_count,0);