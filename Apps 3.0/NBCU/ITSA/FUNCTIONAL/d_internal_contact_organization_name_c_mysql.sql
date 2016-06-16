SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for service desk attribute' ELSE 'SUCCESS' END as Message
 
 
 FROM   nbcu_mdsdb.sys_user_final scu 
 LEFT JOIN    nbcu_mdwdb.d_internal_contact TRGT
 ON ( concat('INTERNAL_CONTACT~',scu.sys_id)= TRGT.row_id 
 AND scu.sourceinstance= TRGT.source_id )

 WHERE u_organization_name<> (TRGT.organization_name_c) 

 
 