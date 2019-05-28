SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.location_key' ELSE 'SUCCESS' END as Message
 FROM (SELECT count(1) as CNT
 FROM tjx_mdsdb.u_customer_service_final SRC 
 LEFT JOIN tjx_mdwdb.f_customer_service_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id )
 LEFT JOIN tjx_mdwdb.d_internal_organization LKP 
 ON ( COALESCE(concat('SUBSIDIARY~',SRC.u_business_group),'UNSPECIFIED')= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_business_group IS NULL THEN 0 else -1 end)<> (TRGT.business_group_c_key)
 and TRGT.soft_deleted_flag='N')temp;
 

 
 