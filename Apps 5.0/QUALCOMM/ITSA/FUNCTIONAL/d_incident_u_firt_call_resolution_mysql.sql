
 SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident.u_firt_call_resolution' ELSE 'SUCCESS' END as Message 
FROM  qualcomm_mdsdb.incident_final SRC
JOIN qualcomm_mdwdb.d_incident TRGT  
ON (SRC.sys_id  = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id )
WHERE case when SRC.u_firt_call_resolution='Yes' then 'Y' else 'N' end <> TRGT.u_firt_call_resolution
and SRC.CDCTYPE='X'