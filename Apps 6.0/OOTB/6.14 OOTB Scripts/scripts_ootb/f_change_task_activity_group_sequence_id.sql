SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'data validation failed for f_change_task_activity.group_sequence_id'  ELSE 'SUCCESS' END as Message
from (
select ftt.change_task_key,ftt.row_id,ftt.created_on_key, ftt.created_on,ftt.row_key,task_attribute_wh_name,task_attribute_wh_new_value,task_attribute_wh_old_value,ftt.group_sequence_id,
                (select count(*)+1 from #DWH_TABLE_SCHEMA.f_change_task_activity ftt1 where ftt1.task_wh_type = 'change_task' and ftt1.task_attribute_wh_name in ('state', 'assignment_group')
                 AND ftt.change_task_key = ftt1.change_task_key and (ftt1.created_on < ftt.created_on or (ftt1.created_on = ftt.created_on and 
                  (ftt1.task_attribute_wh_name < ftt.task_attribute_wh_name or (ftt1.task_attribute_wh_name = ftt.task_attribute_wh_name and ftt1.primary_sequence_id < ftt.primary_sequence_id))))) as group_sequence_id1 
          FROM #DWH_TABLE_SCHEMA.f_change_task_activity ftt 
		  left join #DWH_TABLE_SCHEMA.d_change_task d
          on d.row_key = ftt.change_task_key
          WHERE ftt.task_wh_type = 'change_task' and ftt.task_attribute_wh_name in ('state', 'assignment_group') and ftt.change_task_key != -1 and d.soft_deleted_flag = 'N'
          ORDER BY ftt.change_task_key,ftt.primary_sequence_id,task_attribute_wh_name
          ) A
WHERE A.group_sequence_id <> A.group_sequence_id1 OR A.group_sequence_id IS NULL;