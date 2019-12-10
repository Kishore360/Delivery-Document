SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident.u_ecs_third_party_c' ELSE 'SUCCESS' END as Message 
FROM ingrammicro_mdsdb.incident_final SRC
JOIN ingrammicro_mdwdb.d_incident TRGT  
ON (SRC.sys_id  = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id ) and SRC.cdctype<>'D'
WHERE  coalesce(SRC.u_ecs_third_party,'UNSPECIFIED') <> TRGT.u_ecs_third_party_c;
