SELECT 
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message from 
rogers_mdwdb.d_configuration_item config 
JOIN rogers_mdsdb.cmdb_ci_final ci
on ci.sys_id  = config.row_id and ci.sourceinstance  = config.source_id

LEFT JOIN rogers_mdsdb.cmdb_ci_db_instance_final ins
ON ci.sys_id = ins.sys_id and ci.sourceinstance= ins.sourceinstance 

LEFT JOIN rogers_mdsdb.cmdb_ci_computer_final comp
ON ci.sys_id = comp.sys_id and ci.sourceinstance= comp.sourceinstance
LEFT JOIN rogers_mdsdb.cmdb_ci_win_server_final win
ON ci.sys_id = win.sys_id and ci.sourceinstance= win.sourceinstance 
LEFT JOIN rogers_mdsdb.u_operating_system_field_final win_ops
 on coalesce(win.u_operating_system_latest,win.u_operating_system1) = win_ops.sys_id
 LEFT JOIN rogers_mdsdb.cmdb_ci_osx_server_final osx
 ON ci.sys_id = osx.sys_id and ci.sourceinstance= osx.sourceinstance
LEFT JOIN rogers_mdsdb.u_operating_system_field_final osx_ops
 on coalesce(osx.u_operating_system_latest,osx.u_operating_system1) = osx_ops.sys_id
 LEFT JOIN rogers_mdsdb.cmdb_ci_linux_server_final lnx
 ON ci.sys_id = lnx.sys_id and ci.sourceinstance= lnx.sourceinstance 
 LEFT JOIN rogers_mdsdb.u_operating_system_field_final lnx_ops
ON coalesce(lnx.u_operating_system_latest,lnx.u_opearting_system1) = lnx_ops.sys_id
 LEFT JOIN rogers_mdsdb.cmdb_ci_unix_server_final unx
 ON ci.sys_id = unx.sys_id and ci.sourceinstance= unx.sourceinstance 
 LEFT JOIN rogers_mdsdb.u_operating_system_field_final unx_ops
ON coalesce(unx.u_operating_system_latest,unx.u_operating_system1) = unx_ops.sys_id
 LEFT JOIN rogers_mdsdb.cmdb_ci_esx_server_final esx
 ON ci.sys_id = esx.sys_id and ci.sourceinstance= esx.sourceinstance 
 LEFT JOIN rogers_mdsdb.u_operating_system_field_final esx_ops
 ON coalesce(esx.u_operating_system_latest,esx.u_operating_system1) = esx_ops.sys_id
 LEFT JOIN rogers_mdsdb.cmdb_ci_mainframe_final cim
 ON ci.sys_id = cim.sys_id and ci.sourceinstance= cim.sourceinstance
 LEFT JOIN rogers_mdsdb.u_operating_system_field_final cim_ops 
 ON coalesce(cim.u_operating_system_latest,cim.u_operating_system1) = cim_ops.sys_id
 LEFT JOIN rogers_mdsdb.u_cmdb_ci_server_as400_final cas
 ON ci.sys_id = cas.sys_id and ci.sourceinstance= cas.sourceinstance
LEFT JOIN rogers_mdsdb.u_operating_system_field_final cas_ops  
 ON coalesce(cas.u_operating_system_latest,cas.u_operating_system1) = cas_ops.sys_id

where
operating_system_c <> case when ci.sys_class_name = 'cmdb_ci_win_server' then COALESCE(win_ops.u_operating_system, 'UNSPECIFIED')
                     when ci.sys_class_name = 'cmdb_ci_osx_server' then COALESCE(osx_ops.u_operating_system, 'UNSPECIFIED')
					 when ci.sys_class_name = 'cmdb_ci_linux_server' then COALESCE(lnx_ops.u_operating_system, 'UNSPECIFIED')
					 when ci.sys_class_name = 'cmdb_ci_unix_server' then COALESCE(unx_ops.u_operating_system, 'UNSPECIFIED')
	                 when ci.sys_class_name = 'cmdb_ci_esx_server' then COALESCE(esx_ops.u_operating_system, 'UNSPECIFIED')
					 when ci.sys_class_name = 'cmdb_ci_mainframe' then COALESCE(cim_ops.u_operating_system, 'UNSPECIFIED')
					 when ci.sys_class_name = 'u_cmdb_ci_server_as400' then COALESCE(cas_ops.u_operating_system, 'UNSPECIFIED')					 
                     when ci.sys_class_name in (select distinct sys_class_name from rogers_mdsdb.cmdb_ci_computer_final) then COALESCE(comp.os,'UNSPECIFIED')				 
                     when ci.sys_class_name in (select distinct sys_class_name from rogers_mdsdb.cmdb_ci_db_instance_final) then COALESCE(ins.u_operating_system,'UNSPECIFIED')
                     else 'NOT APPLICABLE' END
and config.cdctype='X';