SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request_activity.task_attribute_wh_next_value_key' ELSE 'SUCCESS' END as Message
FROM 
(
select base.row_id, base.task_attribute_wh_next_value_key
from #DWH_TABLE_SCHEMA.f_change_request_activity base 
join #DWH_TABLE_SCHEMA.f_change_request_activity next
on base.change_request_key = next.change_request_key and base.primary_sequence_id+1 = next.primary_sequence_id and base.task_attribute_wh_name = next.task_attribute_wh_name
where base.task_attribute_wh_name = 'STATE' and
coalesce(base.task_attribute_wh_next_value_key,'') <> coalesce(next.task_attribute_wh_new_value_key,'')
union all
select base.row_id, base.task_attribute_wh_next_value_key
from #DWH_TABLE_SCHEMA.f_change_request_activity base 
join
(
select max(F.primary_sequence_id) max_sequence_id, change_request_key, task_attribute_wh_name
from #DWH_TABLE_SCHEMA.f_change_request_activity F
group by change_request_key, task_attribute_wh_name
)max_id
on base.change_request_key = max_id.change_request_key and max_id.max_sequence_id = base.primary_sequence_id and base.task_attribute_wh_name = max_id.task_attribute_wh_name
where base.task_attribute_wh_name = 'STATE' and
coalesce(base.task_attribute_wh_next_value_key,'') <> coalesce(0,'')
) SQ