SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident.caller_id' ELSE 'SUCCESS' END as Message from schneider_mdsdb.hpd_help_desk_final  SRC 
JOIN schneider_mdwdb.d_incident TRGT 
ON SRC.incident_number = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id 
WHERE SRC.person_id <> TRGT.caller_id
