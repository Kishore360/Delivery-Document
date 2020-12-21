SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_configuration_item.hardware_applicable_flag_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT
FROM png_mdsdb.cmdb_ci_final SRC 
LEFT JOIN png_mdwdb.d_configuration_item TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE 
(CASE WHEN SRC.sys_id IN (SELECT SRC1.sys_id FROM png_mdsdb.cmdb_ci_hardware_final SRC1 WHERE SRC1.cdctype<>'D')
OR SRC.sys_id IN (SELECT SRC2.sys_id FROM png_mdsdb.cmdb_ci_storage_device_final SRC2 WHERE SRC2.cdctype<>'D')
OR SRC.sys_id IN (SELECT SRC3.sys_id FROM png_mdsdb.cmdb_ci_voice_hardware_final SRC3 WHERE SRC3.cdctype<>'D')
THEN 'Y' ELSE 'N' END)<>TRGT.hardware_applicable_flag_c
AND SRC.cdctype<>'D'
)temp;

  
  
  
  
  