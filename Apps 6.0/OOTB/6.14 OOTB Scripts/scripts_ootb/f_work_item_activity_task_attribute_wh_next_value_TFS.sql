SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_activity.task_attribute_wh_next_value_key' ELSE 'SUCCESS' END as Message
 
FROM 
(
select base.row_id, base.task_attribute_wh_next_value, next.task_attribute_wh_new_value,base.source_id
from #DWH_TABLE_SCHEMA.f_work_item_activity base 
join #DWH_TABLE_SCHEMA.f_work_item_activity next
on base.work_item_key = next.work_item_key and base.primary_sequence_id+1 = next.primary_sequence_id and base.task_attribute_wh_name = next.task_attribute_wh_name and next.source_id=base.source_id
where base.task_attribute_wh_name in ('STATUS') and
coalesce(base.task_attribute_wh_next_value,'') <> coalesce(next.task_attribute_wh_new_value,'')
union all
select base.row_id, base.task_attribute_wh_next_value, null as task_attribute_wh_new_value,base.source_id
from #DWH_TABLE_SCHEMA.f_work_item_activity base 
join
(
select max(F.primary_sequence_id) max_sequence_id, work_item_key, task_attribute_wh_name, source_id
from #DWH_TABLE_SCHEMA.f_work_item_activity F
group by work_item_key, task_attribute_wh_name, source_id
)max_id
on base.work_item_key = max_id.work_item_key and max_id.max_sequence_id = base.primary_sequence_id and base.task_attribute_wh_name = max_id.task_attribute_wh_name and base.source_id=max_id.source_id
where base.task_attribute_wh_name in ('STATUS') and
coalesce(base.task_attribute_wh_next_value,'') <> coalesce(null,'')
) SQ