SELECT 
'Days to Close',
sum(a.open_to_close_business_duration_c)/86400.0 as Days_to_Close
FROM ldb.f_problem a 
JOIN ldb.d_calendar_date b 
ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c
ON b.month_start_date_key = c.row_key
where c.lagging_count_of_month between 0 and 11