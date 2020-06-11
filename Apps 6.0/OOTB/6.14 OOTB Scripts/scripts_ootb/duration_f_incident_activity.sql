SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'data validation failed for f_incident_activity.duration'  ELSE 'SUCCESS' END as Message
FROM #DWH_TABLE_SCHEMA.f_incident_activity F
where coalesce(F.duration, '') <> coalesce(timestampdiff(second,
CONVERT_TZ(greatest(F.group_created_on, F.state_created_on,F.assigned_to_created_on),'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'),
CONVERT_TZ(least(F.group_ended_on, F.state_ended_on,F.assigned_to_ended_on),'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>')), '');