SELECT CASE WHEN COUNT(1) >0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN COUNT(1) >0 THEN 'assigned_to_key did not match for f_incident_activity' 
/*select TRGT.row_key, TRGT.incident_key, TRGT.task_attribute_wh_name, TRGT.assigned_to_key,
case when TRGT.task_attribute_wh_name = 'assigned_to' then TRGT.task_attribute_wh_new_value_key
  when TRGT.task_attribute_wh_name = 'state' then (select ia.task_attribute_wh_new_value_key
     from #DWH_TABLE_SCHEMA.f_incident_activity ia
     where TRGT.incident_key = ia.incident_key 
     and (TRGT.created_on > ia.created_on or (TRGT.created_on = ia.created_on and TRGT.row_key > ia.row_key))
     and ia.task_attribute_wh_name = 'assigned_to'
     order by ia.primary_sequence_id desc LIMIT 1
    )
  when TRGT.task_attribute_wh_name = 'assignment_group' then (select ia.task_attribute_wh_new_value_key
     from #DWH_TABLE_SCHEMA.f_incident_activity ia
     where TRGT.incident_key = ia.incident_key 
     and (TRGT.created_on > ia.created_on or (TRGT.created_on = ia.created_on and TRGT.row_key > ia.row_key))
     and ia.task_attribute_wh_name = 'assigned_to'
     order by ia.primary_sequence_id desc LIMIT 1
    )
  else -1 end sr*/

from #DWH_TABLE_SCHEMA.f_incident_activity TRGT
where TRGT.incident_key <> -1 and 
coalesce(case when TRGT.task_attribute_wh_name = 'assigned_to' then TRGT.task_attribute_wh_new_value_key
  when TRGT.task_attribute_wh_name = 'state' then (select ia.task_attribute_wh_new_value_key
     from #DWH_TABLE_SCHEMA.f_incident_activity ia
     where TRGT.incident_key = ia.incident_key 
     and (TRGT.created_on > ia.created_on or (TRGT.created_on = ia.created_on and TRGT.row_key > ia.row_key))
     and ia.task_attribute_wh_name = 'assigned_to'
     order by ia.primary_sequence_id desc LIMIT 1
    )
  when TRGT.task_attribute_wh_name = 'assignment_group' then (select ia.task_attribute_wh_new_value_key
     from #DWH_TABLE_SCHEMA.f_incident_activity ia
     where TRGT.incident_key = ia.incident_key 
     and (TRGT.created_on > ia.created_on or (TRGT.created_on = ia.created_on and TRGT.row_key > ia.row_key))
     and ia.task_attribute_wh_name = 'assigned_to'
     order by ia.primary_sequence_id desc LIMIT 1
    )
  else -1 end, -1) <> coalesce(TRGT.assigned_to_key, -1)