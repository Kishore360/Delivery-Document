select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for f_incident_activity.wh_old_value_changed_on_key' else 'SUCCESS' end as Message
from (select @task_rank := IF(@current_task = task_row_id, @task_rank + 1, 1) AS task_rank,
       @current_task := task_row_id 
,created_on_key,task_row_id,wh_old_value_changed_on_key,primary_sequence_id
from <<tenant>>_mdwdb.f_incident_activity
where task_attribute_wh_name ='state'
order by task_row_id,created_on_key,primary_sequence_id
) O,
(select @task_rank := IF(@current_task = task_row_id, @task_rank + 1, 1) AS task_rank,
       @current_task := task_row_id 
,created_on_key,task_row_id,wh_old_value_changed_on_key,primary_sequence_id
from <<tenant>>_mdwdb.f_incident_activity
where task_attribute_wh_name ='state'
order by task_row_id,created_on_key,primary_sequence_id
) N
where (O.task_row_id=N.task_row_id 
and O.task_rank+1=N.task_rank)
and N.primary_sequence_id not in(0,1)
and N.wh_old_value_changed_on_key <>O.created_on_key; 
