SELECT 
'Time to Publish Findings (days)',
SUM(a.findings_publish_duration_c)/86400.0 as Time_to_Publish_Findings_Days
FROM ldb.f_problem a
JOIN ldb.d_calendar_date b 
ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c
ON b.month_start_date_key = c.row_key
where c.lagging_count_of_month between 0 and 11