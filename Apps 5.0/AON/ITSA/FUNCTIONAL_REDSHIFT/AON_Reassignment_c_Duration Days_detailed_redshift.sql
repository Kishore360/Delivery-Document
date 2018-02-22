SELECT 'Duration (Days)',
SUM(a.assigned_duration)/86400.00 AS assigned_duration
FROM ldb.f_incident_activity a
JOIN ldb.d_calendar_date c ON a.assigned_on_key=c.row_key
JOIN ldb.d_calendar_month b ON c.month_start_date_key=b.row_key
where b.lagging_count_of_month between 0 and 12 

 