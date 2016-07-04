SELECT CASE WHEN COUNT(1) >0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN COUNT(1) >0 THEN 'state_ended_on did not match for f_incident_activity' 
ELSE 'SUCCESS' END as Message
from <<tenant>>_mdwdb.f_incident_activity TRGT_A
join (select l.state_ended_on,l.task_row_id,l.primary_sequence_id
from <<tenant>>_mdwdb.f_incident_activity l
where l.task_attribute_wh_name ='assignment_group' 
and l.primary_sequence_id= (select max(o.primary_sequence_id)
from <<tenant>>_mdwdb.f_incident_activity o
where o.task_row_id = l.task_row_id
and o.primary_sequence_id<= l.primary_sequence_id
and o.task_attribute_wh_name ='state')
)TRGT_S
on(TRGT_A.task_row_id=TRGT_S.task_row_id
and TRGT_A.primary_sequence_id=TRGT_S.primary_sequence_id)
where case when TRGT_A.task_attribute_wh_name ='state' then adddate( TRGT_A.created_on, INTERVAL TRGT_A.primary_duration SECOND) 
when TRGT_A.task_attribute_wh_name = 'assignment_group' then TRGT_S.state_ended_on 
else null
end <> TRGT_A.state_ended_on ;
