SELECT 
TRGT.row_id,
hardware_status ,TRGT.active_device_flag_c


FROM png_mdsdb.cmdb_ci_final SRC 
LEFT JOIN png_mdwdb.d_configuration_item TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
LEFT JOIN png_mdwdb.d_lov LKP ON 
COALESCE(CONCAT('CMDB_CI~INSTALL_STATUS~',UPPER(SRC.install_status)),'UNSPECIFIED')=LKP.row_id AND SRC.sourceinstance=LKP.source_id 
JOIN 
(
SELECT sys_id,sourceinstance,group_concat(hardware_status) as hardware_status from 
(SELECT sys_id,sourceinstance,hardware_status from png_mdsdb.cmdb_ci_hardware_final
UNION
SELECT sys_id,sourceinstance,u_pg_hardware_status from png_mdsdb.cmdb_ci_storage_device_final
UNION
SELECT sys_id,sourceinstance,u_pg_hardware_status from png_mdsdb.cmdb_ci_voice_hardware_final
) aa
group by 1,2
)aa
ON SRC.sys_id = aa.sys_id and SRC.sourceinstance  = aa.sourceinstance

WHERE 
(
CASE 
WHEN TRGT.hardware_applicable_flag_c= 'N' THEN 'X'
WHEN 
aa.hardware_status = 'Installed'
AND LKP.dimension_name IN ('Leverage/Optimize','Design/Build')

THEN 'Y' ELSE 'N' END ) <> TRGT.active_device_flag_c
AND SRC.cdctype ='X'

