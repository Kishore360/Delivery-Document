SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for d_configuration_item.os_version_c' ELSE 'SUCCESS' END as Message 
FROM (select count(1) as cnt  from aetna_mdsdb.cmdb_ci_final  src
left JOIN aetna_mdsdb.cmdb_ci_computer_final comp on src.sys_id = comp.sys_id and src.sourceinstance = comp.sourceinstance
left join aetna_mdsdb.cmdb_ci_server_final ser on src.sys_id=ser.sys_id and src.sourceinstance=ser.sourceinstance
left join aetna_mdwdb.d_configuration_item trgt on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
where COALESCE(comp.os_version,ser.os_version,'UNSPECIFIED') <> trgt.os_version_c and src.cdctype<>'D')ma;