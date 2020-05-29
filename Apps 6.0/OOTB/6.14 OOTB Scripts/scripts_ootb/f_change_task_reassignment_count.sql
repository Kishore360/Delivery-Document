SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_task.reassignment_count' ELSE 'SUCCESS' END as Message

-- select SRC.sys_id, TRGT.reassignment_count tg, coalesce(reasgn.reassignment_count,0) sr
from #MDS_TABLE_SCHEMA.change_task_final SRC
left join #DWH_TABLE_SCHEMA.f_change_task TRGT
on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
left join (
select base.change_task_key, base.source_id, 
count(case when coalesce(FCT.closed_on_key,'99990101') >= base.created_on_key and base.task_attribute_wh_old_value_key <> 0 then 
case when base.task_attribute_wh_new_value_key <> 0 and base.task_attribute_wh_old_value_key <> base.task_attribute_wh_new_value_key then base.row_id 
when base.task_attribute_wh_new_value_key = 0 and base.task_attribute_wh_next_value_key <> 0 then base.row_id 
else null end
else null end) as reassignment_count
from #DWH_TABLE_SCHEMA.f_change_task_activity base
left join #DWH_TABLE_SCHEMA.f_change_task FCT
on base.change_task_key=FCT.change_task_key and base.source_id=FCT.source_id
where base.task_wh_type = 'change_task' and base.task_attribute_wh_name = 'assignment_group' and base.primary_sequence_id <> 0
group by base.change_task_key, base.source_id 
) reasgn
on reasgn.change_task_key = TRGT.change_task_key and reasgn.source_id = TRGT.source_id
where coalesce(TRGT.reassignment_count,'')<>coalesce(reasgn.reassignment_count,0);