select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for f_incident_activity.wh_old_value_changed_on_key' else 'SUCCESS' end as Message
from (select @task_rank := IF(@current_task = IA.task_row_id, @task_rank + 1, 1) AS task_rank,
       @current_task := IA.task_row_id 
,IA.created_on_key,IA.task_row_id,IA.wh_old_value_changed_on_key,IA.primary_sequence_id
from #DWH_TABLE_SCHEMA.f_incident_activity IA
join #DWH_TABLE_SCHEMA.d_incident D
on D.row_key = IA.incident_key
where IA.task_attribute_wh_name ='state' and D.soft_deleted_flag = 'N'
order by IA.task_row_id,IA.created_on_key,IA.primary_sequence_id
) O,
(select @task_rank := IF(@current_task = task_row_id, @task_rank + 1, 1) AS task_rank,
       @current_task := IA.task_row_id 
,IA.created_on_key,IA.task_row_id,IA.wh_old_value_changed_on_key,IA.primary_sequence_id
from #DWH_TABLE_SCHEMA.f_incident_activity IA
join #DWH_TABLE_SCHEMA.d_incident D
on D.row_key = IA.incident_key
where IA.task_attribute_wh_name ='state' and D.soft_deleted_flag = 'N'
order by IA.task_row_id,IA.created_on_key,IA.primary_sequence_id
) N
where (O.task_row_id=N.task_row_id 
and O.task_rank+1=N.task_rank)
and N.primary_sequence_id not in(0,1)
and N.wh_old_value_changed_on_key <>O.created_on_key; 