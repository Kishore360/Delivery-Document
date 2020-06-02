select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for f_change_request_activity.task_attribute_wh_next_value' else 'SUCCESS' end as Message
from
(select SRC.row_id from
#DWH_TABLE_SCHEMA.f_change_request_activity SRC join #DWH_TABLE_SCHEMA.f_change_request_activity TRGT
on SRC.change_request_key = TRGT.change_request_key and SRC.primary_sequence_id = TRGT.primary_sequence_id+1 
and SRC.task_attribute_wh_name = TRGT.task_attribute_wh_name
where
coalesce(case when SRC.expose_flag = 'Y' then COALESCE(SRC.task_attribute_wh_new_value_key,0) else 0 end,'') <> COALESCE(TRGT.task_attribute_wh_next_value_key,0)
union all
select base.row_id
from #DWH_TABLE_SCHEMA.f_change_request_activity base 
join
(
select max(F.primary_sequence_id) max_sequence_id, change_request_key, task_attribute_wh_name
from #DWH_TABLE_SCHEMA.f_change_request_activity F
group by change_request_key, task_attribute_wh_name
)max_id
on base.change_request_key = max_id.change_request_key and max_id.max_sequence_id = base.primary_sequence_id and base.task_attribute_wh_name = max_id.task_attribute_wh_name
where coalesce(base.task_attribute_wh_next_value_key,'') <> coalesce(0,'') ) SQ;