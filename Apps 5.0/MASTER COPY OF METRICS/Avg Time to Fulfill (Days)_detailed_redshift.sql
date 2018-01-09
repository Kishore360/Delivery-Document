SELECT 
((sum(a11.open_to_close_duration)/86400.0)/count(a11.row_key))/count(a11.row_key)
FROM ldb.f_request_task_closed a11
join	ldb.d_request_task	a12
 on 	(a11.request_task_key = a12.row_key)
JOIN ldb.d_calendar_date b ON a.closed_on_key=b.row_key
where	 b.lagging_count_of_month between 0 and 12