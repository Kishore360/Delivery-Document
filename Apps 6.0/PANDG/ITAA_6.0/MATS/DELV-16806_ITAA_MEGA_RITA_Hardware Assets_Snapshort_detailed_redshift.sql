/* d_calendar_month done 
d_internal_organization_group
d_location done
d_lov_cmdb_ci_hardware_status_c
f_configuration_item_monthly_c done 
 */
 


SELECT 'f_configuration_item_monthly_c' AS TABLE_NAME,Count(1) as CNT 
FROM ldb.f_configuration_item_monthly_c a 
UNION 
SELECT 'd_calendar_month' AS TABLE_NAME,Count(1) as CNT 
FROM ldb.f_configuration_item_monthly_c a 
JOIN ldb.d_calendar_month b ON a.n_key=b.row_key
UNION 
SELECT 'd_internal_organization_group' AS TABLE_NAME,Count(1) as CNT 
FROM ldb.f_configuration_item_monthly_c a 
JOIN ldb.d_internal_organization_group b ON a.assignment_group_key=b.row_key
UNION 
SELECT 'd_location' AS TABLE_NAME,Count(1) as CNT 
FROM ldb.f_configuration_item_monthly_c a 
JOIN ldb.d_location b ON a.location_key=b.row_key
UNION 
SELECT 'd_lov_cmdb_ci_hardware_status_c' AS TABLE_NAME,Count(1) as CNT 
FROM ldb.f_configuration_item_monthly_c a 
JOIN ldb.d_lov_cmdb_ci_hardware_status_c b ON a.cmdb_ci_hardware_status_c_key=b.row_key


