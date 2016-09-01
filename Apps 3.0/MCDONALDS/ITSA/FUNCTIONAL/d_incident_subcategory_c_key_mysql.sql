SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident.u_subcategory' ELSE 'SUCCESS' END as Message 
FROM <<tenant>>_mdsdb.incident_final  SRC 
JOIN <<tenant>>_mdwdb.d_incident TRGT 
ON (SRC.sys_id = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id )  
LEFT JOIN <<tenant>>_mdwdb.d_lov LKP 
ON ( concat( 'U_SUBCATEGORY_C~INCIDENT~~~' ,upper( SRC.u_subcategory)) = LKP.row_id  
AND SRC.sourceinstance = LKP.source_id )  
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_subcategory IS NULL THEN 0 else -1 end)<> (TRGT.subcategory_c_key) 
