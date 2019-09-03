SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
FROM  ( select count(1) cnt from 
rogers_mdwdb.d_configuration_item a 
JOIN rogers_mdsdb.cmdb_ci_final b
ON a.row_id = b.sys_id and a.source_id = b.sourceinstance 
LEFT join rogers_mdwdb.d_internal_organization d on d.row_id = CONCAT('GROUP~',b.support_group) and d.source_id = b.sourceinstance
where a.support_group_c_key <> COALESCE(d.row_key,CASE WHEN b.support_group IS NULL THEN 0 else -1 end) and b.cdctype<>'D')a;
