SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message from (
select count(1) cnt  from
rogers_mdwdb.d_configuration_item config 
JOIN rogers_mdsdb.cmdb_ci_final ci on ci.sys_id  = config.row_id and ci.sourceinstance  = config.source_id
left join rogers_mdsdb.cmdb_ci_server_final cs on ci.sys_id=cs.sys_id and ci.sourceinstance=cs.sourceinstance
left join rogers_mdsdb.cmdb_ci_netgear_final net on ci.sys_id=net.sys_id and ci.sourceinstance=net.sourceinstance
left join rogers_mdsdb.u_cmdb_ci_middleware_final md on ci.sys_id=md.sys_id and ci.sourceinstance=md.sourceinstance
left join rogers_mdsdb.cmdb_ci_db_instance_final db on ci.sys_id=db.sys_id and ci.sourceinstance=db.sourceinstance
left join rogers_mdwdb.d_lov d 
on CONCAT('U_MANAGED_BY','~','CMDB_CI','~','~','~',UPPER(COALESCE(cs.u_managed_by,net.u_managed_by,md.u_managed_by,db.u_managed_by,'UNSPECIFIED')))=d.row_id
where d.soft_deleted_flag='N' and u_managed_by_c_key <> coalesce(d.row_key,case when COALESCE(cs.u_managed_by,net.u_managed_by,md.u_managed_by,db.u_managed_by,'UNSPECIFIED')
 is null then 0 else -1 end)) a;

