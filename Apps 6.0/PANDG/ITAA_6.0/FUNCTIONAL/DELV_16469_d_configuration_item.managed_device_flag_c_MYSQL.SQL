SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_configuration_item.managed_device_flag_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.cmdb_ci_final SRC 
LEFT JOIN png_mdsdb.cmdb_ci_hardware_final SRC1 ON SRC.sys_id=SRC1.sys_id AND SRC.sourceinstance=SRC1.sourceinstance AND SRC1.cdctype='X'
LEFT JOIN png_mdsdb.cmdb_ci_storage_device_final SRC2 ON SRC.sys_id=SRC2.sys_id AND SRC.sourceinstance=SRC2.sourceinstance AND SRC2.cdctype='X'
LEFT JOIN png_mdsdb.cmdb_ci_voice_hardware_final SRC3 ON SRC.sys_id=SRC2.sys_id AND SRC.sourceinstance=SRC2.sourceinstance AND SRC3.cdctype='X'
LEFT JOIN png_mdwdb.d_configuration_item TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE 
(
CASE WHEN (TRGT.hardware_applicable_flag_c='N' OR TRGT.source_type_c ='Tenable') THEN 'X'
WHEN SRC.sys_class_name IN ('cmdb_ci_win_server','cmdb_ci_computer','cmdb_ci_laptop_pc','cmdb_ci_desktop_pc','u_cmdb_ci_smartphone','u_cmdb_ci_tablet')
AND UPPER(COALESCE(SRC1.discovery_source,SRC2.discovery_source,SRC3.discovery_source)) NOT IN ('AUCMDB','INTERSTATES','MARIMBA','AIRWATCH')
THEN 'Y' ELSE 'N' END
)<>TRGT.managed_device_flag_c
AND SRC.cdctype='X'
) temp;


 