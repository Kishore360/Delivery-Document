
select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.age' ELSE 'SUCCESS' END as Messag
from #DWH_TABLE_SCHEMA.f_incident d 
join (select task_key, count(row_key) as primary_sequence_id
		from #DWH_TABLE_SCHEMA.f_incident_activity 
		where task_wh_type='hr_case' and task_attribute_wh_name='assignment_group'  and task_attribute_wh_old_value is not NULL group by task_key) f
on d.incident_key=f.task_key 
where d.reassignment_count_numerify <> COALESCE(f.primary_sequence_id,0)
