

SELECT 'f_application_availability_c' as Table_name , Count(a11.row_key) as Row_Count 
FROM ldb.f_application_availability_c a11 
UNION 
SELECT 'd_configuration_item' as Table_name , Count(a11.row_key) as Row_Count 
FROM ldb.f_application_availability_c a11 
JOIN ldb.d_configuration_item a12 ON a11.configuration_item_key=a12.row_key
UNION 
SELECT 'd_calendar_date' as Table_name , Count(a11.row_key) as Row_Count 
FROM ldb.f_application_availability_c a11 
JOIN ldb.d_calendar_date a12 ON a11.calendar_date_key=a12.row_key
UNION 
SELECT 'd_calendar_month' as Table_name , Count(a11.row_key) as Row_Count 
FROM ldb.f_application_availability_c a11 
JOIN ldb.d_calendar_date a12 ON a11.calendar_date_key=a12.row_key
JOIN ldb.d_calendar_month a13 ON a12.month_start_date_key=a13.row_key
UNION 
SELECT 'd_calendar_year' as Table_name , Count(a11.row_key) as Row_Count 
FROM ldb.f_application_availability_c a11 
JOIN ldb.d_calendar_date a12 ON a11.calendar_date_key=a12.row_key
JOIN ldb.d_calendar_year a13 ON a12.year_start_date_key=a13.row_key
UNION 
SELECT 'd_application_schedule_c' as Table_name , Count(a11.row_key) as Row_Count 
FROM ldb.f_application_availability_c a11 
JOIN ldb.d_application_schedule_c a12 ON a11.application_schedule_c_key=a12.row_key