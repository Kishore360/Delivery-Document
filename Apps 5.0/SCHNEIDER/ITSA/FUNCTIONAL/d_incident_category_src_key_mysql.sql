SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  
THEN 'MDS to DWH data validation failed for d_incident.category_src_key' ELSE 'SUCCESS' END as Message from  
FROM schneider_mdsdb.hpd_help_desk_final SRC 
JOIN schneider_mdwdb.d_incident TRGT ON 
ON SRC.incident_number = TRGT.row_id  AND SRC.sourceinstance = TRGT.sourceid 
LEFT JOIN schneider_mdwdb.d_lov LKP 
ON ( concat( 'CATEGORY~INCIDENT~~~' ,upper( SRC.product_categorization_tier_1) = LKP.row_id AND SRC.sourceinstance = LKP.sourceid )) 
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.product_categorization_tier_1 IS NULL THEN 0 else -1 end) <> (TRGT.category_src_key) 
