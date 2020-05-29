SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'data validation failed for f_incident_activity.primary_sequence_id'  ELSE 'SUCCESS' END as Message
/*SELECT A.incident_key,A.row_id,A.created_on_key, A.created_on,A.row_key,task_attribute_wh_name,A.task_attribute_wh_new_value,A.task_attribute_wh_old_value,A.primary_sequence_id,A.primary_sequence_id1*/
from (
select ftt.incident_key,ftt.row_id,ftt.created_on_key, ftt.created_on,ftt.row_key,task_attribute_wh_name,task_attribute_wh_new_value,task_attribute_wh_old_value,ftt.primary_sequence_id,
                ((select count(*) + 1 from #DWH_TABLE_SCHEMA.f_incident_activity ftt1 where ftt1.task_wh_type = 'incident' and ftt1.task_attribute_wh_name = 'assignment_group' 
                 AND ftt.incident_key = ftt1.incident_key  and ftt1.created_on < ftt.created_on and ftt1.primary_sequence_id <> 0) )  as primary_sequence_id1 
          FROM #DWH_TABLE_SCHEMA.f_incident_activity ftt 
          WHERE ftt.task_wh_type = 'incident' and ftt.task_attribute_wh_name = 'assignment_group' and ftt.primary_sequence_id <> 0 
          ORDER BY ftt.incident_key,ftt.primary_sequence_id,task_attribute_wh_name
          ) A
left join #DWH_TABLE_SCHEMA.f_incident INC
on A.incident_key = INC.incident_key
WHERE INC.soft_deleted_flag = 'N' and A.primary_sequence_id <> A.primary_sequence_id1 OR A.primary_sequence_id IS NULL;