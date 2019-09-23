SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_configuration_item_c.configuration_item_key' ELSE 'SUCCESS' END as Message 
FROM rogers6_mdsdb.cmdb_ci_final SRC1
JOIN rogers6_mdwdb.f_configuration_item_c TRGT 
ON (SRC1.sys_id = TRGT.row_id AND SRC1.sourceinstance = TRGT.source_id )  
LEFT JOIN rogers6_mdwdb.d_configuration_item LKP 
ON (COALESCE(SRC1.sys_id,'UNSPECIFIED') = LKP.row_id 
AND SRC1.sourceinstance = LKP.source_id ) 
WHERE COALESCE(LKP.row_key,CASE WHEN SRC1.sys_id IS NULL THEN 0 else -1 end)<> (TRGT.configuration_item_key) 
and SRC1.CDCTYPE='X' and LKP.soft_deleted_flag='N'