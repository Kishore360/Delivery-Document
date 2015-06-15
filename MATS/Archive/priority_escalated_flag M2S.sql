

select case when count(*) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(*) > 0 then CONCAT( CAST(COUNT(*) AS CHAR(10)), 'invalid priority_escalated_flag set for #TABLE_NAME') else 'SUCCESS' end as Message 
from (select *
from  #TABLE_SCHEMA.#TABLE_NAME 
where (concat(row_id , ',' ,source_id)) in (select concat(ta.task_row_id, ',' ,source_id)   
from #TABLE_SCHEMA.ts_task_activity ta where ta.task_wh_type = '#TYPE' and ta.task_attribute_wh_name = 'priority' 
and ta.task_attribute_wh_old_value is not null and ta.task_attribute_wh_new_value is not null 
and ta.task_attribute_wh_new_value < ta.task_attribute_wh_old_value )
and priority_escalated_flag <> 'Y' 
union
select *
from  #TABLE_SCHEMA.#TABLE_NAME
where (concat(row_id , ',' ,source_id)) not in (select concat(ta.task_row_id ,',', source_id )  
from #TABLE_SCHEMA.ts_task_activity ta where ta.task_wh_type = '#TYPE' and ta.task_attribute_wh_name = 'priority' 
and ta.task_attribute_wh_old_value is not null and ta.task_attribute_wh_new_value is not null
and ta.task_attribute_wh_new_value < ta.task_attribute_wh_old_value )
and priority_escalated_flag <> 'N' 
) R
