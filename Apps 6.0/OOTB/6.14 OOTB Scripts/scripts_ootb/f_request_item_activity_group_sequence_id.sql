SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'data validation failed for f_request_item_activity.group_sequence_id [Failing due to data issue sys_id = ba50cc92db6a44506d78ca7e3b9619aa]'  ELSE 'SUCCESS' END as Message
from (
select ftt.request_item_key,ftt.row_id,ftt.created_on_key, ftt.created_on,ftt.row_key,task_attribute_wh_name,task_attribute_wh_new_value,task_attribute_wh_old_value,ftt.group_sequence_id,
                (select (count(*) + 1) from #DWH_TABLE_SCHEMA.f_request_item_activity ftt1 where ftt1.task_wh_type = 'sc_req_item' and ftt1.task_attribute_wh_name in ('state', 'assignment_group')
                 AND ftt.request_item_key = ftt1.request_item_key and (ftt1.created_on < ftt.created_on or (ftt1.created_on = ftt.created_on and ftt1.task_attribute_wh_name < ftt.task_attribute_wh_name)))  as group_sequence_id1 
          FROM #DWH_TABLE_SCHEMA.f_request_item_activity ftt 
		  left join #DWH_TABLE_SCHEMA.d_request_item d
          on d.row_key = ftt.request_item_key
          WHERE ftt.task_wh_type = 'sc_req_item' and ftt.task_attribute_wh_name in ('state', 'assignment_group') and ftt.request_item_key != -1 and d.soft_deleted_flag = 'N'
          ORDER BY ftt.request_item_key,ftt.primary_sequence_id,task_attribute_wh_name
          ) A
WHERE A.group_sequence_id <> A.group_sequence_id1 OR A.group_sequence_id IS NULL;