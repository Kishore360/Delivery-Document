SELECT 
'Avg Problems Open to Close Duration (Hours)',
(SUM(a.open_to_close_duration)/3600.0)/count(a.row_key)
 as Avg_Open_to_Close_Duration_Hours
FROM ldb.f_problem_closed a 
JOIN ldb.d_calendar_date b 
ON a.closed_on_key=b.row_key
JOIN ldb.d_calendar_month c
ON b.month_start_date_key = c.row_key
where c.lagging_count_of_month between 0 and 11