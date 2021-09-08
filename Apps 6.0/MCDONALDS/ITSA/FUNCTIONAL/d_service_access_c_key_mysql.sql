SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_service.u_access' ELSE 'SUCCESS' END as Message 
FROM mcd_mdsdb.cmdb_ci_service_final  SRC 
JOIN mcd_mdwdb.d_service TRGT 
ON (concat( 'BUSINESS_SERVICE~' ,SRC.sys_id) = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id )  
LEFT JOIN mcd_mdwdb.d_lov LKP 
ON ( concat( 'U_ACCESS_C~CMDB_CI_SERVICE~~~' ,upper( SRC.u_access)) = LKP.row_id  
AND SRC.sourceinstance = LKP.source_id )  
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_access IS NULL THEN 0 else -1 end)<> (TRGT.access_c_key) 
