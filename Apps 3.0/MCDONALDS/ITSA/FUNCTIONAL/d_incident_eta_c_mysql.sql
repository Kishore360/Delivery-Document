SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident.' ELSE 'SUCCESS' END as Message 
FROM mcdonalds_mdsdb.incident_final  SRC 
JOIN mcdonalds_mdwdb.d_incident TRGT 
ON (SRC.sys_id = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id )  
WHERE COALESCE( convert_tz(SRC.u_eta , <<TENANT_SSI_TIME_ZONE>>,<<DW_TARGET_TIME_ZONE>> )) <> TRGT.eta_c 
