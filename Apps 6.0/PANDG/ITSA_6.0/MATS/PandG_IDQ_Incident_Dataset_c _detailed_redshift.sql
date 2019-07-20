SELECT 'f_incident' AS Table_Name, Count(1) as CNT 
FROM ldb.f_incident a
UNION 
SELECT 'd_configuration_item' AS Table_Name, Count(1) as CNT 
FROM ldb.f_incident a
JOIN ldb.d_configuration_item b ON a.configuration_item_key=b.row_key
UNION 
SELECT 'd_incident' AS Table_Name, Count(1) as CNT 
FROM ldb.f_incident a
JOIN ldb.d_incident b ON a.incident_key=b.row_key
UNION 
SELECT 'd_incident_priority P' AS Table_Name, Count(1) as CNT 
FROM ldb.f_incident a
JOIN ldb.d_incident_priority b ON a.priority_src_key=b.row_key
