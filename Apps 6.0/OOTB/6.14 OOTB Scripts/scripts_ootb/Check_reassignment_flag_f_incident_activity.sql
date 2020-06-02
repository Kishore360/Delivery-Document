SELECT CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
, CASE WHEN COUNT(1) > 0 THEN 'reassigned_flag not set correctly in f_incident_activity' ELSE 'SUCCESS' END AS Message
from  #DWH_TABLE_SCHEMA.f_incident_activity ta 
where  ta.task_attribute_wh_name= 'assignment_group'
and CASE WHEN ta.task_attribute_wh_old_value is not null  
and ta.task_attribute_wh_new_value is not null 
THEN 'Y' ELSE 'N' END <> reassigned_flag
