SELECT 'f_application_incident_outage_c' as Table_Name,count(1) as Row_Count 
FROM ldb.f_application_incident_outage_c a 
UNION 
SELECT 'd_location' as Table_Name,count(1) as Row_Count 
FROM ldb.f_application_incident_outage_c a 
JOIN ldb.d_location b ON a.location_key=b.row_key
UNION 
SELECT 'd_incident' as Table_Name,count(1) as Row_Count 
FROM ldb.f_application_incident_outage_c a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
UNION 
SELECT 'd_configuration_item' as Table_Name,count(1) as Row_Count 
FROM ldb.f_application_incident_outage_c a 
JOIN ldb.d_configuration_item b ON a.configuration_item_key=b.row_key
UNION 
SELECT 'd_calendar_date' as Table_Name,count(1) as Row_Count 
FROM ldb.f_application_incident_outage_c a 
JOIN ldb.d_calendar_date b ON a.calendar_date_key=b.row_key
UNION 
SELECT 'd_calendar_month' as Table_Name,count(1) as Row_Count 
FROM ldb.f_application_incident_outage_c a 
JOIN ldb.d_calendar_date b ON a.calendar_date_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
UNION 
SELECT 'd_incident_type_c' as Table_Name,count(1) as Row_Count 
FROM ldb.f_application_incident_outage_c a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
JOIN ldb.d_incident_type_c c ON b.incident_type_src_c_key=c.row_key
UNION 
SELECT 'd_incident_outage_class_c' as Table_Name,count(1) as Row_Count 
FROM ldb.f_application_incident_outage_c a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
JOIN ldb.d_incident_outage_class_c c ON b.Outage_class_src_c_key=c.row_key