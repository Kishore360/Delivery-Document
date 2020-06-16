SELECT 
CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_configuration_item.version_c' ELSE 'SUCCESS' END as Message 
FROM (
select count(1) cnt from 
equifax_mdsdb.cmdb_ci_final SRC 
LEFT JOIN equifax_mdwdb.d_configuration_item TRGT
  ON (SRC.sys_id= TRGT.row_id AND SRC.sourceinstance=TRGT.source_id AND SRC.cdctype<>'D' )

LEFT JOIN equifax_mdsdb.cmdb_ci_appl_final LKP1
  ON (SRC.sys_id= LKP1.sys_id AND SRC.sourceinstance=LKP1.sourceinstance)
  
LEFT JOIN equifax_mdsdb.cmdb_ci_cim_profile_final LKP2
ON (SRC.sys_id= LKP2.sys_id AND SRC.sourceinstance=LKP2.sourceinstance)

LEFT JOIN equifax_mdsdb.cmdb_ci_database_final LKP3
ON (SRC.sys_id= LKP3.sys_id AND SRC.sourceinstance=LKP3.sourceinstance)

LEFT JOIN equifax_mdsdb.cmdb_ci_environment_final LKP4
ON (SRC.sys_id= LKP4.sys_id AND SRC.sourceinstance=LKP4.sourceinstance)

LEFT JOIN equifax_mdsdb.cmdb_ci_spkg_final LKP5
ON (SRC.sys_id= LKP5.sys_id AND SRC.sourceinstance=LKP5.sourceinstance)
LEFT JOIN equifax_mdsdb.cmdb_ci_service_final LKP6
ON (SRC.sys_id= LKP6.sys_id AND SRC.sourceinstance=LKP6.sourceinstance)
LEFT JOIN equifax_mdsdb.cmdb_ci_ucs_equipment_final LKP7
ON (SRC.sys_id= LKP7.sys_id AND SRC.sourceinstance=LKP7.sourceinstance)
where COALESCE(LKP1.version,LKP2.version,LKP3.version,LKP4.version,LKP5.version,LKP6.version,LKP7.version,'UNSPECIFIED')<>TRGT.version_c and SRC.cdctype<>'D' )TEMP