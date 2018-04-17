 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_customer_service_c.customer_service_category_c_key' ELSE 'SUCCESS' END as Message
FROM tjx_mdsdb.u_customer_service_final SRC
LEFT JOIN tjx_mdwdb.d_lov LKP 
 ON(COALESCE(CONCAT('U_SOCIAL_SOURCE_C~U_CUSTOMER_SERVICE~~~',UPPER(SRC.u_social_source)),'UNSPECIFIED')= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id ) 
 LEFT JOIN tjx_mdwdb.f_customer_service_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  AND DATE_FORMAT(pivot_date, '%Y-%m-%d %H:%i:%s') 
									BETWEEN effective_from AND effective_to )
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_social_source IS NULL THEN 0 else -1 end)<> (TRGT.social_source_c_key);
 
 
 