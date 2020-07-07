SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_configuration_item.targeted_software_discovery_flag_c' ELSE 'SUCCESS' END as Message
FROM
(
SELECT Count(1) as CNT 
FROM png_mdwdb.d_configuration_item d_configuration_item   
INNER JOIN png_mdwdb.f_configuration_item f_configuration_item ON d_configuration_item.row_key = f_configuration_item.configuration_item_key  
INNER JOIN png_mdwdb.d_lov d_lov1 ON d_configuration_item.cmdb_ci_hardware_status_c_key = d_lov1.row_key  
INNER JOIN png_mdwdb.d_internal_organization d_internal_organization ON f_configuration_item.assignment_group_key = d_internal_organization.row_key  
INNER JOIN png_mdwdb.d_lov d_lov ON d_configuration_item.cmdb_ci_install_status_c_key = d_lov.row_key  
LEFT OUTER JOIN png_mdwdb.d_assignment_scorecard_c d_assignment_scorecard_c 
ON d_internal_organization.organization_name = d_assignment_scorecard_c.assignment_group  
LEFT OUTER JOIN png_mdwdb.d_fnms_reports_c d_fnms_reports_c ON d_configuration_item.name = d_fnms_reports_c.inventory_device_name_c 
and d_configuration_item.serial_number = d_fnms_reports_c.serial_number_c
WHERE 
CASE WHEN d_configuration_item.class in ('Linux Server','UNIX Server','Windows Server','Desktop PC','Laptop PC')              
and d_lov.dimension_name = 'Leverage/Optimize'              
and d_lov1.dimension_name = 'Installed'              
and  d_configuration_item.pg_yn_network_connected_flag_c in ('yes','UNSPECIFIED')           
and d_fnms_reports_c.row_key is not null  
THEN 'Y'ELSE 'N' END <> d_configuration_item.targeted_software_discovery_flag_c
) temp;


 