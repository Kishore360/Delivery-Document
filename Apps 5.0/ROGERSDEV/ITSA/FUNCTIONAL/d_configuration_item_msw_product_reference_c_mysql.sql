SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from
rogersdev_mdwdb.d_configuration_item TRGT
join
rogersdev_mdsdb.cmdb_ci_final ci
on ci.sys_id =TRGT.row_id and ci.sourceinstance=TRGT.source_id
LEFT JOIN
rogersdev_mdsdb.cmdb_ci_win_server_final win
ON ci.sys_id = win.sys_id and ci.sourceinstance= win.sourceinstance 
LEFT JOIN
rogersdev_mdsdb.cmdb_ci_osx_server_final osx
ON ci.sys_id = osx.sys_id and ci.sourceinstance= osx.sourceinstance
LEFT JOIN 
rogersdev_mdsdb.cmdb_ci_linux_server_final lnx
ON ci.sys_id = lnx.sys_id and ci.sourceinstance= lnx.sourceinstance
LEFT JOIN 
rogersdev_mdsdb.cmdb_ci_unix_server_final unx
ON ci.sys_id = unx.sys_id and ci.sourceinstance= unx.sourceinstance
LEFT JOIN 
rogersdev_mdsdb.cmdb_ci_esx_server_final esx
ON ci.sys_id = esx.sys_id and ci.sourceinstance= esx.sourceinstance
LEFT JOIN 
rogersdev_mdsdb.cmdb_ci_mainframe_final cim
ON ci.sys_id = cim.sys_id and ci.sourceinstance= cim.sourceinstance 
LEFT JOIN 
rogersdev_mdsdb.u_cmdb_ci_server_as400_final cas
ON ci.sys_id = cas.sys_id and ci.sourceinstance= cas.sourceinstance
LEFT JOIN 
rogersdev_mdsdb.cmdb_ci_app_server_final app
ON ci.sys_id = app.sys_id and ci.sourceinstance= app.sourceinstance 
LEFT JOIN 
rogersdev_mdsdb.cmdb_ci_db_instance_final ins
ON ci.sys_id = ins.sys_id and ci.sourceinstance= ins.sourceinstance 
LEFT JOIN 
rogersdev_mdsdb.core_company_final core_company2 
ON ci.manufacturer = core_company2.sys_id
and ci.sourceinstance = core_company2.sourceinstance
where case when (ci.sys_class_name ='cmdb_ci_win_server') then COALESCE(win.u_operating_system1,'UNSPECIFIED')
when (ci.sys_class_name ='cmdb_ci_osx_server' ) then COALESCE(concat(COALESCE(osx.u_operating_system1,''),' ',substring_index(osx.os_version,'.',2)),'UNSPECIFIED')
when (ci.sys_class_name='cmdb_ci_linux_server') then COALESCE(concat(COALESCE(lnx.u_opearting_system1,''),' ',substring_index(lnx.os_version,'.',2)),'UNSPECIFIED')
when (ci.sys_class_name='cmdb_ci_unix_server') then COALESCE(concat(COALESCE(unx.u_operating_system1,''),' ',substring_index(unx.os_version,'.',2)),'UNSPECIFIED')
when (ci.sys_class_name='cmdb_ci_esx_server') then COALESCE(concat(COALESCE(esx.u_operating_system1,''),' ',substring_index(esx.os_version,'.',2)),'UNSPECIFIED')
when (ci.sys_class_name='cmdb_ci_mainframe') then COALESCE(concat(COALESCE(cim.u_operating_system1,''),' ',substring_index(cim.os_version,'.',2)),'UNSPECIFIED')
when (ci.sys_class_name='u_cmdb_ci_server_as400') then COALESCE(concat(COALESCE(cas.u_operating_system1,''),' ',substring_index(cas.os_version,'.',2)),'UNSPECIFIED')
when (ci.sys_class_name in (select distinct  sys_class_name from rogersdev_mdsdb.cmdb_ci_app_server_final)) then COALESCE(concat(COALESCE(core_company2.name,''),' ',COALESCE(app.subcategory,''),' ',COALESCE(substring_index(app.u_model_version_number,'.',2),'')),'UNSPECIFIED')
when (ins.sys_class_name='cmdb_ci_db_mssql_instance') then COALESCE(substring_index(ins.u_model_version_number,'.',2),'UNSPECIFIED')
when (ins.sys_class_name <> 'cmdb_ci_db_mssql_instance') then COALESCE(concat(COALESCE(core_company2.name,''),' ',COALESCE(substring_index(ins.u_model_version_number,'.',2),'')),'UNSPECIFIED')
 else 'NOT Applicable' end <>  TRGT.msw_product_reference_c)a
