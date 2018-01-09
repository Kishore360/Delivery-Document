SELECT 
'Overdue Requests Tasks',
sum(a11.row_key) AS Overdue Requests Tasks
FROM ldb.f_request_task a 
join	ldb.d_request_task	a12
 on 	(a11.request_task_key = a12.row_key)
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
where	a12.over_due_flag = 'Y' and  b.lagging_count_of_month between 0 and 24