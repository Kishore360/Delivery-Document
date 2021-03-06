SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_configuration_item.managed_device_flag_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.cmdb_ci_final SRC 
LEFT JOIN png_mdsdb.cmdb_ci_hardware_final SRC1 ON SRC.sys_id=SRC1.sys_id AND SRC.sourceinstance=SRC1.sourceinstance AND SRC1.cdctype='X'
LEFT JOIN png_mdsdb.cmdb_ci_storage_device_final SRC2 ON SRC.sys_id=SRC2.sys_id AND SRC.sourceinstance=SRC2.sourceinstance AND SRC2.cdctype='X'
LEFT JOIN png_mdsdb.cmdb_ci_voice_hardware_final SRC3 ON SRC.sys_id=SRC3.sys_id AND SRC.sourceinstance=SRC3.sourceinstance AND SRC3.cdctype='X'
LEFT JOIN png_mdwdb.d_configuration_item TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
LEFT JOIn png_mdwdb.d_lov LKP on LKP.row_id =  COALESCE(concat('CMDB_CI~HARDWARE_STATUS','~',UPPER(COALESCE(SRC1.hardware_status,SRC2.u_pg_hardware_status,SRC3.u_pg_hardware_status))))

LEFT JOIn png_mdsdb.sys_db_object_final obj on SRC.sys_class_name = obj.name

WHERE 
(
CASE WHEN (TRGT.hardware_applicable_flag_c='N' OR TRGT.source_type_c ='Tenable') THEN 'X'
WHEN obj.label IN ('Windows Server','Laptop PC', 'Desktop PC','Smartphone','Tablet') and LKP.dimension_name  in ('installed')
and coalesce(SRC1.u_pg_yn_network_connected,'UNSPECIFIED') <>'No'
THEN 'Y' ELSE 'N' END
)<>TRGT.managed_device_flag_c
AND SRC.cdctype='X'

) temp;


 