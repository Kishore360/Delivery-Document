SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message 
 -- select SRC1.number,COALESCE(LKP.row_key,CASE WHEN SRC.vendors IS NULL THEN 0 else -1 end),(TRGT.vendor_c_key)
from(
select count(1) cnt from
rogers6_mdwdb.d_configuration_item config 
JOIN rogers6_mdsdb.cmdb_ci_final ci
on ci.sys_id  = config.row_id and ci.sourceinstance  = config.source_id
LEFT JOIN rogers6_mdsdb.cmdb_ci_service_final service
ON ci.sys_id = service.sys_id and ci.sourceinstance= service.sourceinstance
LEFT JOIN rogers6_mdsdb.cmdb_ci_appl_final appl
ON ci.sys_id = appl.sys_id and ci.sourceinstance= appl.sourceinstance
where ID_C  <>  COALESCE(service.u_service_id, appl.name, ci.u_ci_id,'UNSPECIFIED') and ci.cdctype='X'  and service.CDCTYPE='X' and appl.cdctype='X' )a