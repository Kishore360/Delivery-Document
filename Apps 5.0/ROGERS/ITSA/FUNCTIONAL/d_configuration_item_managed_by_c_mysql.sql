SELECT CASE WHEN count(1) THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1) THEN 'MDS to DWH data validation failed for d_configuration_item.id_c' ELSE 'SUCCESS' END as Message 
FROM rogers_mdsdb.cmdb_ci_appl_final b 
LEFT JOIN rogers_mdsdb.cmdb_ci_server_final ser
ON b.sys_id = ser.sys_id and b.sourceinstance= ser.sourceinstance 
LEFT JOIN rogers_mdsdb.cmdb_model_final model
ON b.model_id = model.sys_id
LEFT JOIN rogers_mdsdb.cmdb_ci_netgear_final netgear
ON b.sys_id = netgear.sys_id and b.sourceinstance= netgear.sourceinstance
LEFT JOIN rogers_mdsdb.cmdb_ci_db_instance_final ins
ON b.sys_id = ins.sys_id and b.sourceinstance= ins.sourceinstance 
LEFT JOIN rogers_mdsdb.cmdb_ci_cluster_final clust
ON b.sys_id = clust.sys_id and b.sourceinstance= clust.sourceinstance
LEFT JOIN rogers_mdsdb.u_cmdb_ci_middleware_final middle
ON b.sys_id = middle.sys_id and b.sourceinstance= middle.sourceinstance
JOIN rogers_mdwdb.d_configuration_item TRGT 
ON b.sys_id = TRGT.row_id AND b.sourceinstance = TRGT.source_id 
WHERE COALESCE(ser.u_managed_by,netgear.u_managed_by,ins.u_managed_by,clust.u_managed_by,middle.u_managed_by,'UNSPECIFIED')<> TRGT.managed_by_c
and b.CDCTYPE='X' and ser.CDCTYPE='X' and model.CDCTYPE='X' and netgear.CDCTYPE='X' and ins.CDCTYPE='X' and clust.CDCTYPE='X' and middle.CDCTYPE='X';