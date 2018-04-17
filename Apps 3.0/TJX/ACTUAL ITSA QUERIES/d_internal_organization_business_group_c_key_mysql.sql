SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.state_src_key' ELSE 'SUCCESS' END as Message
FROM (select count(1) cnt from tjx_mdsdb.sys_user_final SRC
LEFT JOIN tjx_mdwdb.d_internal_organization LKP 
 ON CONCAT('SUBSIDIARY~',u_business_group)= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id  
 LEFT JOIN tjx_mdwdb.d_internal_contact TRGT 
 ON (CONCAT('INTERNAL_CONTACT~',SRC.sys_id) =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_business_group IS NULL THEN 0 else -1 end)<> (TRGT.business_group_c_key))b
