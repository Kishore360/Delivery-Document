SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)
THEN 'MDS to DWH data validation failed for d_configuration_item.u_pg_bios_uuid_c' ELSE 'SUCCESS' END as Message
FROM png_mdsdb.cmdb_ci_final SRC
JOIN pgcmdb_mdwdb.d_configuration_item TRGT
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id AND SRC.CDCTYPE<>'D'
WHERE COALESCE(SRC.u_pg_bios_uuid,'UNSPECIFIED')<>TRGT.u_pg_bios_uuid_c ;


SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)
THEN 'MDS to DWH data validation failed for d_configuration_item.u_pg_source_system_id_c' ELSE 'SUCCESS' END as Message
FROM png_mdsdb.cmdb_ci_final SRC
JOIN pgcmdb_mdwdb.d_configuration_item TRGT
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id AND SRC.CDCTYPE<>'D'
WHERE COALESCE(SRC.u_pg_source_system_id,'UNSPECIFIED')<>TRGT.u_pg_source_system_id_c ;


SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)
THEN 'MDS to DWH data validation failed for d_configuration_item.first_discovered_c' ELSE 'SUCCESS' END as Message
FROM png_mdsdb.cmdb_ci_final SRC
JOIN pgcmdb_mdwdb.d_configuration_item TRGT
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id AND SRC.CDCTYPE<>'D'
WHERE CONVERT_TZ(SRC.first_discovered,'GMT','America/New_York')<>TRGT.first_discovered_c ;


SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)
THEN 'MDS to DWH data validation failed for d_configuration_item.u_pg_storage_allocated_c' ELSE 'SUCCESS' END as Message
FROM png_mdsdb.cmdb_ci_final SRC
JOIN pgcmdb_mdwdb.d_configuration_item TRGT
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id AND SRC.CDCTYPE<>'D'
WHERE SRC.u_pg_storage_allocated <> TRGT.u_pg_storage_allocated_c ;


SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)
THEN 'MDS to DWH data validation failed for d_configuration_item.checked_out_c' ELSE 'SUCCESS' END as Message
FROM png_mdsdb.cmdb_ci_final SRC
JOIN pgcmdb_mdwdb.d_configuration_item TRGT
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id AND SRC.CDCTYPE<>'D'
WHERE CONVERT_TZ(SRC.checked_out,'GMT','America/New_York')<>TRGT.checked_out_c ;


SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)
THEN 'MDS to DWH data validation failed for d_configuration_item.checked_in_c' ELSE 'SUCCESS' END as Message
FROM png_mdsdb.cmdb_ci_final SRC
JOIN pgcmdb_mdwdb.d_configuration_item TRGT
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id AND SRC.CDCTYPE<>'D'
WHERE CONVERT_TZ(SRC.checked_in,'GMT','America/New_York')<>TRGT.checked_in_c ;


SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)
THEN 'MDS to DWH data validation failed for d_configuration_item.monitor_c_flag' ELSE 'SUCCESS' END as Message
FROM png_mdsdb.cmdb_ci_final SRC
JOIN pgcmdb_mdwdb.d_configuration_item TRGT
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id AND SRC.CDCTYPE<>'D'
WHERE CASE WHEN SRC.monitor=1 THEN 'Y' ELSE 'N' END <>TRGT.monitor_c_flag ;


SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)
THEN 'MDS to DWH data validation failed for d_configuration_item.u_pg_esa_c_flag' ELSE 'SUCCESS' END as Message
FROM png_mdsdb.cmdb_ci_final SRC
JOIN pgcmdb_mdwdb.d_configuration_item TRGT
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id AND SRC.CDCTYPE<>'D'
WHERE CASE WHEN SRC.u_pg_esa=1 THEN 'Y' ELSE 'N' END <>TRGT.u_pg_esa_c_flag ;


SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)
THEN 'MDS to DWH data validation failed for d_configuration_item.warranty_expiration_c' ELSE 'SUCCESS' END as Message
FROM png_mdsdb.cmdb_ci_final SRC
JOIN pgcmdb_mdwdb.d_configuration_item TRGT
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id AND SRC.CDCTYPE<>'D'
WHERE CONVERT_TZ(SRC.warranty_expiration,'GMT','America/New_York')<>TRGT.warranty_expiration_c ;


SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)
THEN 'MDS to DWH data validation failed for d_configuration_item.u_pg_dr_storage_req_c' ELSE 'SUCCESS' END as Message
FROM png_mdsdb.cmdb_ci_final SRC
JOIN pgcmdb_mdwdb.d_configuration_item TRGT
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id AND SRC.CDCTYPE<>'D'
WHERE SRC.u_pg_dr_storage_req <> TRGT.u_pg_dr_storage_req_c ;


SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)
THEN 'MDS to DWH data validation failed for d_configuration_item.u_pg_sox_critical_c_flag' ELSE 'SUCCESS' END as Message
FROM png_mdsdb.cmdb_ci_final SRC
JOIN pgcmdb_mdwdb.d_configuration_item TRGT
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id AND SRC.CDCTYPE<>'D'
WHERE CASE WHEN SRC.u_pg_sox_critical=1 THEN 'Y' ELSE 'N' END <>TRGT.u_pg_sox_critical_c_flag ;


SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)
THEN 'MDS to DWH data validation failed for d_configuration_item.free_space_c' ELSE 'SUCCESS' END as Message
FROM png_mdsdb.cmdb_ci_final SRC
JOIN pgcmdb_mdwdb.d_configuration_item TRGT
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id AND SRC.CDCTYPE<>'D'
WHERE (SRC.u_pg_storage_allocated-SRC.u_pg_storage_used) <> TRGT.free_space_c ;


SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)
THEN 'MDS to DWH data validation failed for d_configuration_item.u_pg_cloud_subscription_c' ELSE 'SUCCESS' END as Message
FROM png_mdsdb.cmdb_ci_final SRC
LEFT JOIN png_mdsdb.cmdb_ci_server_final SRC1 ON SRC.sys_id=SRC1.sys_id AND SRC.sourceinstance=SRC1.sourceinstance
JOIN pgcmdb_mdwdb.d_configuration_item TRGT
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id AND SRC.CDCTYPE<>'D'
WHERE COALESCE(SRC1.u_pg_cloud_subscription,'UNSPECIFIED')<>TRGT.u_pg_cloud_subscription_c ;


SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)
THEN 'MDS to DWH data validation failed for d_configuration_item.u_pg_cloud_resource_group_c' ELSE 'SUCCESS' END as Message
FROM png_mdsdb.cmdb_ci_final SRC
LEFT JOIN png_mdsdb.cmdb_ci_server_final SRC1 ON SRC.sys_id=SRC1.sys_id AND SRC.sourceinstance=SRC1.sourceinstance
JOIN pgcmdb_mdwdb.d_configuration_item TRGT
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id AND SRC.CDCTYPE<>'D'
WHERE COALESCE(SRC1.u_pg_cloud_resource_group,'UNSPECIFIED')<>TRGT.u_pg_cloud_resource_group_c ;


SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)
THEN 'MDS to DWH data validation failed for d_configuration_item.ci_pg_environment_c_key' ELSE 'SUCCESS' END as Message
FROM png_mdsdb.cmdb_ci_final SRC
JOIN pgcmdb_mdwdb.d_configuration_item TRGT
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id AND SRC.CDCTYPE<>'D'
LEFT JOIN pgcmdb_mdwdb.d_lov LKP ON LKP.dimension_class='PG_ENVIRONMENT_C~CMDB_CI' AND SRC.u_pg_environment=LKP.dimension_code
WHERE COALESCE(LKP.row_key,(CASE WHEN SRC.u_pg_environment IS NULL THEN 0 ELSE -1 END))<>TRGT.ci_pg_environment_c_key ;


SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)
THEN 'MDS to DWH data validation failed for d_configuration_item.ci_pg_fda_status_c_key' ELSE 'SUCCESS' END as Message
FROM png_mdsdb.cmdb_ci_final SRC
JOIN pgcmdb_mdwdb.d_configuration_item TRGT
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id AND SRC.CDCTYPE<>'D'
LEFT JOIN pgcmdb_mdwdb.d_lov LKP ON LKP.dimension_class='PG_FDA_STATUS_C~CMDB_CI' AND SRC.u_pg_fda_status=LKP.dimension_code
WHERE COALESCE(LKP.row_key,(CASE WHEN SRC.u_pg_fda_status IS NULL THEN 0 ELSE -1 END))<>TRGT.ci_pg_fda_status_c_key ;


SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)
THEN 'MDS to DWH data validation failed for d_configuration_item.ci_operational_status_c_key' ELSE 'SUCCESS' END as Message
FROM png_mdsdb.cmdb_ci_final SRC
JOIN pgcmdb_mdwdb.d_configuration_item TRGT
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id AND SRC.CDCTYPE<>'D'
LEFT JOIN pgcmdb_mdwdb.d_lov LKP ON LKP.dimension_class='OPERATIONAL_STATUS_C~CMDB_CI' AND SRC.operational_status=LKP.dimension_code
WHERE COALESCE(LKP.row_key,(CASE WHEN SRC.operational_status IS NULL THEN 0 ELSE -1 END))<>TRGT.ci_operational_status_c_key ;


SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)
THEN 'MDS to DWH data validation failed for d_configuration_item.ci_pg_evp_solution_provider_c_key' ELSE 'SUCCESS' END as Message
FROM png_mdsdb.cmdb_ci_final SRC
JOIN pgcmdb_mdwdb.d_configuration_item TRGT
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id AND SRC.CDCTYPE<>'D'
LEFT JOIN pgcmdb_mdwdb.d_lov LKP ON LKP.dimension_class='PG_EVP_SOLUTION_PROVIDER_C~CMDB_CI' AND SRC.u_pg_evp_solution_provider=LKP.dimension_code
WHERE COALESCE(LKP.row_key,(CASE WHEN SRC.u_pg_evp_solution_provider IS NULL THEN 0 ELSE -1 END))<>TRGT.ci_pg_evp_solution_provider_c_key ;


SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)
THEN 'MDS to DWH data validation failed for d_configuration_item.ci_pg_evp_service_c_key' ELSE 'SUCCESS' END as Message
FROM png_mdsdb.cmdb_ci_final SRC
JOIN pgcmdb_mdwdb.d_configuration_item TRGT
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id AND SRC.CDCTYPE<>'D'
LEFT JOIN pgcmdb_mdwdb.d_lov LKP ON LKP.dimension_class='PG_EVP_SERVICE_C~CMDB_CI' AND SRC.u_pg_evp_service=LKP.dimension_code
WHERE COALESCE(LKP.row_key,(CASE WHEN SRC.u_pg_evp_service IS NULL THEN 0 ELSE -1 END))<>TRGT.ci_pg_evp_service_c_key ;


SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)
THEN 'MDS to DWH data validation failed for d_configuration_item.ci_pg_data_classification_c_key' ELSE 'SUCCESS' END as Message
FROM png_mdsdb.cmdb_ci_final SRC
JOIN pgcmdb_mdwdb.d_configuration_item TRGT
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id AND SRC.CDCTYPE<>'D'
LEFT JOIN pgcmdb_mdwdb.d_lov LKP ON LKP.dimension_class='PG_DATA_CLASSIFICATION_C~CMDB_CI' AND SRC.u_pg_data_classificaion=LKP.dimension_code
WHERE COALESCE(LKP.row_key,(CASE WHEN SRC.u_pg_data_classificaion IS NULL THEN 0 ELSE -1 END))<>TRGT.ci_pg_data_classification_c_key ;


SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)
THEN 'MDS to DWH data validation failed for d_configuration_item.hardware_pg_network_connected_c_key' ELSE 'SUCCESS' END as Message
FROM png_mdsdb.cmdb_ci_final SRC
LEFT JOIN png_mdsdb.cmdb_ci_hardware_final SRC1 ON SRC.sys_id=SRC1.sys_id AND SRC.sourceinstance=SRC1.sourceinstance
JOIN pgcmdb_mdwdb.d_configuration_item TRGT
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id AND SRC.CDCTYPE<>'D'
LEFT JOIN pgcmdb_mdwdb.d_lov LKP ON LKP.dimension_class='PG_NETWORK_CONNECTED_C~CMDB_CI_HARDWARE' AND SRC1.u_pg_yn_network_connected=LKP.dimension_code
WHERE COALESCE(LKP.row_key,(CASE WHEN SRC1.u_pg_yn_network_connected IS NULL THEN 0 ELSE -1 END))<>TRGT.hardware_pg_network_connected_c_key ;


SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)
THEN 'MDS to DWH data validation failed for f_configuration_item.assigned_to_key' ELSE 'SUCCESS' END as Message
FROM png_mdsdb.cmdb_ci_final SRC
JOIN pgcmdb_mdwdb.f_configuration_item TRGT
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id AND SRC.CDCTYPE<>'D'
LEFT JOIN (SELECT RIGHT(row_id,32) as row_id,source_id,row_key from pgcmdb_mdwdb.d_internal_contact) LKP ON SRC.assigned_to=LKP.row_id AND SRC.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,(CASE WHEN SRC.assigned_to IS NULL THEN 0 ELSE -1 END))<>TRGT.assigned_to_key ;


SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)
THEN 'MDS to DWH data validation failed for f_configuration_item.support_group_c_key' ELSE 'SUCCESS' END as Message
FROM png_mdsdb.cmdb_ci_final SRC
JOIN pgcmdb_mdwdb.f_configuration_item TRGT
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id AND SRC.CDCTYPE<>'D'
LEFT JOIN (SELECT RIGHT(row_id,32) as row_id,source_id,row_key from pgcmdb_mdwdb.d_internal_organization) LKP ON SRC.support_group=LKP.row_id AND SRC.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,(CASE WHEN SRC.support_group IS NULL THEN 0 ELSE -1 END))<>TRGT.support_group_c_key ;


SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)
THEN 'MDS to DWH data validation failed for f_configuration_item.ci_asset_c_key' ELSE 'SUCCESS' END as Message
FROM png_mdsdb.cmdb_ci_final SRC
JOIN pgcmdb_mdwdb.f_configuration_item TRGT
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id AND SRC.CDCTYPE<>'D'
LEFT JOIN (SELECT RIGHT(row_id,32) as row_id,source_id,row_key from pgcmdb_mdwdb.d_asset) LKP ON SRC.asset=LKP.row_id AND SRC.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,(CASE WHEN SRC.asset IS NULL THEN 0 ELSE -1 END))<>TRGT.ci_asset_c_key ;


SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)
THEN 'MDS to DWH data validation failed for f_configuration_item.ci_cost_center_c_key' ELSE 'SUCCESS' END as Message
FROM png_mdsdb.cmdb_ci_final SRC
JOIN pgcmdb_mdwdb.f_configuration_item TRGT
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id AND SRC.CDCTYPE<>'D'
LEFT JOIN pgcmdb_mdwdb.d_cost_center LKP ON SRC.cost_center=LKP.row_id AND SRC.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,(CASE WHEN SRC.cost_center IS NULL THEN 0 ELSE -1 END))<>TRGT.ci_cost_center_c_key ;



SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)
THEN 'MDS to DWH data validation failed for d_configuration_item_ext_c.os_version_c' ELSE 'SUCCESS' END as Message
FROM png_mdsdb.cmdb_ci_final SRC
LEFT JOIN png_mdsdb.cmdb_ci_computer_final SRC1 ON SRC.sys_id=SRC1.sys_id AND SRC.sourceinstance=SRC1.sourceinstance
JOIN pgcmdb_mdwdb.d_configuration_item_ext_c TRGT
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id AND SRC.CDCTYPE<>'D'
WHERE COALESCE(SRC1.os_version,'UNSPECIFIED')<>TRGT.os_version_c ;


SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)
THEN 'MDS to DWH data validation failed for d_configuration_item_ext_c.ram_c' ELSE 'SUCCESS' END as Message
FROM png_mdsdb.cmdb_ci_final SRC
LEFT JOIN png_mdsdb.cmdb_ci_computer_final SRC1 ON SRC.sys_id=SRC1.sys_id AND SRC.sourceinstance=SRC1.sourceinstance
JOIN pgcmdb_mdwdb.d_configuration_item_ext_c TRGT
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id AND SRC.CDCTYPE<>'D'
WHERE SRC1.ram<>TRGT.ram_c ;


SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)
THEN 'MDS to DWH data validation failed for d_configuration_item_ext_c.virtual_c_flag' ELSE 'SUCCESS' END as Message
FROM png_mdsdb.cmdb_ci_final SRC
LEFT JOIN png_mdsdb.cmdb_ci_computer_final SRC1 ON SRC.sys_id=SRC1.sys_id AND SRC.sourceinstance=SRC1.sourceinstance
JOIN pgcmdb_mdwdb.d_configuration_item_ext_c TRGT
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id AND SRC.CDCTYPE<>'D'
WHERE CASE WHEN SRC1.virtual=1 THEN 'Y' ELSE 'N' END <>TRGT.virtual_c_flag ;


SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)
THEN 'MDS to DWH data validation failed for d_configuration_item_ext_c.cpu_name_c' ELSE 'SUCCESS' END as Message
FROM png_mdsdb.cmdb_ci_final SRC
LEFT JOIN png_mdsdb.cmdb_ci_computer_final SRC1 ON SRC.sys_id=SRC1.sys_id AND SRC.sourceinstance=SRC1.sourceinstance
JOIN pgcmdb_mdwdb.d_configuration_item_ext_c TRGT
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id AND SRC.CDCTYPE<>'D'
WHERE COALESCE(SRC1.cpu_name,'UNSPECIFIED')<>TRGT.cpu_name_c ;


SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)
THEN 'MDS to DWH data validation failed for d_configuration_item_ext_c.short_description_c' ELSE 'SUCCESS' END as Message
FROM png_mdsdb.cmdb_ci_final SRC
LEFT JOIN png_mdsdb.cmdb_ci_computer_final SRC1 ON SRC.sys_id=SRC1.sys_id AND SRC.sourceinstance=SRC1.sourceinstance
JOIN pgcmdb_mdwdb.d_configuration_item_ext_c TRGT
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id AND SRC.CDCTYPE<>'D'
WHERE COALESCE(SRC.short_description,'UNSPECIFIED')<>TRGT.short_description_c ;


SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)
THEN 'MDS to DWH data validation failed for d_configuration_item_ext_c.u_pg_os_minor_version_c' ELSE 'SUCCESS' END as Message
FROM png_mdsdb.cmdb_ci_final SRC
LEFT JOIN png_mdsdb.cmdb_ci_computer_final SRC1 ON SRC.sys_id=SRC1.sys_id AND SRC.sourceinstance=SRC1.sourceinstance
JOIN pgcmdb_mdwdb.d_configuration_item_ext_c TRGT
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id AND SRC.CDCTYPE<>'D'
WHERE COALESCE(SRC1.u_pg_os_minor_version,'UNSPECIFIED')<>TRGT.u_pg_os_minor_version_c ;


SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)
THEN 'MDS to DWH data validation failed for d_configuration_item_ext_c.cpu_type_c' ELSE 'SUCCESS' END as Message
FROM png_mdsdb.cmdb_ci_final SRC
LEFT JOIN png_mdsdb.cmdb_ci_computer_final SRC1 ON SRC.sys_id=SRC1.sys_id AND SRC.sourceinstance=SRC1.sourceinstance
JOIN pgcmdb_mdwdb.d_configuration_item_ext_c TRGT
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id AND SRC.CDCTYPE<>'D'
WHERE COALESCE(SRC1.cpu_type,'UNSPECIFIED')<>TRGT.cpu_type_c ;


SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)
THEN 'MDS to DWH data validation failed for d_configuration_item_ext_c.cpu_speed_c' ELSE 'SUCCESS' END as Message
FROM png_mdsdb.cmdb_ci_final SRC
LEFT JOIN png_mdsdb.cmdb_ci_computer_final SRC1 ON SRC.sys_id=SRC1.sys_id AND SRC.sourceinstance=SRC1.sourceinstance
JOIN pgcmdb_mdwdb.d_configuration_item_ext_c TRGT
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id AND SRC.CDCTYPE<>'D'
WHERE SRC1.cpu_speed<>TRGT.cpu_speed_c ;


SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)
THEN 'MDS to DWH data validation failed for d_configuration_item_ext_c.cpu_count_c' ELSE 'SUCCESS' END as Message
FROM png_mdsdb.cmdb_ci_final SRC
LEFT JOIN png_mdsdb.cmdb_ci_computer_final SRC1 ON SRC.sys_id=SRC1.sys_id AND SRC.sourceinstance=SRC1.sourceinstance
JOIN pgcmdb_mdwdb.d_configuration_item_ext_c TRGT
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id AND SRC.CDCTYPE<>'D'
WHERE SRC1.cpu_count<>TRGT.cpu_count_c ;


SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)
THEN 'MDS to DWH data validation failed for d_configuration_item_ext_c.cpu_core_thread_c' ELSE 'SUCCESS' END as Message
FROM png_mdsdb.cmdb_ci_final SRC
LEFT JOIN png_mdsdb.cmdb_ci_computer_final SRC1 ON SRC.sys_id=SRC1.sys_id AND SRC.sourceinstance=SRC1.sourceinstance
JOIN pgcmdb_mdwdb.d_configuration_item_ext_c TRGT
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id AND SRC.CDCTYPE<>'D'
WHERE SRC1.cpu_core_thread<>TRGT.cpu_core_thread_c ;


SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)
THEN 'MDS to DWH data validation failed for d_configuration_item_ext_c.cpu_core_count_c' ELSE 'SUCCESS' END as Message
FROM png_mdsdb.cmdb_ci_final SRC
LEFT JOIN png_mdsdb.cmdb_ci_computer_final SRC1 ON SRC.sys_id=SRC1.sys_id AND SRC.sourceinstance=SRC1.sourceinstance
JOIN pgcmdb_mdwdb.d_configuration_item_ext_c TRGT
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id AND SRC.CDCTYPE<>'D'
WHERE SRC1.cpu_core_count<>TRGT.cpu_core_count_c ;


SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)
THEN 'MDS to DWH data validation failed for d_configuration_item_ext_c.u_pg_sap_fixed_asset_number_c' ELSE 'SUCCESS' END as Message
FROM png_mdsdb.cmdb_ci_final SRC
LEFT JOIN png_mdsdb.cmdb_ci_computer_final SRC1 ON SRC.sys_id=SRC1.sys_id AND SRC.sourceinstance=SRC1.sourceinstance
JOIN pgcmdb_mdwdb.d_configuration_item_ext_c TRGT
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id AND SRC.CDCTYPE<>'D'
WHERE COALESCE(SRC1.u_pg_sap_fixed_asset_number,'UNSPECIFIED')<>TRGT.u_pg_sap_fixed_asset_number_c ;


SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)
THEN 'MDS to DWH data validation failed for d_configuration_item_ext_c.u_pg_data_classification_reason_c' ELSE 'SUCCESS' END as Message
FROM png_mdsdb.cmdb_ci_final SRC
LEFT JOIN png_mdsdb.cmdb_ci_computer_final SRC1 ON SRC.sys_id=SRC1.sys_id AND SRC.sourceinstance=SRC1.sourceinstance
JOIN pgcmdb_mdwdb.d_configuration_item_ext_c TRGT
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id AND SRC.CDCTYPE<>'D'
WHERE COALESCE(SRC1.u_pg_data_classification_reason,'UNSPECIFIED')<>TRGT.u_pg_data_classification_reason_c ;


SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)
THEN 'MDS to DWH data validation failed for d_configuration_item_ext_c.os_c_key' ELSE 'SUCCESS' END as Message
FROM png_mdsdb.cmdb_ci_final SRC
LEFT JOIN png_mdsdb.cmdb_ci_computer_final SRC1 ON SRC.sys_id=SRC1.sys_id AND SRC.sourceinstance=SRC1.sourceinstance
JOIN pgcmdb_mdwdb.d_configuration_item_ext_c TRGT
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id AND SRC.CDCTYPE<>'D'
LEFT JOIN pgcmdb_mdwdb.d_lov LKP ON LKP.dimension_class='OS_C~CMDB_CI_COMPUTER' AND SRC1.os=LKP.dimension_code
WHERE COALESCE(LKP.row_key,(CASE WHEN SRC1.os IS NULL THEN 0 ELSE -1 END))<>TRGT.os_c_key ;


SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)
THEN 'MDS to DWH data validation failed for d_configuration_item_ext_c.os_vendor_c_key' ELSE 'SUCCESS' END as Message
FROM png_mdsdb.cmdb_ci_final SRC
LEFT JOIN png_mdsdb.cmdb_ci_computer_final SRC1 ON SRC.sys_id=SRC1.sys_id AND SRC.sourceinstance=SRC1.sourceinstance
JOIN pgcmdb_mdwdb.d_configuration_item_ext_c TRGT
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id AND SRC.CDCTYPE<>'D'
LEFT JOIN (SELECT RIGHT(row_id,32) as row_id,source_id,row_key from pgcmdb_mdwdb.d_internal_organization) LKP ON SRC1.u_pg_os_vendor=LKP.row_id AND SRC1.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,(CASE WHEN SRC1.u_pg_os_vendor IS NULL THEN 0 ELSE -1 END))<>TRGT.os_vendor_c_key ;


SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)
THEN 'MDS to DWH data validation failed for d_configuration_item_ext_c.cpu_manufacturer_c_key' ELSE 'SUCCESS' END as Message
FROM png_mdsdb.cmdb_ci_final SRC
LEFT JOIN png_mdsdb.cmdb_ci_computer_final SRC1 ON SRC.sys_id=SRC1.sys_id AND SRC.sourceinstance=SRC1.sourceinstance
JOIN pgcmdb_mdwdb.d_configuration_item_ext_c TRGT
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id AND SRC.CDCTYPE<>'D'
LEFT JOIN (SELECT RIGHT(row_id,32) as row_id,source_id,row_key from pgcmdb_mdwdb.d_internal_organization) LKP ON SRC1.cpu_manufacturer=LKP.row_id AND SRC1.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,(CASE WHEN SRC1.cpu_manufacturer IS NULL THEN 0 ELSE -1 END))<>TRGT.cpu_manufacturer_c_key ;


SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)
THEN 'MDS to DWH data validation failed for d_configuration_item_ext_c.pg_ics_firewall_c_key' ELSE 'SUCCESS' END as Message
FROM png_mdsdb.cmdb_ci_final SRC
LEFT JOIN png_mdsdb.cmdb_ci_computer_final SRC1 ON SRC.sys_id=SRC1.sys_id AND SRC.sourceinstance=SRC1.sourceinstance
JOIN pgcmdb_mdwdb.d_configuration_item_ext_c TRGT
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id AND SRC.CDCTYPE<>'D'
LEFT JOIN pgcmdb_mdwdb.d_lov LKP ON LKP.dimension_class='ICS_FIREWALL_C~CMDB_CI_COMPUTER' AND SRC1.u_pg_yn_above_ics_firewall=LKP.dimension_code
WHERE COALESCE(LKP.row_key,(CASE WHEN SRC1.u_pg_yn_above_ics_firewall IS NULL THEN 0 ELSE -1 END))<>TRGT.pg_ics_firewall_c_key ;


SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)
THEN 'MDS to DWH data validation failed for d_configuration_item_ext_c.pg_iq_oq_c_key' ELSE 'SUCCESS' END as Message
FROM png_mdsdb.cmdb_ci_final SRC
LEFT JOIN png_mdsdb.cmdb_ci_computer_final SRC1 ON SRC.sys_id=SRC1.sys_id AND SRC.sourceinstance=SRC1.sourceinstance
JOIN pgcmdb_mdwdb.d_configuration_item_ext_c TRGT
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id AND SRC.CDCTYPE<>'D'
LEFT JOIN pgcmdb_mdwdb.d_lov LKP ON LKP.dimension_class='IQ_OQ_C~CMDB_CI_COMPUTER' AND SRC1.u_pg_yn_iq_oq=LKP.dimension_code
WHERE COALESCE(LKP.row_key,(CASE WHEN SRC1.u_pg_yn_iq_oq IS NULL THEN 0 ELSE -1 END))<>TRGT.pg_iq_oq_c_key ;


SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)
THEN 'MDS to DWH data validation failed for d_configuration_item_ext_c.pg_byod_c_key' ELSE 'SUCCESS' END as Message
FROM png_mdsdb.cmdb_ci_final SRC
LEFT JOIN png_mdsdb.cmdb_ci_computer_final SRC1 ON SRC.sys_id=SRC1.sys_id AND SRC.sourceinstance=SRC1.sourceinstance
JOIN pgcmdb_mdwdb.d_configuration_item_ext_c TRGT
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id AND SRC.CDCTYPE<>'D'
LEFT JOIN pgcmdb_mdwdb.d_lov LKP ON LKP.dimension_class='BYOD_C~CMDB_CI_COMPUTER' AND SRC1.u_pg_yn_byod=LKP.dimension_code
WHERE COALESCE(LKP.row_key,(CASE WHEN SRC1.u_pg_yn_byod IS NULL THEN 0 ELSE -1 END))<>TRGT.pg_byod_c_key ;


SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)
THEN 'MDS to DWH data validation failed for d_configuration_item_ext_c.pg_data_type_c_key' ELSE 'SUCCESS' END as Message
FROM png_mdsdb.cmdb_ci_final SRC
LEFT JOIN png_mdsdb.cmdb_ci_computer_final SRC1 ON SRC.sys_id=SRC1.sys_id AND SRC.sourceinstance=SRC1.sourceinstance
JOIN pgcmdb_mdwdb.d_configuration_item_ext_c TRGT
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id AND SRC.CDCTYPE<>'D'
LEFT JOIN pgcmdb_mdwdb.d_lov LKP ON LKP.dimension_class='DATA_TYPE_C~CMDB_CI_COMPUTER' AND SRC1.u_pg_ii_data_type=LKP.dimension_code
WHERE COALESCE(LKP.row_key,(CASE WHEN SRC1.u_pg_ii_data_type IS NULL THEN 0 ELSE -1 END))<>TRGT.pg_data_type_c_key ;


SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)
THEN 'MDS to DWH data validation failed for d_configuration_item.support_group' ELSE 'SUCCESS' END as Message
FROM png_mdsdb.cmdb_ci_final SRC
JOIN pgcmdb_mdwdb.f_configuration_item TRGT
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id AND SRC.CDCTYPE<>'D'
JOIN pgcmdb_mdwdb.d_configuration_item d on TRGT.configuration_item_key=d.row_key
LEFT JOIN (SELECT RIGHT(row_id,32) as row_id,source_id,row_key,organization_name from pgcmdb_mdwdb.d_internal_organization) LKP ON SRC.support_group=LKP.row_id AND SRC.sourceinstance=LKP.source_id
WHERE d.support_group<>LKP.organization_name ;


SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)
THEN 'MDS to DWH data validation failed for d_configuration_item.assigned_to' ELSE 'SUCCESS' END as Message
FROM png_mdsdb.cmdb_ci_final SRC
JOIN pgcmdb_mdwdb.f_configuration_item TRGT
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id AND SRC.CDCTYPE<>'D'
JOIN pgcmdb_mdwdb.d_configuration_item d on TRGT.configuration_item_key=d.row_key
LEFT JOIN (SELECT RIGHT(row_id,32) as row_id,source_id,row_key,full_name from pgcmdb_mdwdb.d_internal_contact) LKP ON SRC.assigned_to=LKP.row_id AND SRC.sourceinstance=LKP.source_id
WHERE d.assigned_to<>LKP.full_name ;


SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)
THEN 'MDS to DWH data validation failed for d_configuration_item.application_c_key' ELSE 'SUCCESS' END as Message
FROM png_mdsdb.cmdb_ci_final SRC
LEFT JOIN png_mdsdb.cmdb_ci_appl_final SRC1 ON SRC.sys_id=SRC1.sys_id AND SRC.sourceinstance=SRC1.sourceinstance
JOIN pgcmdb_mdwdb.d_configuration_item TRGT
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id AND SRC.CDCTYPE<>'D'
JOIN pgcmdb_mdwdb.d_application LKP ON CONCAT('APPLICATION~',SRC1.sys_id)=LKP.row_id AND SRC.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,(CASE WHEN SRC1.sys_id IS NULL THEN 0 ELSE -1 END))<>TRGT.application_c_key ;


SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)
THEN 'MDS to DWH data validation failed for d_application.u_pg_category_c' ELSE 'SUCCESS' END as Message
FROM png_mdsdb.cmdb_ci_appl_final SRC
JOIN pgcmdb_mdwdb.d_application TRGT
ON CONCAT('APPLICATION~',SRC.sys_id) = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id AND SRC.CDCTYPE<>'D'
WHERE COALESCE(u_pg_category,'UNSPECIFIED')<>TRGT.u_pg_category_c ;

SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)
THEN 'MDS to DWH data validation failed for d_configuration_item.configuration_item_ext_c_key' ELSE 'SUCCESS' END as Message
FROM png_mdsdb.cmdb_ci_final SRC
JOIN pgcmdb_mdwdb.d_configuration_item TRGT
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id AND SRC.CDCTYPE<>'D'
JOIN pgcmdb_mdwdb.d_configuration_item_ext_c LKP ON SRC.sys_id=LKP.row_id AND SRC.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,(CASE WHEN SRC.sys_id IS NULL THEN 0 ELSE -1 END))<>TRGT.configuration_item_ext_c_key ;

SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)
THEN 'MDS to DWH data validation failed for f_configuration_item.ci_managed_by_c_key' ELSE 'SUCCESS' END as Message
FROM png_mdsdb.cmdb_ci_final SRC
JOIN pgcmdb_mdwdb.f_configuration_item TRGT
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id AND SRC.CDCTYPE<>'D'
JOIN (SELECT RIGHT(row_id,32) as row_id,source_id,row_key from pgcmdb_mdwdb.d_internal_contact) LKP ON SRC.managed_by=LKP.row_id AND SRC.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,(CASE WHEN SRC.managed_by IS NULL THEN 0 ELSE -1 END))<>TRGT.ci_managed_by_c_key ;




