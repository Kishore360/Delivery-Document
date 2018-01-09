SELECT 
sum(a11.row_key) 
FROM ldb.f_request_task a 
join	ldb.d_request_task	a12
 on 	(a11.request_task_key = a12.row_key)
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
where	  b.lagging_count_of_days between 0 and 29