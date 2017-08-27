SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  
THEN 'MDS to DWH data validation failed for d_incident.category_src_code' ELSE 'SUCCESS' END as Message from 
FROM schneider_mdsdb.hpd_help_desk_final  SRC JOIN schneider_mdwdb.d_incident TRGT 
ON SRC.incident_number = TRGT.row_id  AND SRC.sourceinstance = TRGT.sourceid 
WHERE SRC.product_categorization_tier_1 <> (TRGT.category_src_code) 
