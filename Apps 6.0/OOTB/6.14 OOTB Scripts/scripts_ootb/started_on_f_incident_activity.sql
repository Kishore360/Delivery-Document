SELECT CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
, CASE WHEN COUNT(1) > 0 THEN 'started_on is incorrect in f_incident_activity' ELSE 'SUCCESS' END AS Message
from #DWH_TABLE_SCHEMA.f_incident_activity ta   
where coalesce(ta.started_on,'') <> greatest(ta.group_created_on, ta.state_created_on, ta.assigned_to_created_on)