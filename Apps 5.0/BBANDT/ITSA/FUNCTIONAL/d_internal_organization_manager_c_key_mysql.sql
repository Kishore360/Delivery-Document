SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_configuration_item.manager_c_key' ELSE 'SUCCESS' END as Message from 
 (select count(1) cnt
FROM bbandt_mdsdb.sys_user_group_final SRC 
LEFT JOIN (Select *,right(row_id,32) as jn1 FROM bbandt_mdwdb.d_internal_contact) LKP ON ( SRC.manager = LKP.jn1 AND SRC.sourceinstance= LKP.source_id )
JOIN (Select *,right(row_id,32) as jn2 FROM bbandt_mdwdb.d_internal_organization) TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance= TRGT.source_id)
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.manager IS NULL THEN 0 else -1 end)<> (TRGT.manager_c_key) 
 )c