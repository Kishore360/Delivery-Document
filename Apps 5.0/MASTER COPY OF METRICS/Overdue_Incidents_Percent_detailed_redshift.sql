

SELECT a.ABC/b.XYZ*100 as Overdue_Incidents_Percent
FROM 
(SELECT count(a.row_key) as ABC
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where d.lagging_count_of_month between 0 and 12 
AND b.over_due_flag='Y')a
CROSS JOIN 
(SELECT count(a.row_key) as XYZ
FROM ldb.f_incident  a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where d.lagging_count_of_month between 0 and 12 ) b 
