
 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_internal_contact.group_level_c' ELSE 'SUCCESS' END as Message
 FROM cardinalhealth_mdsdb.sys_user_final s
 join cardinalhealth_mdwdb.d_internal_contact TRGT 
 ON (s.sys_id =right(TRGT.row_id,32) 
 AND s.sourceinstance= TRGT.source_id  )
 WHERE coalesce(s.u_sub_business_unit,'UNSPECIFIED') <> (TRGT.sub_business_unit_c )
 ;
 
 