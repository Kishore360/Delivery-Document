SELECT 
'Open to Close Duration Days',
sum(a.open_to_close_duration)/86400.0 as Open_To_Close_Duration
FROM ldb.f_request_item a 
JOIN ldb.d_calendar_date b 
ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c
ON b.month_start_date_key = c.row_key
where c.lagging_count_of_month between 0 and 11