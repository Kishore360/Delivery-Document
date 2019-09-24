SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_cmdb_relationship_c.child_configuration_item_c_key' ELSE 'SUCCESS' END as Message 
FROM rogers6_mdsdb.cmdb_rel_ci_final SRC
JOIN rogers6_mdwdb.f_cmdb_relationship_c TRGT 
ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )  
LEFT JOIN rogers6_mdwdb.d_configuration_item LKP 
ON (COALESCE(SRC.child,'UNSPECIFIED') = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id ) 
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.child IS NULL THEN 0 else -1 end)<> (TRGT.child_configuration_item_c_key) 
and SRC.CDCTYPE='X' and LKP.soft_deleted_flag='N'