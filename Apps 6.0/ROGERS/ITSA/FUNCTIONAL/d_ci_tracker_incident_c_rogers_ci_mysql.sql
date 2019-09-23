SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) 
 THEN 'MDS to DWH data validation failed for d_ci_tracker_incident_c.rogers6_ci' ELSE 'SUCCESS' END as Message
-- select distinct COALESCE(SRC.rogers6_ci,'UNSPECIFIED'),TRGT.rogers6_ci,SRC.cdctype
 FROM rogers6_mdsdb.us_ci_tracker_incident_final  SRC  
JOIN rogers6_mdwdb.d_ci_tracker_incident_c TRGT 
ON SRC.incident= TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id 
 WHERE  COALESCE(SRC.rogers6_ci,'UNSPECIFIED')<>TRGT.rogers6_ci
and SRC.CDCTYPE='X';

