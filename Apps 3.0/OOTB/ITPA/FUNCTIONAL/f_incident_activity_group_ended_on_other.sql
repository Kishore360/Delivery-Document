SELECT CASE WHEN COUNT(1) >0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN COUNT(1) >0 THEN 'group_ended_on did not match for f_incident_activity' 
ELSE 'SUCCESS' END as Message
from <<tenant>>_mdwdb.f_incident_activity where 
task_attribute_wh_name not in ('state','assignment_group','assigned_to') 
and group_ended_on is not null 
