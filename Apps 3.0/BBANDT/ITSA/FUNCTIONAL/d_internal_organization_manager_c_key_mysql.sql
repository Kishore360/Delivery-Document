SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_configuration_item.manager_c_key' ELSE 'SUCCESS' END as Message
 FROM bbandt_mdsdb.sys_user_group_final SRC 
 LEFT JOIN bbandt_mdwdb.d_internal_organization TRGT ON (SRC.sys_id =right(TRGT.row_id,32) AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN bbandt_mdwdb.d_internal_contact LKP ON ( SRC.manager = right(LKP.row_id,32) AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.manager IS NULL THEN 0 else -1 end)<> (TRGT.manager_c_key)

