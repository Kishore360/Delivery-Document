
 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_internal_organization.level_type_c' ELSE 'SUCCESS' END as Message
 FROM rambus_mdsdb.sys_user_group_final s
 join rambus_mdwdb.d_internal_organization TRGT 
 ON (s.sys_id =right(TRGT.row_id,32) 
 AND s.sourceinstance= TRGT.source_id  )
 WHERE coalesce(s.u_level_type,'UNSPECIFIED') <> (TRGT.level_type_c)
 
 
 
 ;
 