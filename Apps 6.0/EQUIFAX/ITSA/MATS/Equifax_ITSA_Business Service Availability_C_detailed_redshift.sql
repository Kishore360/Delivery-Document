SELECT 'f_business_service_availability_c' as Table_Name,Count(1) as Row_count
FROM ldb.f_business_service_availability_c 
UNION 
SELECT 'd_business_service' as Table_Name,Count(1) as Row_count
FROM ldb.f_business_service_availability_c a
JOIN ldb.d_business_service b ON a.business_service_key=b.row_key
UNION 
SELECT 'd_calendar_date' as Table_Name,Count(1) as Row_count
FROM ldb.f_business_service_availability_c a
JOIN ldb.d_calendar_date b ON a.calendar_date_key=b.row_key
UNION 
SELECT 'd_calendar_month' as Table_Name,Count(1) as Row_count
FROM ldb.f_business_service_availability_c a
JOIN ldb.d_calendar_date b ON a.calendar_date_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
UNION
SELECT 'd_calendar_quarter' as Table_Name,Count(1) as Row_count
FROM ldb.f_business_service_availability_c a
JOIN ldb.d_calendar_date b ON a.calendar_date_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
JOIN ldb.d_calendar_quarter d ON c.quarter_start_date_key=d.row_key
UNION 
SELECT 'd_calendar_year' as Table_Name,Count(1) as Row_count
FROM ldb.f_business_service_availability_c a
JOIN ldb.d_calendar_date b ON a.calendar_date_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
JOIN ldb.d_calendar_quarter d ON c.quarter_start_date_key=d.row_key
JOIN ldb.d_calendar_year e ON d.year_start_date_key =e.row_key
UNION 
SELECT 'd_calendar_week' as Table_Name,Count(1) as Row_count
FROM ldb.f_business_service_availability_c a
JOIN ldb.d_calendar_date b ON a.calendar_date_key=b.row_key
JOIN ldb.d_calendar_week c ON b.week_start_date_key =c.row_key




