 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_customer_service.closed_by_key' ELSE 'SUCCESS' END as Message
 FROM tjx_mdsdb.u_customer_service_final SRC 
 LEFT JOIN tjx_mdwdb.f_customer_service_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id   )
 LEFT JOIN tjx_mdwdb.d_internal_contact LKP 
 ON ( COALESCE(concat('INTERNAL_CONTACT~',SRC.closed_by),'UNSPECIFIED')= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.closed_by IS NULL THEN 0 else -1 end)<> (TRGT.closed_by_key)
 
 