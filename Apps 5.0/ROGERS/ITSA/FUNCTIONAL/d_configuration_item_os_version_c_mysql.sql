SELECT 
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message 
 -- select SRC1.number,COALESCE(LKP.row_key,CASE WHEN SRC.vendors IS NULL THEN 0 else -1 end),(TRGT.vendor_c_key)
from(
select os_version_c , COALESCE(ser.os_version,ins.u_os_version,comp.os_version,'UNSPECIFIED') from 
rogers_mdwdb.d_configuration_item config 
JOIN rogers_mdsdb.cmdb_ci_final ci
on ci.sys_id  = config.row_id and ci.sourceinstance  = config.source_id
LEFT JOIN rogers_mdsdb.cmdb_ci_server_final ser
ON ci.sys_id = ser.sys_id and ci.sourceinstance= ser.sourceinstance 

LEFT JOIN rogers_mdsdb.cmdb_ci_db_instance_final ins
ON ci.sys_id = ins.sys_id and ci.sourceinstance= ins.sourceinstance 

LEFT JOIN rogers_mdsdb.cmdb_ci_computer_final comp
ON ci.sys_id = comp.sys_id and ci.sourceinstance= comp.sourceinstance

where 
os_version_c <> COALESCE(ser.os_version,ins.u_os_version,comp.os_version,'UNSPECIFIED')
and config.CDCTYPE='X' and ci.cdctype='X' and ser.CDCTYPE='X' and ins.CDCTYPE='X' and comp.CDCTYPE='X' )a