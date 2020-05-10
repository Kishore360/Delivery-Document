
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_configuration_item.registered_device_flag_c' ELSE 'SUCCESS' END as Message
FROM 
(

SELECT  Count(1) as CNT 


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
CASE WHEN TRGT.hardware_applicable_flag_c= 'N' THEN 'X'
WHEN
( 
(
COALESCE(aa.hardware_status,'UNSPECIFIED') not like 'Decommissioned%'
)
AND COALESCE(LKP.dimension_name,'UNSPECIFIED') NOT IN ('Not Used / Reference','Duplicate / Invalid') ) THEN 'Y' ELSE 'N' END)<>TRGT.registered_device_flag_c
AND SRC.cdctype<>'D'
) temp;