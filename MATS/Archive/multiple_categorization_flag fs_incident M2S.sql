


select case when count(*) > 0  then 'FAILURE' else 'SUCCESS' end as Result,
case when count(*) > 0 then CONCAT(CAST(COUNT(*) AS CHAR(10)), 'invalid multiple_categorization_flag set for fs_incident') else 'SUCCESS' end as Message
from (select * from #TABLE_SCHEMA.fs_incident 
where CONCAT(row_id ,',' ,source_id) in (select CONCAT( ta.task_row_id, ',' , source_id) 
from #TABLE_SCHEMA.ts_task_activity ta where ta.task_wh_type = 'incident' 
and ta.task_attribute_wh_name = 'category' and  ta.task_attribute_wh_new_value <> ta.task_attribute_wh_old_value )
and multiple_categorization_flag <> 'Y' 
union
select * from #TABLE_SCHEMA.fs_incident 
where CONCAT(row_id  ,',' , source_id) not in (select CONCAT(ta.task_row_id ,',' , source_id
) from #TABLE_SCHEMA.ts_task_activity ta where ta.task_wh_type = 'incident' 
and ta.task_attribute_wh_name = 'category' and  ta.task_attribute_wh_new_value <> ta.task_attribute_wh_old_value )
and multiple_categorization_flag <> 'N'
) R

