SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
FROM  
rogersdev_mdwdb.d_configuration_item a 
JOIN rogersdev_mdsdb.cmdb_ci_final b
ON a.row_id = b.sys_id and a.source_id = b.sourceinstance 
LEFT join rogersdev_mdwdb.d_internal_contact d
on d.row_id = COALESCE(CONCAT('INTERNAL_CONTACT~',b.owned_by),'UNSPECIFIED')
where
a.owned_by_c_key <> COALESCE(d.row_key,CASE WHEN b.owned_by IS NULL THEN 0 else -1 end);
