SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_configuration_item.active_device_flag_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.cmdb_ci_final SRC 
LEFT JOIN png_mdwdb.d_configuration_item TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
LEFT JOIN png_mdwdb.d_lov LKP ON 
COALESCE(CONCAT('CMDB_CI~INSTALL_STATUS~',UPPER(SRC.install_status)),'UNSPECIFIED')=LKP.row_id AND SRC.sourceinstance=LKP.source_id 
WHERE 
(
CASE 
WHEN TRGT.hardware_applicable_flag_c= 'N' THEN 'X'
WHEN 
(
(
SRC.sys_id IN (SELECT SRC1.sys_id FROM png_mdsdb.cmdb_ci_hardware_final SRC1 WHERE SRC1.cdctype ='X' AND SRC1.hardware_status ='Installed')
OR SRC.sys_id IN (SELECT SRC2.sys_id FROM png_mdsdb.cmdb_ci_storage_device_final SRC2 WHERE SRC2.cdctype ='X' AND SRC2.u_pg_hardware_status ='Installed')
OR SRC.sys_id IN (SELECT SRC3.sys_id FROM png_mdsdb.cmdb_ci_voice_hardware_final SRC3 WHERE SRC3.cdctype ='X' AND SRC3.u_pg_hardware_status ='Installed')
)
AND LKP.dimension_name IN ('Leverage/Optimize','Design/Build')
)
THEN 'Y' ELSE 'N' END )<>TRGT.active_device_flag_c
AND SRC.cdctype ='X'
) temp;





