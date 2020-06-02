select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for f_case_activity.task_attribute_wh_next_value' else 'SUCCESS' end as Message
from
(select SRC.row_id from
#DWH_TABLE_SCHEMA.f_case_activity SRC join #DWH_TABLE_SCHEMA.f_case_activity TRGT
on SRC.case_key = TRGT.case_key and SRC.primary_sequence_id = TRGT.primary_sequence_id+1 
and SRC.task_attribute_wh_name = TRGT.task_attribute_wh_name
where
COALESCE(SRC.task_attribute_wh_next_value,0) <> COALESCE(TRGT.task_attribute_wh_next_value,0)
union all
select base.row_id
from #DWH_TABLE_SCHEMA.f_case_activity base 
join
(
select max(F.primary_sequence_id) max_sequence_id, case_key, task_attribute_wh_name
from #DWH_TABLE_SCHEMA.f_case_activity F
group by case_key, task_attribute_wh_name
)max_id
on base.case_key = max_id.case_key and max_id.max_sequence_id = base.primary_sequence_id and base.task_attribute_wh_name = max_id.task_attribute_wh_name
where coalesce(base.task_attribute_wh_next_value,'') <> coalesce(null,'') ) SQ;