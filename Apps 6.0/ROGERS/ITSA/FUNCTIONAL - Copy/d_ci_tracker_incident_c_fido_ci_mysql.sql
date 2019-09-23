SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) 
 THEN 'MDS to DWH data validation failed for d_ci_tracker_incident_c.fido_ci' ELSE 'SUCCESS' END as Message
-- select distinct COALESCE(SRC.fido_ci,'UNSPECIFIED'),TRGT.fido_ci,SRC.cdctype
 FROM rogers_mdsdb.us_ci_tracker_incident_final  SRC  
JOIN rogers_mdwdb.d_ci_tracker_incident_c TRGT 
ON SRC.incident= TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id 
 WHERE  COALESCE(SRC.fido_ci,'UNSPECIFIED')<>TRGT.fido_ci
and SRC.CDCTYPE='X';

