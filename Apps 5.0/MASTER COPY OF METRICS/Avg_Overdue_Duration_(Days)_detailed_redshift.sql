SELECT 
'Avg Overdue Duration (Days)',
sum(a11.overdue_duration /86400.0)/count(a11.row_rey) AS Avg Overdue Duration (Days)
FROM ldb.f_request_task a11
join	ldb.d_request_task	a12
 on 	(a11.request_task_key = a12.row_key)
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
where	a12.over_due_flag = 'Y' and  b.lagging_count_of_month between 0 and 12