






SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_customer_service_c.ca_standards_c_key' ELSE 'SUCCESS' END as Message
FROM tjx_mdsdb.u_customer_service_final SRC
LEFT JOIN tjx_mdwdb.d_lov LKP 
 ON LKP.dimension_class like '%U_SOURCE_C~U_CUSTOMER_SERVICE%' and 
( concat('U_SOURCE_C~U_CUSTOMER_SERVICE~~~',UPPER(SRC.u_source))= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id ) 
 LEFT JOIN tjx_mdwdb.f_customer_service_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_source IS NULL THEN 0 else -1 end)<> (TRGT.source_c_key);

