
SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message 
 -- select SRC1.number,COALESCE(LKP.row_key,CASE WHEN SRC.vendors IS NULL THEN 0 else -1 end),(TRGT.vendor_c_key)
from(
select count(1) cnt from 
rogers_mdwdb.d_configuration_item config 
JOIN rogers_mdsdb.cmdb_ci_final ci
on ci.sys_id  = config.row_id and ci.sourceinstance  = config.source_id
LEFT JOIN rogers_mdsdb.cmdb_ci_server_final ser
ON ci.sys_id = ser.sys_id and ci.sourceinstance= ser.sourceinstance 
LEFT JOIN rogers_mdsdb.cmdb_ci_appl_final appl
ON ci.sys_id = appl.sys_id and ci.sourceinstance= appl.sourceinstance
LEFT JOIN rogers_mdsdb.u_cmdb_ci_middleware_final middle
ON ci.sys_id = middle.sys_id and ci.sourceinstance= middle.sourceinstance
where component_criticality_c <> COALESCE(ser.classification,middle.u_component_criticality,appl.u_component_criticality,'UNSPECIFIED') and ci.cdctype='X' and ser.CDCTYPE='X' and appl.CDCTYPE='X' and middle.CDCTYPE='X'
)a