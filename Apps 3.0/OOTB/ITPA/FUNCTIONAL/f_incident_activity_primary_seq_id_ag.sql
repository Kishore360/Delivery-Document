SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'data validation failed for f_incident_activity.primary_sequence_id'  ELSE 'SUCCESS' END as Message
from (
select ftt.task_key,ftt.row_id,ftt.created_on_key, ftt.created_on,ftt.row_key,task_attribute_wh_name,task_attribute_wh_new_value,task_attribute_wh_old_value,ftt.primary_sequence_id,
                ((select count(1) from <<tenant>>_mdwdb.f_incident_activity ftt1 where ftt1.task_wh_type = 'incident' and ftt1.task_attribute_wh_name = 'assignment_group' 
                 AND ftt.task_key = ftt1.task_key  and ftt1.created_on < ftt.created_on ) )  as primary_sequence_id1 
          FROM <<tenant>>_mdwdb.f_incident_activity ftt 
          WHERE ftt.task_wh_type = 'incident' and ftt.task_attribute_wh_name = 'assignment_group' and ftt.task_key != -1 
          ORDER BY ftt.task_key,ftt.primary_sequence_id,task_attribute_wh_name
          ) A
WHERE A.primary_sequence_id <> A.primary_sequence_id1 OR A.primary_sequence_id IS NULL
