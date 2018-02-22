SELECT 'Age of Parent at Change Task Closure (Days)',
SUM(a.parent_age_at_task_closure)/86400.0 
FROM ldb.f_change_task a 
JOIN ldb.d_change_task b ON a.change_task_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
Where d.lagging_count_of_month between 0 and 24  
UNION 
SELECT 'Age of Parent at Change Task Open (Days)',
SUM(a.parent_age_at_task_open)/86400.0
FROM ldb.f_change_task a 
JOIN ldb.d_change_task b ON a.change_task_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
Where d.lagging_count_of_month between 0 and 24 
UNION 
SELECT 'Avg Age (Days)',
SUM(a.age)/86400.0/Count(a.row_key)
FROM ldb.f_change_task a 
JOIN ldb.d_change_task b ON a.change_task_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
Where d.lagging_count_of_month between 0 and 24 
UNION
SELECT 'Avg Approval Duration (Days)',
SUM(a.approval_duration)/86400.0/Count(a.row_key)
FROM ldb.f_change_task a 
JOIN ldb.d_change_task b ON a.change_task_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
JOIN ldb.d_change_task_approval z ON b.approval_src_key=z.row_key
Where d.lagging_count_of_month between 0 and 24 
UNION 
SELECT 'Avg Overdue Duration (Days)',
SUM(a.overdue_duration)/86400.0/Count(a.row_key)
FROM ldb.f_change_task a 
JOIN ldb.d_change_task b ON a.change_task_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
JOIN ldb.d_change_task_approval z ON b.approval_src_key=z.row_key
Where b.overdue_flag='Y'
AND d.lagging_count_of_month between 0 and 24 
UNION 
SELECT 'Avg Reassignment Count',
SUM(a.reassignment_count)/Count(a.row_key)
FROM ldb.f_change_task a 
JOIN ldb.d_change_task b ON a.change_task_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
JOIN ldb.d_change_task_approval z ON b.approval_src_key=z.row_key
Where d.lagging_count_of_month between 0 and 24 
UNION 
SELECT 'Avg Time Worked (Days)',
SUM(a.time_worked)/86400.0/Count(a.row_key)
FROM ldb.f_change_task a 
JOIN ldb.d_change_task b ON a.change_task_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
JOIN ldb.d_change_task_approval z ON b.approval_src_key=z.row_key
Where d.lagging_count_of_month between 0 and 24 
UNION 
SELECT 'Avg Update Count',
SUM(a.update_count)/Count(a.row_key)
FROM ldb.f_change_task a 
JOIN ldb.d_change_task b ON a.change_task_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
JOIN ldb.d_change_task_approval z ON b.approval_src_key=z.row_key
Where d.lagging_count_of_month between 0 and 24 
UNION 
SELECT 'Business Duration (Days)',
SUM(a.business_duration)/86400.0
FROM ldb.f_change_task a 
JOIN ldb.d_change_task b ON a.change_task_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
JOIN ldb.d_change_task_approval z ON b.approval_src_key=z.row_key
Where d.lagging_count_of_month between 0 and 24 
UNION 
SELECT 'Change Task Backlog',
Count(a.row_key)
FROM ldb.f_change_task a 
JOIN ldb.d_change_task b ON a.change_task_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
JOIN ldb.d_change_task_approval z ON b.approval_src_key=z.row_key
Where d.lagging_count_of_month between 0 and 24 
AND b.backlog_flag='Y'
UNION 
SELECT 'Closed Change Tasks',
Count(a.row_key)
FROM ldb.f_change_task_closed a 
JOIN ldb.d_change_task b ON a.change_task_key=b.row_key
JOIN ldb.d_calendar_date c ON a.closed_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
Where d.lagging_count_of_month between 0 and 24 	
UNION 
SELECT 'Open To Close Duration (Days)',
SUM(a.open_to_close_duration)/86400.0
FROM ldb.f_change_task_closed a 
JOIN ldb.d_change_task b ON a.change_task_key=b.row_key
JOIN ldb.d_calendar_date c ON a.closed_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
Where d.lagging_count_of_month between 0 and 24 
UNION 
SELECT 'Mean Open to Close Duration (Days)',
SUM(a.open_to_close_duration)/86400.0/Count(a.row_key)
FROM ldb.f_change_task_closed a 
JOIN ldb.d_change_task b ON a.change_task_key=b.row_key
JOIN ldb.d_calendar_date c ON a.closed_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
Where d.lagging_count_of_month between 0 and 24 
UNION 
SELECT 'Opened Change Tasks',
Count(a.row_key)
FROM ldb.f_change_task a 
JOIN ldb.d_change_task b ON a.change_task_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
Where d.lagging_count_of_month between 0 and 24 
UNION 
SELECT 'Overdue Change Tasks',
Count(a.row_key)
FROM ldb.f_change_task a 
JOIN ldb.d_change_task b ON a.change_task_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
Where d.lagging_count_of_month between 0 and 24 
AND b.overdue_flag='Y'
UNION 
SELECT 
'Reassignment Count',SUM(a.reassignment_count)
FROM ldb.f_change_task a 
JOIN ldb.d_change_task b ON a.change_task_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
Where d.lagging_count_of_month between 0 and 24 
UNION 
SELECT 'Update Count',
SUM(a.update_count)
FROM ldb.f_change_task a 
JOIN ldb.d_change_task b ON a.change_task_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
Where d.lagging_count_of_month between 0 and 24 
order by 1