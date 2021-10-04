SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident.u_original_request_item' ELSE 'SUCCESS' END as Message 
FROM mcdonalds_mdsdb.incident_final  SRC 
JOIN mcdonalds_mdwdb.f_incident TRGT 
ON (SRC.sys_id = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id )  
LEFT JOIN mcdonalds_mdwdb.d_request_item LKP 
ON ( concat( '' ,upper( SRC.u_original_request_item)) = LKP.row_id  
AND SRC.sourceinstance = LKP.source_id )  
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_original_request_item IS NULL THEN 0 else -1 end)<> (TRGT.original_request_item_c_key) 
