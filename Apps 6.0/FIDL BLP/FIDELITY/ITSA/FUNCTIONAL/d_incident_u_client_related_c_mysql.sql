SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident.u_client_related_c' ELSE 'SUCCESS' END as Message 
FROM fidelity_mdsdb.incident_final  SRC 
JOIN fidelity_mdwdb.d_incident TRGT 
ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )  
WHERE case when SRC.u_client_related = 1 then 'Y' else 'N' end <> (TRGT.u_client_related_c) 
