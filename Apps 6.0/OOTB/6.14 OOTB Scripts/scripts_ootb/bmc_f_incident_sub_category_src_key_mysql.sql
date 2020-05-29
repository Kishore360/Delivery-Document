

SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_incident.sub_category_src_key' ELSE 'SUCCESS' END as Message from 
 (select count(1) cnt 
 FROM schneider_mdsdb.hpd_help_desk_final SRC 
JOIN schneider_mdwdb.f_incident TRGT 
ON SRC.incident_number = TRGT.row_id and  SRC.sourceinstance = TRGT.source_id
LEFT JOIN schneider_mdwdb.d_lov LKP 
 ON ( concat('SUBCATEGORY','~','INCIDENT','~',upper(subcategory))= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.product_categorization_tier_2 IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.sub_category_src_key,'')) b