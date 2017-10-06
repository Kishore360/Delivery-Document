
 SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_incident.u_potential_tier_resolution' ELSE 'SUCCESS' END as Message 
FROM qualcomm_mdsdb.incident_final SRC
JOIN qualcomm_mdwdb.d_incident TRGT  
ON (SRC.sys_id  = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id )
WHERE case when SRC.u_potential_tier_resolution='Yes' then 'Y' else 'N' end <> TRGT.u_potential_tier_resolution