/* d_buisness_unit_itot_c
d_business_category_itot_c
d_business_service
d_calendar_date
d_calendar_date_fiscal
d_calendar_fiscal_period
d_calendar_fiscal_quarter
d_calendar_fiscal_week
d_calendar_fiscal_year
d_calendar_month
d_location
f_itot_quality_c */


SELECT 'f_itot_quality_c' AS Table_Name,Count(1) as Row_Count
FROM ldb.f_itot_quality_c a
UNION 
SELECT 'd_location' AS Table_Name,Count(1) as Row_Count
FROM ldb.f_itot_quality_c a
JOIN ldb.d_location b ON a.location_key=b.row_key
UNION 
SELECT 'd_calendar_date' AS Table_Name,Count(1) as Row_Count
FROM ldb.f_itot_quality_c a
JOIN ldb.d_calendar_date b ON a.date_key=b.row_key
UNION 
SELECT 'd_calendar_month' AS Table_Name,Count(1) as Row_Count
FROM ldb.f_itot_quality_c a
JOIN ldb.d_calendar_date b ON a.date_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
UNION 
SELECT 'd_calendar_date_fiscal' AS Table_Name,Count(1) as Row_Count
FROM ldb.f_itot_quality_c a
JOIN ldb.d_calendar_date_fiscal b ON a.fiscal_date_key=b.row_key
UNION 
SELECT 'd_calendar_fiscal_period' AS Table_Name,Count(1) as Row_Count
FROM ldb.f_itot_quality_c a
JOIN ldb.d_calendar_date_fiscal b ON a.fiscal_date_key=b.row_key
JOIN ldb.d_calendar_fiscal_period c ON b.period_start_date_key=c.row_key
UNION
SELECT 'd_calendar_fiscal_quarter' AS Table_Name,Count(1) as Row_Count
FROM ldb.f_itot_quality_c a
JOIN ldb.d_calendar_date_fiscal b ON a.fiscal_date_key=b.row_key
JOIN ldb.d_calendar_fiscal_quarter c ON b.quarter_start_date_key=c.row_key
UNION 
SELECT 'd_calendar_fiscal_week' AS Table_Name,Count(1) as Row_Count
FROM ldb.f_itot_quality_c a
JOIN ldb.d_calendar_date_fiscal b ON a.fiscal_date_key=b.row_key
JOIN ldb.d_calendar_fiscal_week c ON b.week_start_date_key=c.row_key
UNION 
SELECT 'd_calendar_fiscal_year' AS Table_Name,Count(1) as Row_Count
FROM ldb.f_itot_quality_c a
JOIN ldb.d_calendar_date_fiscal b ON a.fiscal_date_key=b.row_key
JOIN ldb.d_calendar_fiscal_year c ON b.year_start_date_key=c.row_key
UNION 
SELECT 'd_business_service' AS Table_Name,Count(1) as Row_Count
FROM ldb.f_itot_quality_c a
JOIN ldb.d_business_service b ON a.business_service_key=b.row_key
UNION 
SELECT 'd_buisness_unit_itot_c' AS Table_Name,Count(1) as Row_Count
FROM ldb.f_itot_quality_c a
JOIN ldb.d_buisness_unit_itot_c b ON a.business_unit_itot_c_key=b.row_key
UNION 
SELECT 'd_business_category_itot_c' AS Table_Name,Count(1) as Row_Count
FROM ldb.f_itot_quality_c a
JOIN ldb.d_business_category_itot_c b ON a.business_category_c_key=b.row_key






