SELECT a.ABC/b.XYZ*100 as Multiple_Categorization_Incidents_Percent
FROM 
(SELECT count(a.row_key) as ABC
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
where b.multiple_categorization_flag='Y') a 
CROSS JOIN 
(SELECT count(a.row_key) as XYZ
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key) b 
