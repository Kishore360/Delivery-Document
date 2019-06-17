SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_configuration_item.lifecycle_status_avail_flag_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.cmdb_ci_final SRC 
LEFT JOIN png_mdsdb.cmdb_ci_hardware_final SRC1 ON SRC.sys_id=SRC1.sys_id AND SRC.sourceinstance=SRC1.sourceinstance AND SRC1.cdctype<>'D'
LEFT JOIN png_mdsdb.cmdb_ci_storage_device_final SRC2 ON SRC.sys_id=SRC2.sys_id AND SRC.sourceinstance=SRC2.sourceinstance AND SRC2.cdctype<>'D'
LEFT JOIN png_mdsdb.cmdb_ci_voice_hardware_final SRC3 ON SRC.sys_id=SRC2.sys_id AND SRC.sourceinstance=SRC2.sourceinstance AND SRC3.cdctype<>'D'
LEFT JOIN png_mdwdb.d_configuration_item TRGT ON SRC.sys_id =TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
LEFT JOIN png_mdwdb.d_lov LKP ON 
COALESCE(concat('CMDB_CI~HARDWARE_STATUS','~',UPPER(COALESCE(SRC1.hardware_status,SRC2.u_pg_hardware_status,SRC3.u_pg_hardware_status))),'UNSPECIFIED')
=LKP.row_id 
WHERE 
(CASE WHEN COALESCE(SRC1.hardware_status,SRC2.u_pg_hardware_status,SRC3.u_pg_hardware_status) IS NOT NULL THEN 'Y' ELSE 'N' END)
<>TRGT.lifecycle_status_avail_flag_c
AND SRC.cdctype<>'D'
) temp;


 

  
