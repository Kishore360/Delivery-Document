SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_configuration_item.environment_c' ELSE 'SUCCESS' END as Message 
FROM (select sys_id, sourceinstance from aetna_mdsdb.cmdb_ci_final where CDCTYPE<>'D') src
left join aetna_mdsdb.cmdb_ci_server_final ser on src.sys_id=ser.sys_id and src.sourceinstance=ser.sourceinstance
left join aetna_mdsdb.cmdb_ci_db_instance_final db_ins on src.sys_id=db_ins.sys_id and src.sourceinstance=ser.sourceinstance
left join aetna_mdsdb.cmdb_ci_cluster_final cluster on src.sys_id=cluster.sys_id and src.sourceinstance=ser.sourceinstance
left join aetna_mdsdb.cmdb_ci_ip_address_final ip_address on src.sys_id=ip_address.sys_id and src.sourceinstance=ser.sourceinstance
left join aetna_mdsdb.cmdb_ci_msd_final msd on src.sys_id=msd.sys_id and src.sourceinstance=ser.sourceinstance
left join aetna_mdsdb.cmdb_ci_service_final service on src.sys_id=service.sys_id and src.sourceinstance=ser.sourceinstance
left join aetna_mdsdb.cmdb_ci_netgear_final netgear on src.sys_id=netgear.sys_id and src.sourceinstance=ser.sourceinstance
left join aetna_mdwdb.d_configuration_item trgt on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
where COALESCE(ser.u_environment,db_ins.u_environment,cluster.u_environment,
ip_address.u_environment,msd.u_environment,service.u_environment,netgear.u_environment,'UNSPECIFIED') <> trgt.environment_c