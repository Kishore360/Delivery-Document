SELECT CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
, CASE WHEN COUNT(1) > 0 THEN 'reopened_flag not set correctly in t_task_activity' ELSE 'SUCCESS' END AS Message
from <<tenant>>_mdwdb.f_incident_activity ta   
where CASE WHEN ta.task_attribute_wh_old_value in ( 'CLOSED','RESOLVED') 
and ta.task_attribute_wh_new_value in('OPEN') THEN 'Y' ELSE 'N' END <> ta.reopened_flag
