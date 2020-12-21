SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_configuration_item.lifecycle_status_accuracy_flag_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT 
Count(distinct SRC.sys_id) AS CNT 
FROM png_mdsdb.cmdb_ci_final SRC 
LEFT JOIN png_mdsdb.cmdb_ci_hardware_final SRC1 ON SRC.sys_id=SRC1.sys_id AND SRC.sourceinstance=SRC1.sourceinstance AND SRC1.cdctype='X'
LEFT JOIN png_mdsdb.cmdb_ci_storage_device_final SRC2 ON SRC.sys_id=SRC2.sys_id AND SRC.sourceinstance=SRC2.sourceinstance AND SRC2.cdctype='X'
LEFT JOIN png_mdsdb.cmdb_ci_voice_hardware_final SRC3 ON SRC.sys_id=SRC2.sys_id AND SRC.sourceinstance=SRC2.sourceinstance AND SRC3.cdctype=
'X'
LEFT JOIN png_mdwdb.d_configuration_item TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
LEFT JOIN png_mdwdb.f_configuration_item FAC ON SRC.sys_id=FAC.row_id AND SRC.sourceinstance=FAC.source_id
WHERE 
(
CASE WHEN (SRC.last_discovered  IS NULL  OR TRGT.source_type_c ='Tenable' OR TRGT.hardware_applicable_flag_c='N') THEN 'X'
WHEN 
(SRC1.hardware_status ='Installed' AND SRC1.discovery_source  NOT IN ('Direct') AND FAC.last_seen_duration_c > 5184000
AND TRGT.pg_yn_network_connected_flag_c <> 'No' ) THEN 'N' ELSE 'Y'
END
)<>TRGT.lifecycle_status_accuracy_flag_c
AND SRC.cdctype='X'
) temp;




