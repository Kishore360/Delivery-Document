

select case when count(1) > 0  then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then CONCAT(CAST(COUNT(1) AS CHAR(10)), 'invalid multiple_categorization_flag set for stg_fs_incident') else 'SUCCESS' end as Message
from (select 1 from <<tenant>>_workdb.stg_fs_incident 
where CONCAT(row_id ,',' ,source_id) in (select CONCAT( ta.task_id, ',' , source_id) 
from <<tenant>>_workdb.stg_ts_task_activity ta where ta.task_wh_type = 'incident' 
and ta.task_attribute_wh_name = 'category' and  ta.task_attribute_wh_new_value <> ta.task_attribute_wh_old_value )
and multiple_categorization_flag <> 'Y' 
union
select 1 from <<tenant>>_workdb.stg_fs_incident 
where CONCAT(row_id  ,',' , source_id) not in (select CONCAT(ta.task_id ,',' , source_id
) from <<tenant>>_workdb.stg_ts_task_activity ta where ta.task_wh_type = 'incident' 
and ta.task_attribute_wh_name = 'category' and  ta.task_attribute_wh_new_value <> ta.task_attribute_wh_old_value )
and multiple_categorization_flag <> 'N'
) R

