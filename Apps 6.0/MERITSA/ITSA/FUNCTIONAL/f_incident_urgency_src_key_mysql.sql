SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_incident.urgency_src_key' ELSE 'SUCCESS' END as Message 
FROM meritsa_mdsdb.incident_final  SRC 
JOIN meritsa_mdwdb.f_incident TRGT 
ON (SRC.sys_id = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id )  
JOIN meritsa_mdwdb.d_lov LKP 
ON COALESCE( concat( 'URGENCY~incident~' ,upper( SRC.urgency)),'UNSPECIFIED') = LKP.row_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.urgency IS NULL THEN 0 else -1 end)<> (TRGT.urgency_src_key) 
