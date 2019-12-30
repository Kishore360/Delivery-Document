SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident.u_resolved_c' ELSE 'SUCCESS' END as Message 
FROM ingrammicro_mdsdb.incident_final SRC
JOIN ingrammicro_mdwdb.d_incident TRGT  
ON (SRC.sys_id  = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id ) and SRC.cdctype<>'D'
WHERE  CONVERT_TZ(SRC.u_resolved,'GMT','America/Los_Angeles')<>TRGT.u_resolved_c; 
