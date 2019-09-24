SELECT 'Duration (Days)',
SUM(a.assigned_duration)/86400.00 AS assigned_duration
FROM ldb.f_incident_activity a
JOIN ldb.d_calendar_date c ON a.assigned_on_key=c.row_key
JOIN ldb.d_calendar_month b ON c.month_start_date_key=b.row_key
where b.lagging_count_of_month between 0 and 12 
UNION 
SELECT 'MTTR (Days)',
SUM(a.mttr_c)/86400.0 AS mttr_c
FROM ldb.f_incident_activity a
JOIN ldb.d_calendar_date c ON a.assigned_on_key=c.row_key
JOIN ldb.d_calendar_month b ON c.month_start_date_key=b.row_key
where b.lagging_count_of_month between 0 and 12 
UNION 
SELECT 'Number of Assignees Involved',
Max(a.to_assigned_to_key) as Number_of_Assignees_Involved
FROM ldb.f_incident_activity a
JOIN ldb.d_calendar_date c ON a.assigned_on_key=c.row_key
JOIN ldb.d_calendar_month b ON c.month_start_date_key=b.row_key
where b.lagging_count_of_month between 0 and 12 
UNION 
SELECT 'Number of Assignment Groups Involved',
Max(a.to_assignment_group_key) AS Number_of_Assignment_Groups_Involved
FROM ldb.f_incident_activity a
JOIN ldb.d_calendar_date c ON a.assigned_on_key=c.row_key
JOIN ldb.d_calendar_month b ON c.month_start_date_key=b.row_key
where b.lagging_count_of_month between 0 and 12 


 