
select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_security_response.reassignment_count' ELSE 'SUCCESS' END as Message
from #DWH_TABLE_SCHEMA.f_security_response_task d 
join (select task_key, count(row_key) as primary_sequence_id
		from #DWH_TABLE_SCHEMA.f_security_response_task_activity 
		where task_wh_type='sn_si_task' and task_attribute_wh_name='assignment_group'  and task_attribute_wh_old_value is not NULL group by task_key) f
on d.security_response_task_key =f.task_key 
where d.reassignment_count <> COALESCE(f.primary_sequence_id,0)