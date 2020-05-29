SELECT CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
, CASE WHEN COUNT(1) > 0 THEN 'started_on_on_on is not correct in f_change_request_activity' ELSE 'SUCCESS' END AS Message
from #DWH_TABLE_SCHEMA.f_change_request_activity 
where COALESCE(started_on,'') <> COALESCE(greatest(assigned_to_created_on, group_created_on, state_created_on),'')