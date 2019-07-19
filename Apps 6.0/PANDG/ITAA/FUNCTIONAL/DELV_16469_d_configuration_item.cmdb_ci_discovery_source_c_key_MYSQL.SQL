SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_configuration_item.cmdb_ci_discovery_source_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.cmdb_ci_final SRC 
LEFT JOIN png_mdsdb.cmdb_ci_hardware_final SRC1 ON SRC.sys_id=SRC1.sys_id AND SRC.sourceinstance=SRC1.sourceinstance AND SRC1.cdctype<>'D'
LEFT JOIN png_mdsdb.cmdb_ci_storage_device_final SRC2 ON SRC.sys_id=SRC2.sys_id AND SRC.sourceinstance=SRC2.sourceinstance AND SRC2.cdctype<>'D'
LEFT JOIN png_mdsdb.cmdb_ci_voice_hardware_final SRC3 ON SRC.sys_id=SRC2.sys_id AND SRC.sourceinstance=SRC2.sourceinstance AND SRC3.cdctype<>'D'
LEFT JOIN png_mdwdb.d_configuration_item TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
LEFT JOIN png_mdwdb.d_lov LKP 
ON COALESCE(CONCAT('CMDB_CI~','DISCOVERY_SOURCE~',UPPER(COALESCE(SRC1.discovery_source,SRC2.discovery_source,SRC3.discovery_source))),'UNSPECIFIED')=LKP.row_id
WHERE COALESCE(LKP.row_key,CASE WHEN UPPER(COALESCE(SRC1.discovery_source,SRC2.discovery_source,SRC3.discovery_source)) IS NULL THEN 0 ELSE -1 END)<>TRGT.cmdb_ci_discovery_source_c_key
AND SRC.cdctype<>'D'
) temp;


