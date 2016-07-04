SELECT CASE WHEN COUNT(1) >0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN COUNT(1) >0 THEN 'wh_old_value_changed_on_key did not match for f_incident_activity' 
ELSE 'SUCCESS' END as Message
from <<tenant>>_mdwdb.f_incident_activity fina
left join <<tenant>>_mdwdb.f_incident f
on f.incident_key = fina.task_key
 where case 
when primary_sequence_id = 0 then null 
when primary_sequence_id = 1 then f.opened_on_key
end<> fina.wh_old_value_changed_on_key;
