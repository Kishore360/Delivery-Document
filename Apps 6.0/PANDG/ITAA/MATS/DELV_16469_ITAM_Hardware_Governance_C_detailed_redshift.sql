/* Tables Accessed:
d_calendar_date- done 
d_calendar_month - done 
d_configuration_item
d_internal_organization_group- done 
d_location- done 
d_lov_cmdb_ci_discovery_source_c
d_lov_cmdb_ci_hardware_status_c
d_lov_cmdb_ci_install_status_c
d_organization_manager_c
d_owned_by
d_owned_by_department
f_configuration_item
 */
 
SELECT 'f_configuration_item' AS Table_Name, Count(1) as Row_Count 
FROM ldb.f_configuration_item a
UNION 
SELECT 'd_configuration_item' AS Table_Name, Count(1) as Row_Count 
FROM ldb.f_configuration_item a
JOIN ldb.d_configuration_item b ON a.configuration_item_key=b.row_key
UNION 
SELECT 'd_location' AS Table_Name, Count(1) as Row_Count 
FROM ldb.f_configuration_item a
JOIN ldb.d_configuration_item b ON a.configuration_item_key=b.row_key
JOIN ldb.d_location c ON b.location_key=c.row_key
UNION 
SELECT 'd_calendar_date' AS Table_Name, Count(1) as Row_Count 
FROM ldb.f_configuration_item a
JOIN ldb.d_calendar_date b ON a.date_key_c=b.row_key
UNION 
SELECT 'd_calendar_month' AS Table_Name, Count(1) as Row_Count 
FROM ldb.f_configuration_item a
JOIN ldb.d_calendar_date b ON a.date_key_c=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
UNION 
SELECT 'd_owned_by' AS Table_Name, Count(1) as Row_Count 
FROM ldb.f_configuration_item a
JOIN ldb.d_owned_by b ON a.owned_by_key=b.row_key
UNION 
SELECT 'd_owned_by_department' AS Table_Name, Count(1) as Row_Count 
FROM ldb.f_configuration_item a
JOIN ldb.d_owned_by b ON a.owned_by_key=b.row_key
JOIN ldb.d_owned_by_department c ON b.owned_by_department=c.row_key
UNION 
SELECT 'd_internal_organization_group' AS Table_Name, Count(1) as Row_Count 
FROM ldb.f_configuration_item a
JOIN ldb.d_internal_organization_group b ON a.assignment_group_key=b.row_key
UNION 
SELECT 'd_lov_cmdb_ci_install_status_c' AS Table_Name, Count(1) as Row_Count 
FROM ldb.f_configuration_item a
JOIN ldb.d_configuration_item b ON a.configuration_item_key=b.row_key
JOIN ldb.d_lov_cmdb_ci_install_status_c c ON b.cmdb_ci_install_status_c_key=c.row_key
UNION 
SELECT 'd_lov_cmdb_ci_hardware_status_c' AS Table_Name, Count(1) as Row_Count 
FROM ldb.f_configuration_item a
JOIN ldb.d_configuration_item b ON a.configuration_item_key=b.row_key
JOIN ldb.d_lov_cmdb_ci_hardware_status_c c ON b.cmdb_ci_hardware_status_c_key=c.row_key
UNION 
SELECT 'd_lov_cmdb_ci_discovery_source_c' AS Table_Name, Count(1) as Row_Count 
FROM ldb.f_configuration_item a
JOIN ldb.d_configuration_item b ON a.configuration_item_key=b.row_key
JOIN ldb.d_lov_cmdb_ci_discovery_source_c c ON b.cmdb_ci_discovery_source_c_key=c.row_key
UNION 
SELECT 'd_organization_manager_c' AS Table_Name, Count(1) as Row_Count 
FROM ldb.f_configuration_item a
JOIN ldb.d_internal_organization_group b ON a.assignment_group_key=b.row_key
JOIN ldb.d_organization_manager_c c ON b.organization_manager_c_key=c.row_key