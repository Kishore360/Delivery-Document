
SELECT 'Avg Open to Close Durtion (Days)',
SUM(a.open_to_close_duration)/86400.0 /Count(a.row_key)
FROM ldb.f_request_task_closed a 
JOIN ldb.d_calendar_date b ON a.closed_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
Where c.lagging_count_of_month between 0 and 24 
UNION 
SELECT SUM(a.overdue_duration)/86400.0/Count(a.row_key)
FROM ldb.f_request_task a 
JOIN ldb.d_request_task x ON a.request_task_key=x.row_key
JOIN ldb.d_calendar_date b ON a.closed_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
Where (c.lagging_count_of_month between 0 and 24 and x.over_due_flag='Y')
UNION 
SELECT Count(a.row_key)
FROM ldb.f_request_task_closed a 
JOIN ldb.d_calendar_date b ON a.closed_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
Where c.lagging_count_of_month between 0 and 24 
UNION
SELECT 'Avg Time to Fulfill (Days)',
SUM(a11.open_to_close_duration)/86400.0/Count(a11.row_key)
FROM ldb.f_request_task_closed a11
join ldb.d_request_task	a12 on (a11.request_task_key = a12.row_key)
JOIN ldb.d_calendar_date b ON a11.closed_on_key=b.row_key
where	 b.lagging_count_of_month between 0 and 24
UNION 
SELECT 'Business Duration (Days)',
SUM(a11.business_duration)/86400.0
FROM ldb.f_request_task a11
join ldb.d_request_task	a12 on (a11.request_task_key = a12.row_key)
JOIN ldb.d_calendar_date b ON a11.opened_on_key=b.row_key
where	 b.lagging_count_of_month between 0 and 24
UNION 
SELECT 'Opened Request Tasks',
count(a.row_key) as Opened_Request_Tasks
FROM ldb.f_request_task a 
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key 
and b.lagging_count_of_month between 0 and 24
UNION 
SELECT 'Opened Request Tasks - Last 30 Days',
count(a.row_key) as Opened_Request_Tasks
FROM ldb.f_request_task a 
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key 
and b.lagging_count_of_days between 0 and 29
UNION 
SELECT 'Overdue Requests Tasks',
count(a.row_key) as Opened_Request_Tasks
FROM ldb.f_request_task a 
JOIN ldb.d_request_task c ON a.request_task_key=c.row_key
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key 
and (b.lagging_count_of_month between 0 and 24 and c.over_due_flag='Y')
UNION 
SELECT 'Reassignments',SUM(a.reassignment_count)
FROM ldb.f_request_task a 
JOIN ldb.d_request_task c ON a.request_task_key=c.row_key
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key 
and (b.lagging_count_of_month between 0 and 24)
UNION 
SELECT 
'Request Task Backlog',
count(a.row_key) as Request_task_Backlog
FROM ldb.f_request_task a
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
JOIN ldb.d_task_state c ON a.request_task_key=c.row_key
where c.wh_dimension_code='OPEN'
and b.lagging_count_of_month between 0 and 24