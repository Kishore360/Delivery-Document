SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'data validation failed for f_request_task_activity.primary_sequence_id'  ELSE 'SUCCESS' END as Message
from (
select ftt.request_task_key,ftt.row_id,ftt.created_on_key, ftt.created_on,ftt.row_key,task_attribute_wh_name,task_attribute_wh_new_value,task_attribute_wh_old_value,ftt.primary_sequence_id,
                ((select count(*) from #DWH_TABLE_SCHEMA.f_request_task_activity ftt1 where ftt1.task_wh_type = 'sc_task' and ftt1.task_attribute_wh_name = 'state' 
                 AND ftt.request_task_key = ftt1.request_task_key  and (ftt1.created_on < ftt.created_on or (ftt1.created_on = ftt.created_on and ftt1.row_key > ftt.row_key))))  as primary_sequence_id1 
          FROM #DWH_TABLE_SCHEMA.f_request_task_activity ftt 
          join #DWH_TABLE_SCHEMA.d_request_task d on d.row_key = ftt.request_task_key
          WHERE ftt.task_wh_type = 'sc_task' and ftt.task_attribute_wh_name = 'state' and ftt.request_task_key != -1  and d.soft_deleted_flag = 'N'
          ORDER BY ftt.request_task_key,ftt.primary_sequence_id,task_attribute_wh_name
          ) A
WHERE A.primary_sequence_id <> A.primary_sequence_id1 OR A.primary_sequence_id IS NULL;