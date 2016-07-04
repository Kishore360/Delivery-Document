
select row_key,task_key, task_wh_type,soft_deleted_flag,source_id,etl_run_number,
work_notes
from (select row_key,task_key, task_wh_type,soft_deleted_flag,source_id,etl_run_number,
task_attribute_wh_new_value as work_notes
from <<tenant>>_mdwdb.f_incident_activity 
where task_attribute_wh_name ='work_notes'
and task_wh_type='incident'
and task_key <>'-1'
-- union 
-- select row_key,task_key, task_wh_type,soft_deleted_flag,source_id,etl_run_number,
-- task_attribute_wh_old_value
-- from <<tenant>>_mdwdb.f_incident_activity 
-- where task_attribute_wh_name ='work_notes'
-- and task_wh_type='incident'
) S
order by row_key,task_key, task_wh_type,soft_deleted_flag,source_id,etl_run_number,
work_notes
