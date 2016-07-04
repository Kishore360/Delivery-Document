SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'data validation failed for f_incident_activity.primary_sequence_id'  ELSE 'SUCCESS' END as Message
 from <<tenant>>_mdwdb.f_incident_activity where task_attribute_wh_name not in ('state','assigned_to','assignment_group')
 and primary_sequence_id is not null;
