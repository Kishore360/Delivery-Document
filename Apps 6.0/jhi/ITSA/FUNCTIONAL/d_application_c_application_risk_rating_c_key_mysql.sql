SELECT 
CASE WHEN CNT > 0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0  THEN 'MDS to DWH data validation failed for d_application_c.application_risk_rating_c_key' ELSE 'SUCCESS' END as Message 
FROM 
(
SELECT Count(1) as CNT 
FROM jhi_mdsdb.cmdb_ci_spkg_final SRC  
LEFT JOIN jhi_mdwdb.d_application_c TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )  
LEFT JOIN jhi_mdwdb.d_lov LKP ON ( concat( 'U_RISK_RATING_C~CMDB_CI_SPKG~' ,upper( SRC.u_risk_rating)) = LKP.row_id AND SRC.sourceinstance = LKP.source_id ) 
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_risk_rating IS NULL THEN 0 else -1 end) <> (TRGT.application_risk_rating_c_key) 
AND SRC.cdctype='X'
) temp; 

