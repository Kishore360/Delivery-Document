SELECT CASE WHEN COUNT(1) >0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN COUNT(1) >0 THEN 'assigned_to_ended_on did not match for f_incident_activity' 
ELSE 'SUCCESS' END as Message
from #DWH_TABLE_SCHEMA.f_incident_activity TRGT_A
join (select l.assigned_to_ended_on,l.incident_key,l.primary_sequence_id
from #DWH_TABLE_SCHEMA.f_incident_activity l
where l.task_attribute_wh_name ='assignment_group' 
and l.primary_sequence_id= (select max(o.primary_sequence_id)
from #DWH_TABLE_SCHEMA.f_incident_activity o
where o.incident_key = l.incident_key
and o.primary_sequence_id<= l.primary_sequence_id
and o.task_attribute_wh_name ='assigned_to')
)TRGT_S
on(TRGT_A.incident_key=TRGT_S.incident_key
and TRGT_A.primary_sequence_id=TRGT_S.primary_sequence_id)
join #DWH_TABLE_SCHEMA.d_incident d on d.row_key = TRGT_A.incident_key and d.soft_deleted_flag = 'N'
where case when TRGT_A.task_attribute_wh_name ='assigned_to' then adddate( TRGT_A.created_on, INTERVAL TRGT_A.primary_duration SECOND) 
when TRGT_A.task_attribute_wh_name = 'assignment_group' then TRGT_S.assigned_to_ended_on 
else null
end <> TRGT_A.assigned_to_ended_on ;