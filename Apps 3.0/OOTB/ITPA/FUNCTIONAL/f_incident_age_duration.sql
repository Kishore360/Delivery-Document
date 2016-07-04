select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident_age_duration' ELSE 'SUCCESS' END as Message
from <<tenant>>_mdwdb.f_incident TRGT 
  where coalesce((TRGT.age11440),'') <> coalesce(TRGT.age_duration,'') 
