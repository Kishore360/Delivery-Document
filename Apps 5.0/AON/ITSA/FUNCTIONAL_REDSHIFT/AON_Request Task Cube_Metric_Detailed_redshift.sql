SELECT 
'All Request Tasks',
count(a.row_key) as All_Request_Tasks
FROM ldb.f_request_task a 
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
where b.lagging_count_of_month between 0 and 24
UNION 
SELECT 
'Backlog Request Tasks',
count(a.row_key) as Backlog_Request_Tasks
FROM ldb.f_request_task a 
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
JOIN ldb.d_request_task c ON a.request_task_key=c.row_key
where c.backlog_flag='Y'
and b.lagging_count_of_month between 0 and 24
UNION 
SELECT 
'Overdue Requests Tasks',
count(a.row_key) as Overdue_Requests_Tasks
FROM ldb.f_request_task a 
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
JOIN ldb.d_request_task c ON a.request_task_key=c.row_key
where c.over_due_flag='Y'
and b.lagging_count_of_month between 0 and 24
UNION 
SELECT 
'Closed Request Tasks',
count(a.row_key) as Closed_Request_Tasks
FROM ldb.f_request_task_closed a 
JOIN ldb.d_calendar_date b ON a.closed_on_key=b.row_key
where b.lagging_count_of_month between 0 and 24
UNION 
SELECT 
'Closed Tasks Met SLA',
count(a.row_key) as Closed_Request_Tasks
FROM ldb.f_request_task_closed a
JOIN ldb.d_request_task c ON a.request_task_key=c.row_key
JOIN ldb.d_calendar_date b ON a.closed_on_key=b.row_key
where b.lagging_count_of_month between 0 and 24
and c.met_sla_flag='Y'
UNION 
SELECT 
'Request Task Backlog',
count(a.row_key) as Request_task_Backlog
FROM ldb.f_request_task a
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
JOIN ldb.d_task_state c ON a.request_task_key=c.row_key
where c.wh_dimension_code='OPEN'
and b.lagging_count_of_month between 0 and 24
UNION 
SELECT 
'Days Since Last update',
sum(a.dormancy_age_c) as Days_Since_Last_Update
FROM ldb.f_request_task a 
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key 
where b.lagging_count_of_month between 0 and 24
UNION 
SELECT 
'Multiple Assignment Requests Tasks',
count(a.row_key) as Multiple_Assignment_Request_Tasks
FROM ldb.f_request_task a 
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key 
JOIN ldb.d_request_task c ON a.request_task_key=c.row_key
where c.multiple_assignment_flag='Y'
and b.lagging_count_of_month between 0 and 24
UNION
SELECT 
'Multiple Assignment Tasks Met SLA',
count(a.row_key) as Multiple_Assignment_Task_Met_SLA
FROM ldb.f_request_task a 
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key 
JOIN ldb.d_request_task c ON a.request_task_key=c.row_key
where c.multiple_assignment_flag='Y' and c.met_sla_flag='Y'
and b.lagging_count_of_month between 0 and 24
UNION 
SELECT 'Opened Request Tasks',
count(a.row_key) as Opened_Request_Tasks
FROM ldb.f_request_task a 
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key 
and b.lagging_count_of_month between 0 and 24
UNION 
SELECT 
'Request Task Open To Close Duration (hrs)',
sum(a.open_to_close_duration)/3600.0 as Request_Task_Open_To_Close_Duration
FROM ldb.f_request_task_closed a 
JOIN ldb.d_calendar_date b ON a.closed_on_key=b.row_key 
JOIN ldb.d_request_task c ON a.request_task_key=c.row_key
where  b.lagging_count_of_month between 0 and 24
UNION 
SELECT 'Request Task Reassignment Count', 
sum(a.reassignment_count) as Request_Task_Reassignment_Count
FROM ldb.f_request_task a 
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key 
JOIN ldb.d_request_task c ON a.request_task_key=c.row_key
where  b.lagging_count_of_month between 0 and 24

