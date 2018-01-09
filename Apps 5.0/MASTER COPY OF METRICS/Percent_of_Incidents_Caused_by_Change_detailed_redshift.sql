SELECT a.ABC/b.XYZ*100 as Percent_of_Incidents_Caused_by_Change
FROM 
(SELECT count(a.row_key) as ABC
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
AND d.lagging_count_of_month between 0 and 12
where b.caused_by_change_flag='Y') a 
CROSS JOIN 
(SELECT count(a.row_key) as XYZ
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where d.lagging_count_of_month between 0 and 12) b 
