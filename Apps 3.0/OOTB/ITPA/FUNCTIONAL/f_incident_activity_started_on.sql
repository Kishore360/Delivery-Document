SELECT CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
, CASE WHEN COUNT(1) > 0 THEN 'started_on_on_on is not correct in f_incident_activity' ELSE 'SUCCESS' END AS Message
from <<tenant>>_mdwdb.f_incident_activity 
where started_on <> greatest(assigned_to_created_on, group_created_on, state_created_on)
