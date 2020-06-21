SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident.u_situation' ELSE 'SUCCESS' END as Message 
FROM mcdonalds_mdsdb.incident_final  SRC 
JOIN mcdonalds_mdwdb.d_incident TRGT 
ON (SRC.sys_id = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id and SRC.cdctype<>'D' )  
LEFT JOIN mcdonalds_mdwdb.d_lov LKP 
ON ( concat( 'U_SITUATION_C~INCIDENT~~~' ,upper( SRC.u_situation)) = LKP.row_id  
AND SRC.sourceinstance = LKP.source_id )  
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_situation IS NULL THEN 0 else -1 end)<> (TRGT.situation_c_key) 

