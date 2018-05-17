SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident.u_subcategory' ELSE 'SUCCESS' END as Message 
FROM ( SELECT * FROM mcdonalds_mdsdb.incident_final WHERE CDCTYPE<>'D')  SRC 
JOIN mcdonalds_mdwdb.d_incident TRGT 
ON (SRC.sys_id = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id )  
LEFT JOIN mcdonalds_mdwdb.d_lov LKP 
ON ( concat( 'U_SUBCATEGORY_LOV_C~INCIDENT~~~' ,upper( SRC.u_subcategory)) = LKP.row_id  
AND SRC.sourceinstance = LKP.source_id )  
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_subcategory IS NULL THEN 0 else -1 end)<> (TRGT.sub_category_src_key) 
