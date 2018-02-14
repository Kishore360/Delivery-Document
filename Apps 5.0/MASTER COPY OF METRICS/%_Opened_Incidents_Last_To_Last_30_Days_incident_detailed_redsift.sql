SELECT '% Opened Incidents last to last 30 days',
(X.a-Y.b)/Y.b *100.0 AS opened_incidents_last_to_last_30_days FROM 
(SELECT count(a.row_key)*1.0 as a  
FROM ldb.f_incident a 
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
Where b.lagging_count_of_days between 0 and 29)X 
CROSS JOIN 
(
SELECT count(a.row_key)*1.0 as b  
FROM ldb.f_incident a 
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
Where b.lagging_count_of_days between 30 and 59
) Y 
