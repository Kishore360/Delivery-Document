SELECT 'ldb.f_technical_health_check_c' as Table_Name,Count(a11.row_key) as Row_Count 
FROM ldb.f_technical_health_check_c a11 
UNION 
SELECT 'ldb.d_eit_application_c' as Table_Name,Count(a11.row_key) as Row_Count 
FROM ldb.f_technical_health_check_c a11 
JOIN ldb.d_eit_application_c a12 ON a11.eit_application_c_key=a12.row_key
UNION 
SELECT 'ldb.d_calendar_month' as Table_Name,Count(a11.row_key) as Row_Count 
FROM ldb.f_technical_health_check_c a11 
JOIN ldb.d_calendar_month a12 ON a11.month_c_key=a12.row_key
UNION 
SELECT 'ldb.d_internal_contact_division_manager_c' as Table_Name,Count(a11.row_key) as Row_Count 
FROM ldb.f_technical_health_check_c a11 
JOIN ldb.d_eit_application_c a12 ON a11.eit_application_c_key=a12.row_key
JOIN ldb.d_internal_contact_division_manager_c a13 ON a12.ldb.division_manager_key=a13.row_key 

