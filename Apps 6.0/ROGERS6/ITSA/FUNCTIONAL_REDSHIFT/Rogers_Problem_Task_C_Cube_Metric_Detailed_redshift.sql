SELECT 'Age of Parent at Problem Task Closure (Days)',
SUM(a.parent_age_at_task_closure)/86400.0
FROM ldb.f_problem_task_closed a 
JOIN ldb.d_calendar_date b ON a.closed_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
WHERE c.lagging_count_of_month between 0 and 24
UNION 
SELECT 'Age of Parent at Problem Task Open (Days)',
SUM(a.parent_age_at_task_open)/86400.0
FROM ldb.f_problem_task a 
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
WHERE c.lagging_count_of_month between 0 and 23 
UNION 
SELECT 'Avg  Update Count',
SUM(a.update_count)/Count(a.row_key)/1 as Avg_Update_Count
FROM ldb.f_problem_task a 
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
WHERE c.lagging_count_of_month between 0 and 23 
UNION 
SELECT 'Avg Age (Days)',
SUM(a.age)/86400.0/Count(a.row_key)
FROM ldb.f_problem_task a 
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
WHERE c.lagging_count_of_month between 0 and 23 
UNION 
SELECT 
'Avg Days since Last Update',
(sum(a.dormancy_age)/86400.0)/count(a.row_key) as Avg_Days_Since_Last_Update
FROM ldb.f_problem a 
join ldb.d_problem d
on a.problem_key=d.row_key
JOIN ldb.d_calendar_date b 
ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c
ON b.month_start_date_key = c.row_key
where d.backlog_flag ='Y'
and c.lagging_count_of_month between 0 and 23 
UNION  
SELECT 'Avg Overdue Duration (Days)',a.X/b.Y AS Avg_Overdue_Duration_Days
FROM 
(
SELECT SUM(a.overdue_duration)/86400.00*1.00 as X 
FROM ldb.f_problem_task a 
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
WHERE c.lagging_count_of_month between 0 and 23 
) a
CROSS JOIN 
(
SELECT Count(a.row_key)*1.0 as Y
FROM ldb.f_problem_task a 
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
JOIN ldb.d_problem_task d ON a.problem_task_key=d.row_key
WHERE d.over_due_flag='Y'
AND c.lagging_count_of_month between 0 and 23 
) b 
UNION 
SELECT  'Avg Reassignment Count',
SUM(a.reassignment_count)/count(a.row_key) as Avg_#_of_Reassignments
FROM ldb.f_problem_task a 
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
JOIN ldb.d_problem_task d ON a.problem_task_key=d.row_key
WHERE c.lagging_count_of_month between 0 and 23 
UNION 
SELECT 'Avg Time Worked (Days)', SUM(a.time_worked)/86400.0/count(a.row_key)
FROM ldb.f_problem_task_closed a 
JOIN ldb.d_calendar_date b ON a.closed_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
JOIN ldb.d_problem_task d ON a.problem_task_key=d.row_key
WHERE c.lagging_count_of_month between 0 and 23 
UNION 
SELECT 'Business Duration (Days)',SUM(a.business_duration)/86400.00
FROM ldb.f_problem_task_closed a 
JOIN ldb.d_calendar_date b ON a.closed_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
JOIN ldb.d_problem_task d ON a.problem_task_key=d.row_key
WHERE c.lagging_count_of_month between 0 and 23 
UNION 
SELECT 'Closed Problem Tasks', COUNT(a.row_key)
FROM ldb.f_problem_task_closed a 
JOIN ldb.d_calendar_date b ON a.closed_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
JOIN ldb.d_problem_task d ON a.problem_task_key=d.row_key
WHERE c.lagging_count_of_month between 0 and 23 
UNION 
SELECT 'Days since Last Update',SUM(a.dormancy_age)/86400.0 
FROM ldb.f_problem_task a 
JOIN ldb.d_problem_task b ON a.problem_task_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
WHERE b.dormant_flag='Y' AND d.lagging_count_of_month between 0 and 23
UNION 
SELECT 'Mean Open to Close Duration (Days)',SUM(a.open_to_close_duration)/86400.0/Count(a.row_key)
FROM ldb.f_problem_task_closed a 
JOIN ldb.d_calendar_date b ON a.closed_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
JOIN ldb.d_problem_task d ON a.problem_task_key=d.row_key
WHERE c.lagging_count_of_month between 0 and 23 
UNION 
SELECT 'Open To Close Duration (Days)',SUM(a.open_to_close_duration)/86400.0
FROM ldb.f_problem_task_closed a 
JOIN ldb.d_calendar_date b ON a.closed_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
JOIN ldb.d_problem_task d ON a.problem_task_key=d.row_key
WHERE c.lagging_count_of_month between 0 and 23 
UNION 
SELECT 'Opened Problem Tasks',Count(a.row_key)
FROM ldb.f_problem_task a 
JOIN ldb.d_problem_task b ON a.problem_task_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
WHERE d.lagging_count_of_month between 0 and 23
UNION 
SELECT 'Overdue Problem Tasks',count(a.row_key)
FROM ldb.f_problem_task a 
JOIN ldb.d_problem_task b ON a.problem_task_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
WHERE b.over_due_flag='Y'
AND d.lagging_count_of_month between 0 and 23
UNION 
SELECT 'Problem Task Backlog',count(a.row_key)
FROM ldb.f_problem_task a 
JOIN ldb.d_problem_task b ON a.problem_task_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
WHERE b.backlog_flag='Y'
AND d.lagging_count_of_month between 0 and 23
UNION 
SELECT 'Reassignment Count',SUM(a.reassignment_count)
FROM ldb.f_problem_task a 
JOIN ldb.d_problem_task b ON a.problem_task_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
WHERE  d.lagging_count_of_month between 0 and 23
UNION 
SELECT  'Avg Approval Duration (Days)',SUM(a.approval_duration)/86400.00
FROM ldb.f_problem_task a 
JOIN ldb.d_problem_task b ON a.problem_task_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
JOIN ldb.d_problem_task_approval x ON a.approval_src_key=x.row_key
WHERE d.lagging_count_of_month between 0 and 23
Order by 1