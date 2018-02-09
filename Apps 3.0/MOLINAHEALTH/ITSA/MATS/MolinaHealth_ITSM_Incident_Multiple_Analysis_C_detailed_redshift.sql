SELECT 'f_incident_multiple_analysis_c' as Table_Name, count(1) as Row_count
FROM ldb.f_incident_multiple_analysis_c a 
UNION 
SELECT 'd_incident_locations_c' as Table_Name, count(1) as Row_count
FROM ldb.f_incident_multiple_analysis_c a 
JOIN ldb.d_incident_locations_c b ON (a.location_key=b.row_key)
UNION 
SELECT 'd_incident' as Table_Name, count(1) as Row_count
FROM ldb.f_incident_multiple_analysis_c a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
UNION 
SELECT 'd_business_unit_c' as Table_Name, count(1) as Row_count
FROM ldb.f_incident_multiple_analysis_c a 
JOIN ldb.d_business_unit_c b ON a.business_unit_c_key=b.row_key


