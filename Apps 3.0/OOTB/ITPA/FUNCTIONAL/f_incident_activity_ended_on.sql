SELECT CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
, CASE WHEN COUNT(1) > 0 THEN 'ended_on is not correct in f_incident_activity' ELSE 'SUCCESS' END AS Message
from <<tenant>>_mdwdb.f_incident_activity 
where ended_on <> least(assigned_to_ended_on, group_ended_on, state_ended_on) 
