SELECT CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
, CASE WHEN COUNT(1) > 0 THEN 'started_on_key is incorrect in f_incident_activity' ELSE 'SUCCESS' END AS Message
from #DWH_TABLE_SCHEMA.f_incident_activity ta   
LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date CAL
ON DATE_FORMAT(greatest(ta.group_created_on, ta.state_created_on, ta.assigned_to_created_on), '%Y%m%d') = CAL.row_id
 
WHERE coalesce(CAL.row_key,-1) <> coalesce(ta.started_on_key,'')