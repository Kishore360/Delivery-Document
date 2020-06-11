SELECT 
CASE WHEN CNT > 0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0  THEN 'MDS to DWH data validation failed for f_incident.support_region_c_key' ELSE 'SUCCESS' END as Message 
FROM 
(
SELECT Count(1) as CNT 
FROM jhi_mdsdb.incident_final  SRC 
JOIN jhi_mdwdb.f_incident TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )  
LEFT JOIN jhi_mdwdb.d_support_region_c LKP ON ( concat( '' ,upper( SRC.u_support_region)) = LKP.row_id AND SRC.sourceinstance = LKP.source_id ) 
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_support_region IS NULL THEN 0 else -1 end)<> (TRGT.support_region_c_key) 
AND SRC.cdctype='X'
) temp;
