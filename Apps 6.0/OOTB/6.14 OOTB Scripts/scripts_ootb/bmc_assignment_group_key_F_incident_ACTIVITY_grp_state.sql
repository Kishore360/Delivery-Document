SELECT CASE WHEN COUNT(1) >0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN COUNT(1) >0 THEN 'assignment_group_key did not match for f_incident_activity' 
ELSE 'SUCCESS' END as Message
from #DWH_TABLE_SCHEMA.f_incident_activity TRGT_A
join (select l.assignment_group_key,l.incident_key,l.primary_sequence_id
from #DWH_TABLE_SCHEMA.f_incident_activity l
where l.task_attribute_wh_name ='state' 
and l.primary_sequence_id= (select max(o.primary_sequence_id)
from #DWH_TABLE_SCHEMA.f_incident_activity o
where o.incident_key = l.incident_key
and o.primary_sequence_id<= l.primary_sequence_id
and o.task_attribute_wh_name ='assignment_group')
)TRGT_S
on(TRGT_A.incident_key=TRGT_S.incident_key
and TRGT_A.primary_sequence_id=TRGT_S.primary_sequence_id)
where case when TRGT_A.task_attribute_wh_name ='assignment_group'then TRGT_A.task_attribute_wh_new_value_key 
when TRGT_A.task_attribute_wh_name = 'state' then TRGT_S.assignment_group_key 
else null
end <> TRGT_A.assignment_group_key;
