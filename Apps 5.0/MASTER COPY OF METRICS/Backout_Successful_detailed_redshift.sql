SELECT count(a.change_request_key) as Backout_Successful
FROM ldb.f_change_request_closed a 
JOIN ldb.d_change_request b ON a.change_request_key=b.row_key
JOIN ldb.d_calendar_date c ON a.closed_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where b.backout_successful_c='N'
and d.lagging_count_of_month between 0 and 11