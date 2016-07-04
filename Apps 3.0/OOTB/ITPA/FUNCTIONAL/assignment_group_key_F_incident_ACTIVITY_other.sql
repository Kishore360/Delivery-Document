SELECT CASE WHEN COUNT(1) >0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN COUNT(1) >0 THEN 'assignment_group_key did not match for f_incident_activity' 
ELSE 'SUCCESS' END as Message
from <<tenant>>_mdwdb.f_incident_activity where 
task_attribute_wh_name not in ('state','assignment_group','assigned_to') 
and assignment_group_key is not null
