select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for f_incident_activity.wh_old_value_changed_on_key' else 'SUCCESS' end as Message
from
(select f.primary_sequence_id AS task_rank, f.task_key task, f.created_on_key, f.wh_old_value_changed_on_key
from #DWH_TABLE_SCHEMA.f_incident_activity f
where f.task_attribute_wh_name ='assignment_group'
order by f.task_row_id, f.created_on_key
) O
join
(select f.primary_sequence_id AS task_rank, f.task_key task, f.created_on_key, f.wh_old_value_changed_on_key
from #DWH_TABLE_SCHEMA.f_incident_activity f
where f.task_attribute_wh_name ='assignment_group'
order by f.task_row_id, f.created_on_key
) N
on (O.task=N.task 
and O.task_rank+1=N.task_rank) 
where N.task_rank not in(0,1) and N.wh_old_value_changed_on_key <> O.created_on_key; 