SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message 
 -- select SRC1.number,COALESCE(LKP.row_key,CASE WHEN SRC.vendors IS NULL THEN 0 else -1 end),(TRGT.vendor_c_key)
from(
select count(1) cnt from
rogers6_mdwdb.d_configuration_item config 
JOIN rogers6_mdsdb.cmdb_ci_final ci
on ci.sys_id  = config.row_id and ci.sourceinstance  = config.source_id

LEFT JOIN rogers6_mdsdb.cmdb_ci_db_instance_final ins
ON ci.sys_id = ins.sys_id and ci.sourceinstance= ins.sourceinstance 

LEFT JOIN rogers6_mdsdb.u_cmdb_ci_middleware_final middle
ON ci.sys_id = middle.sys_id and ci.sourceinstance= middle.sourceinstance
 
LEFT JOIN rogers6_mdsdb.cmdb_ci_app_server_final app
ON ci.sys_id = app.sys_id and ci.sourceinstance= app.sourceinstance 
LEFT JOIN rogers6_mdsdb.cmdb_ci_win_server_final win
ON ci.sys_id = win.sys_id and ci.sourceinstance= win.sourceinstance 
LEFT JOIN rogers6_mdsdb.u_operating_system_field_final win_ops
 on coalesce(win.u_operating_system_latest,win.u_operating_system1) = win_ops.sys_id
 LEFT JOIN rogers6_mdsdb.cmdb_ci_osx_server_final osx
 ON ci.sys_id = osx.sys_id and ci.sourceinstance= osx.sourceinstance
LEFT JOIN rogers6_mdsdb.u_operating_system_field_final osx_ops
 on coalesce(osx.u_operating_system_latest,osx.u_operating_system1) = osx_ops.sys_id
 LEFT JOIN rogers6_mdsdb.cmdb_ci_linux_server_final lnx
 ON ci.sys_id = lnx.sys_id and ci.sourceinstance= lnx.sourceinstance 
 LEFT JOIN rogers6_mdsdb.u_operating_system_field_final lnx_ops
ON coalesce(lnx.u_operating_system_latest,lnx.u_opearting_system1) = lnx_ops.sys_id
 LEFT JOIN rogers6_mdsdb.cmdb_ci_unix_server_final unx
 ON ci.sys_id = unx.sys_id and ci.sourceinstance= unx.sourceinstance 
 LEFT JOIN rogers6_mdsdb.u_operating_system_field_final unx_ops
ON coalesce(unx.u_operating_system_latest,unx.u_operating_system1) = unx_ops.sys_id
 LEFT JOIN rogers6_mdsdb.cmdb_ci_esx_server_final esx
 ON ci.sys_id = esx.sys_id and ci.sourceinstance= esx.sourceinstance 
 LEFT JOIN rogers6_mdsdb.u_operating_system_field_final esx_ops
 ON coalesce(esx.u_operating_system_latest,esx.u_operating_system1) = esx_ops.sys_id
 LEFT JOIN rogers6_mdsdb.cmdb_ci_mainframe_final cim
 ON ci.sys_id = cim.sys_id and ci.sourceinstance= cim.sourceinstance
 LEFT JOIN rogers6_mdsdb.u_operating_system_field_final cim_ops 
 ON coalesce(cim.u_operating_system_latest,cim.u_operating_system1) = cim_ops.sys_id
 LEFT JOIN rogers6_mdsdb.u_cmdb_ci_server_as400_final cas
 ON ci.sys_id = cas.sys_id and ci.sourceinstance= cas.sourceinstance
LEFT JOIN rogers6_mdsdb.u_operating_system_field_final cas_ops  
 ON coalesce(cas.u_operating_system_latest,cas.u_operating_system1) = cas_ops.sys_id
LEFT JOIN rogers6_mdsdb.core_company_final core_company2 
ON ci.manufacturer = core_company2.sys_id
and ci.sourceinstance = core_company2.sourceinstance

where 
msw_product_reference_c <>  CASE
when ci.sys_class_name = 'cmdb_ci_win_server' then COALESCE(win_ops.u_operating_system, 'UNSPECIFIED') 
when ci.sys_class_name = 'cmdb_ci_osx_server' then COALESCE(CONCAT(COALESCE(osx_ops.u_operating_system,''),' ',SUBSTRING_INDEX(COALESCE(osx.os_version,''),'.',2)), 'UNSPECIFIED')
when ci.sys_class_name = 'cmdb_ci_linux_server' then COALESCE(CONCAT(COALESCE(lnx_ops.u_operating_system,''),' ',SUBSTRING_INDEX(COALESCE(lnx.os_version,''),'.',2)), 'UNSPECIFIED')
when ci.sys_class_name = 'cmdb_ci_unix_server' and unx_ops.u_operating_system not like '%HPUX%'then 
COALESCE(CONCAT(COALESCE(unx_ops.u_operating_system,''),' ',SUBSTRING_INDEX(COALESCE(unx.os_version,''),'.',2)), 'UNSPECIFIED')
when ci.sys_class_name = 'cmdb_ci_unix_server' and unx_ops.u_operating_system like '%HPUX%'then 
COALESCE(CONCAT(COALESCE(unx_ops.u_operating_system,''),' ',SUBSTRING_INDEX(COALESCE(unx.os_version,''),'.',4)), 'UNSPECIFIED')
when ci.sys_class_name = 'cmdb_ci_esx_server' then 
COALESCE(CONCAT(COALESCE(esx_ops.u_operating_system,''),' ',SUBSTRING_INDEX(COALESCE(esx.os_version,''),'.',2)), 'UNSPECIFIED')
when ci.sys_class_name = 'cmdb_ci_mainframe' then 
COALESCE(CONCAT(COALESCE(cim_ops.u_operating_system,''),' ',SUBSTRING_INDEX(COALESCE(cim.os_version,''),'.',2)), 'UNSPECIFIED')
when ci.sys_class_name = 'u_cmdb_ci_server_as400' then 
COALESCE(CONCAT(COALESCE(cas_ops.u_operating_system,''),' ',SUBSTRING_INDEX(COALESCE(cas.os_version,''),'.',2)), 'UNSPECIFIED')
when ci.sys_class_name in (select distinct sys_class_name from rogers6_mdsdb.cmdb_ci_app_server_final) 
then COALESCE(CONCAT(COALESCE(core_company2.name,''),' ',COALESCE(app.subcategory,''),' ',COALESCE(SUBSTRING_INDEX(app.u_model_version_number,'.',2),'')),'UNSPECIFIED')
when ci.sys_class_name = 'cmdb_ci_db_mssql_instance' then 
COALESCE(SUBSTRING_INDEX(ins.u_model_version_number,'.',2), 'UNSPECIFIED')
when ins.sys_class_name <> 'cmdb_ci_db_mssql_instance' then 
COALESCE(CONCAT(COALESCE(core_company2.name,''),' ',COALESCE(SUBSTRING_INDEX(ci.u_model_version_number,'.',2),'')),'UNSPECIFIED')
when ci.sys_class_name in (select distinct sys_class_name from rogers6_mdsdb.u_cmdb_ci_middleware_final) 
then COALESCE(CONCAT(COALESCE(core_company2.name,''),' ',COALESCE(middle.subcategory,''),' ',COALESCE(SUBSTRING_INDEX(middle.u_model_version_number,'.',2),'')),'UNSPECIFIED')			
	else 'NOT APPLICABLE' END and ci.cdctype='X' and app.CDCTYPE='X' and win.CDCTYPE='X' and ins.CDCTYPE='X' and middle.CDCTYPE='X'
and win_ops.cdctype='X' and osx.CDCTYPE='X' and osx_ops.CDCTYPE='X' and lnx.CDCTYPE='X'
and lnx_ops.cdctype='X' and unx.CDCTYPE='X' and unx_ops.CDCTYPE='X' and esx.CDCTYPE='X' 
and esx_ops.cdctype='X' and cim.CDCTYPE='X' and cim_ops.CDCTYPE='X' and cas.CDCTYPE='X' and cas_ops.CDCTYPE='X' and core_company2.CDCTYPE='X' )a