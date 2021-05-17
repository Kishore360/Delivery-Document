SELECT 'a_incident_weekly_c' as Table_Name, count(1) as Row_count
FROM ldb.a_incident_weekly_c a 
UNION
SELECT 'd_business_service' as Table_Name, count(1) as Row_count
FROM ldb.a_incident_weekly_c a 
JOIN ldb.d_business_service b ON a.business_service_key=b.row_key
UNION 
SELECT 'd_calendar_week' as Table_Name, count(1) as Row_count
FROM ldb.a_incident_weekly_c a 
JOIN ldb.d_calendar_week b ON a.period_start_c_key=b.row_key
UNION
SELECT 'd_internal_contact_assigned_to' as Table_Name, count(1) as Row_count
FROM ldb.a_incident_weekly_c a 
JOIN ldb.d_internal_contact_assigned_to b ON a.assigned_to_key=b.row_key
UNION 
SELECT 'd_internal_contact_assignment_group_manager_c' as Table_Name, count(1) as Row_count
FROM ldb.a_incident_weekly_c a
JOIN ldb.d_internal_organization_group b ON a.assignment_group_key=b.row_key
JOIN ldb.d_internal_contact_assignment_group_manager_c c ON b.manager_c_key=c.row_key
UNION 
SELECT 'd_internal_organization_group' as Table_Name, count(1) as Row_count
FROM ldb.a_incident_weekly_c a 
JOIN ldb.d_internal_organization_group b ON a.assignment_group_key=b.row_key
UNION 
SELECT 'd_configuration_item_support_group_weekly_c' as Table_Name, count(1) as Row_count
FROM ldb.a_incident_weekly_c a 
JOIN ldb.d_business_service b ON a.business_service_key=b.row_key
JOIN ldb.d_configuration_item_support_group_weekly_c c ON a.business_service_key=c.row_key 