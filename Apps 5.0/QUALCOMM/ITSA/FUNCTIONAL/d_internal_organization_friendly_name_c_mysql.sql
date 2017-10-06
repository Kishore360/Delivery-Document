

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_internal_organization.friendly_name_c' ELSE 'SUCCESS' END as Message
 FROM qualcomm_mdsdb.sys_user_group_final  SRC 
 LEFT JOIN qualcomm_mdwdb.d_internal_organization TRGT 
 ON ( concat('GROUP~',SRC.sys_id )= TRGT.row_id
AND SRC.sourceinstance= TRGT.source_id )
 WHERE TRGT.friendly_name_c <> coalesce(SRC.u_friendly_name , 'UNSPECIFIED')
 
 
 
