SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident.u_pending_reason' ELSE 'SUCCESS' END as Message 
FROM jnj_mdsdb.incident_final  SRC 
JOIN jnj_mdwdb.d_incident TRGT 
ON (SRC.sys_id = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id )  
LEFT JOIN jnj_mdwdb.d_lov LKP 
ON ( concat( 'STATUS_C~INCIDENT~~~' ,upper( SRC.u_status)) = LKP.row_id  
AND SRC.sourceinstance = LKP.source_id )  
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_status IS NULL THEN 0 else -1 end)<> (TRGT.incident_status_src_c_key) 



