SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_service.busines_criticality' ELSE 'SUCCESS' END as Message 
FROM <<tenant>>_mdsdb.cmdb_ci_service_final  SRC 
JOIN <<tenant>>_mdwdb.d_service TRGT 
ON (SRC.sys_id = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id )  
LEFT JOIN <<tenant>>_mdwdb.d_lov LKP 
ON ( concat( 'BUSINES_CRITICALITY_C~CMDB_CI_SERVICE~~~' ,upper( SRC.busines_criticality)) = LKP.row_id  
AND SRC.sourceinstance = LKP.source_id )  
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.busines_criticality IS NULL THEN 0 else -1 end)<> (TRGT.busines_criticality_c_key) 
