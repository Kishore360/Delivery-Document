
select case when count(1) > 1 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 1 then CONCAT( CAST(COUNT(1) AS CHAR(10)), ' invalid aging_key set for f_incident') 
else 'SUCCESS' end as Message from(
select count(1) from
(
select (case when task_attribute_wh_new_value is not null and task_attribute_wh_old_value is not null then 'Y' else 'N' 
end),ta.reassigned_flag 
from <<tenant>>_mdwdb.f_t_task_activity ta
where task_attribute_wh_name= 'assignment_group'
and task_wh_type= 'incident'
and (case when task_attribute_wh_new_value is not null and task_attribute_wh_old_value is not null then 'Y' else 'N' end)
<>ta.reassigned_flag
)h
)e
