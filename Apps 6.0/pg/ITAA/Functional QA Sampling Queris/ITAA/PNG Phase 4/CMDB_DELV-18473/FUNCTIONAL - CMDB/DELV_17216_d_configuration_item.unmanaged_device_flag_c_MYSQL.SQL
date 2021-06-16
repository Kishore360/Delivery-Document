SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_configuration_item.unmanaged_device_flag_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT 
Count(1) as CNT 
FROM png_mdsdb.cmdb_ci_final SRC 
LEFT JOIN  png_mdwdb.d_configuration_item TRGT ON SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
JOIN png_mdwdb.f_configuration_item FACT on FACT.configuration_item_key = TRGT.row_key
JOIN png_mdwdb.d_lov LKP on TRGT.cmdb_ci_hardware_status_c_key = LKP.row_key
JOIN png_mdwdb.d_lov LKP1 on TRGT.cmdb_ci_discovery_source_c_key = LKP1.row_key
WHERE 
CASE WHEN (TRGT.hardware_applicable_flag_c='N' OR TRGT.source_type_c ='Tenable') THEN 'X'
WHEN 
(
(SRC.sys_class_name IN ('cmdb_ci_win_server','cmdb_ci_laptop_pc','cmdb_ci_desktop_pc','u_cmdb_ci_smartphone','u_cmdb_ci_tablet')
AND LKP1.dimension_name not in ('auCMDB','Interstate','MARIMBA','Airwatch')
AND pg_yn_network_connected_flag_c <> 'No'
AND LKP.dimension_name = 'installed'
AND (LKP1.dimension_name IN ('PG','Direct','UNSPECIFIED') OR FACT.assignment_group_key =0)
 ) 
) THEN 'Y' ELSE 'N' END <>TRGT.unmanaged_device_flag_c
AND SRC.cdctype='X'
) temp;


























 
 

 