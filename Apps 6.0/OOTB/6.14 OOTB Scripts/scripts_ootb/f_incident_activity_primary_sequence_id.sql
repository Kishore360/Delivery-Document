SELECT 
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'data validation failed for f_incident_activity.primary_sequence_id'  ELSE 'SUCCESS' END as Message
from (
select ftt.incident_key,ftt.row_id,ftt.created_on_key, ftt.created_on,ftt.row_key,task_attribute_wh_name,task_attribute_wh_new_value,task_attribute_wh_old_value,ftt.primary_sequence_id,
((select count(*) from #DWH_TABLE_SCHEMA.f_incident_activity ftt1 where ftt1.task_wh_type = 'incident' and ftt1.task_attribute_wh_name = ftt.task_attribute_wh_name
 AND ftt.incident_key = ftt1.incident_key and (ftt1.created_on < ftt.created_on or (ftt1.created_on = ftt.created_on and ftt1.task_attribute_wh_name < ftt.task_attribute_wh_name))))  as primary_sequence_id1 
FROM #DWH_TABLE_SCHEMA.f_incident_activity ftt 
join #DWH_TABLE_SCHEMA.d_incident d on d.row_key = ftt.incident_key
WHERE ftt.task_wh_type = 'incident' and ftt.task_attribute_wh_name in ('state', 'assigned_to', 'assignment_group') and ftt.incident_key != -1 and d.soft_deleted_flag = 'N'
ORDER BY ftt.incident_key,ftt.primary_sequence_id,ftt.task_attribute_wh_name
) A
WHERE A.primary_sequence_id <> A.primary_sequence_id1 OR A.primary_sequence_id IS NULL;