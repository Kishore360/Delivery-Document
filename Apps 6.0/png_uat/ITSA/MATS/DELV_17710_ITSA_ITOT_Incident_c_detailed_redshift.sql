/* Tables Accessed:
d_business_service
d_calendar_date
d_calendar_date_fiscal
d_calendar_fiscal_period
d_calendar_fiscal_quarter
d_calendar_fiscal_week
d_calendar_fiscal_year
d_calendar_month
d_configuration_item
d_incident
d_incident_category
d_incident_impact
d_incident_severity
d_incident_state
d_incident_unit_of_measure_c
d_location
d_parent_incident
f_incident */


SELECT 'f_incident' as Table_Name,Count(1) as Row_Count 
FROM ldb.f_incident a 
UNION 
SELECT 'd_incident' as Table_Name,Count(1) as Row_Count 
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key 
UNION 
SELECT 'd_parent_incident' as Table_Name,Count(1) as Row_Count 
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key 
JOIN ldb.d_parent_incident c ON b.parent_incident_key=c.row_key 
UNION 
SELECT 'd_location' as Table_Name,Count(1) as Row_Count 
FROM ldb.f_incident a 
JOIN ldb.d_location b ON a.location_key=b.row_key
UNION 
SELECT 'd_incident_unit_of_measure_c' as Table_Name,Count(1) as Row_Count 
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key 
JOIN ldb.d_incident_unit_of_measure_c c ON b.incident_unit_of_measure_c_key=c.row_key 
UNION  
SELECT 'd_incident_state' as Table_Name,Count(1) as Row_Count 
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key 
JOIN ldb.d_incident_state c ON b.state_src_key=c.row_key 
UNION 
SELECT 'd_incident_impact' as Table_Name,Count(1) as Row_Count 
FROM ldb.f_incident a 
JOIN ldb.d_incident_impact c ON a.impact_src_key=c.row_key 
UNION 
SELECT 'd_incident_severity' as Table_Name,Count(1) as Row_Count 
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key 
JOIN ldb.d_incident_severity c ON b.severity_src_key=c.row_key 
UNION 
SELECT 'd_incident_category' as Table_Name,Count(1) as Row_Count 
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key 
JOIN ldb.d_incident_category c ON b.category_src_key=c.row_key

UNION 
SELECT 'd_configuration_item' as Table_Name,Count(1) as Row_Count 
FROM ldb.f_incident a 
JOIN ldb.d_configuration_item b  ON a.configuration_item_key=b.row_key 
UNION  
SELECT 'd_calendar_date' as Table_Name,Count(1) as Row_Count 
FROM ldb.f_incident a 
JOIN ldb.d_calendar_date b ON a.date_key=b.row_key 
UNION 
SELECT 'd_calendar_month' as Table_Name,Count(1) as Row_Count 
FROM ldb.f_incident a 
JOIN ldb.d_calendar_date b ON a.date_key=b.row_key 
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key 
UNION 
SELECT 'd_calendar_date_fiscal' as Table_Name,Count(1) as Row_Count 
FROM ldb.f_incident a 
JOIN ldb.d_calendar_date_fiscal b ON a.fiscal_date_key=b.row_key 
UNION 
SELECT 'd_calendar_fiscal_period' as Table_Name,Count(1) as Row_Count 
FROM ldb.f_incident a
JOIN ldb.d_calendar_date_fiscal b ON a.fiscal_date_key=b.row_key  
JOIN ldb.d_calendar_fiscal_period c ON b.period_start_date_key=b.row_key
UNION 
SELECT 'd_calendar_fiscal_quarter' as Table_Name,Count(1) as Row_Count 
FROM ldb.f_incident a 
JOIN ldb.d_calendar_date_fiscal b ON a.fiscal_date_key=b.row_key
JOIN ldb.d_calendar_fiscal_quarter c ON b.quarter_start_date_key=c.row_key 
UNION 
SELECT 'd_calendar_fiscal_week' as Table_Name,Count(1) as Row_Count 
FROM ldb.f_incident a 
JOIN ldb.d_calendar_date_fiscal b ON a.fiscal_date_key=b.row_key
JOIN ldb.d_calendar_fiscal_week c ON b.week_start_date_key=c.row_key 
UNION 
SELECT 'd_calendar_fiscal_year' as Table_Name,Count(1) as Row_Count 
FROM ldb.f_incident a 
JOIN ldb.d_calendar_date_fiscal b ON a.fiscal_date_key=b.row_key
JOIN ldb.d_calendar_fiscal_year c ON b.year_start_date_key=c.row_key 
UNION 
SELECT 'd_business_service' as Table_Name,Count(1) as Row_Count 
FROM ldb.f_incident a 
JOIN ldb.d_business_service b ON a.business_service_key=b.row_key 



