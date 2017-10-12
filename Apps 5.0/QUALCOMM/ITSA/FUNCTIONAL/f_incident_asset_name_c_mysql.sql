
 SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_incident.asset_name_c' ELSE 'SUCCESS' END as Message 
FROM  qualcomm_mdsdb.incident_final SRC
JOIN qualcomm_mdwdb.f_incident TRGT  
ON (SRC.sys_id  = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id )
WHERE  COALESCE(SRC.u_asset,'UNSPECIFIED') <> TRGT.asset_name_c


