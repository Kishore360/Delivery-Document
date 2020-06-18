SELECT 
CASE WHEN CNT > 0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0   THEN 'MDS to DWH data validation failed for d_application_c.application_operational_status_c_key' ELSE 'SUCCESS' END as Message 
FROM 
(
SELECT Count(1) as CNT 
FROM jhi_mdsdb.cmdb_ci_spkg_final  SRC 
LEFT JOIN jhi_mdwdb.d_application_c TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )  
LEFT JOIN jhi_mdwdb.d_lov LKP ON ( concat( 'OPERATIONAL_STATUS~CMDB_CI~' ,upper( SRC.operational_status)) = LKP.row_id AND SRC.sourceinstance = LKP.source_id ) WHERE COALESCE(LKP.row_key,CASE WHEN SRC.operational_status IS NULL THEN 0 else -1 end)<> (TRGT.application_operational_status_c_key) 
AND SRC.cdctype='X'
) temp;


