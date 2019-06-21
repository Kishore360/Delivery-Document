SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_service.busines_criticality' ELSE 'SUCCESS' END as Message 
FROM mcdonalds_mdsdb.cmdb_ci_service_final  SRC 
JOIN mcdonalds_mdwdb.d_service TRGT 
ON (SRC.sys_id = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id )  
WHERE SRC.busines_criticality <> (TRGT.busines_criticality_c) 

