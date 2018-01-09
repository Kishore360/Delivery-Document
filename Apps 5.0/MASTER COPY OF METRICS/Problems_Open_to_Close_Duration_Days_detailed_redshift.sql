SELECT 
'Problems Open to Close Duration (days)',
SUM(a.open_to_close_duration)/86400.0 as Problems_Open_to_Close_Duration_Days
FROM ldb.f_problem_closed_c a 
JOIN ldb.d_calendar_date b 
ON a.closed_on_key=b.row_key
JOIN ldb.d_calendar_month c
ON b.month_start_date_key = c.row_key
where c.lagging_count_of_month between 0 and 11