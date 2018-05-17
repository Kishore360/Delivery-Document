SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident.u_incident_type' ELSE 'SUCCESS' END as Message 
FROM ( SELECT * FROM mcdonalds_mdsdb.incident_final WHERE CDCTYPE<>'D')  SRC 
JOIN mcdonalds_mdwdb.d_incident TRGT 
ON (SRC.sys_id = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id )  
LEFT JOIN mcdonalds_mdwdb.d_lov LKP 
ON ( concat( 'U_INCIDENT_TYPE_C~INCIDENT~~~' ,upper( SRC.u_incident_type)) = LKP.row_id  
AND SRC.sourceinstance = LKP.source_id )  
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_incident_type IS NULL THEN 0 else -1 end)<> (TRGT.incident_type_c_key) 
