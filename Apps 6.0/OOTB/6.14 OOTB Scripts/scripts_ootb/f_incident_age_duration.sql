select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident_age_duration' ELSE 'SUCCESS' END as Message
from #DWH_TABLE_SCHEMA.f_incident TRGT 
  where truncate(coalesce((TRGT.age/60),''),0) <> coalesce(TRGT.age_duration,'')