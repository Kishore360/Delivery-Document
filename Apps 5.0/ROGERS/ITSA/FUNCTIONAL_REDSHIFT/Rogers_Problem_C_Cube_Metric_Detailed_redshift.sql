SELECT 'All Problem Tasks',Count(a.problem_tasks_count)
FROM ldb.f_problem a 
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
where c.lagging_count_of_month between 0 and 23
UNION 
SELECT 
'Avg Age (Days)',
(SUM(a.age)/86400.0/count(a.row_key)) as Avg_of_Problems_Age_Days
FROM ldb.f_problem a 
JOIN ldb.d_calendar_date b 
ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c
ON b.month_start_date_key = c.row_key
where c.lagging_count_of_month between 0 and 23
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
SELECT 'Avg Linked Incidents',a.X/b.Y*100.0 AS Avg_Linked_incidents FROM 
(SELECT sum(a.linked_incident_count)*1.0 as X 
FROM ldb.f_problem a 
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
where c.lagging_count_of_month between 0 and 23) a 
CROSS JOIN  
(
SELECT sum(a.row_key)*1.0 as Y 
FROM ldb.f_problem a 
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
where c.lagging_count_of_month between 0 and 23
) b 
UNION 
SELECT 'Avg Open to Close Duration (Days)',sum(a.open_to_close_duration)/86400.0/count(a.row_key)
FROM ldb.f_problem_closed a 
JOIN ldb.d_calendar_date b ON a.closed_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
where c.lagging_count_of_month between 0 and 23
UNION 
SELECT 'Avg Reassignments',Avg(a.reassignment_count) as Avg_Reassignments
FROM ldb.f_problem  a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where d.lagging_count_of_month between 0 and 23 
UNION 
SELECT 'Closed Problems',count(a.row_key) as Closed_Problems
FROM ldb.f_problem_closed a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.closed_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where d.lagging_count_of_month between 0 and 23
UNION 
SELECT 'Closed Problems Met SLA',count(a.row_key) as Closed_Problems_Met_SLA
FROM ldb.f_problem_closed a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.closed_on_key=b.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where (b.met_sla_flag='Y'
AND d.lagging_count_of_month between 0 and 23 )
UNION 
SELECT 'Closed Problems Missed SLA',count(a.row_key) as Closed_Problems_Missed_SLA
FROM ldb.f_problem_closed a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.closed_on_key=b.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where (b.met_sla_flag='N'
AND d.lagging_count_of_month between 0 and 23 )
UNION 
SELECT 'Closed Problems Met All SLAs %',a.X/b.Y*100.0 AS Closed_Problems_Met_All_SLAsPercentage
FROM 
(
SELECT count(a.row_key)*1.0 as X 
FROM ldb.f_problem_closed a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.closed_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where (b.met_sla_flag='Y'
AND d.lagging_count_of_month between 0 and 23 )
) a 
CROSS JOIN 
(
SELECT count(a.row_key)*1.0 as Y 
FROM ldb.f_problem_closed a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.closed_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where ( d.lagging_count_of_month between 0 and 23 )
) b 
UNION 
SELECT 
'Days since Last Update',
sum(a.dormancy_age)/86400.0 as Problems_Days_Since_Last_Update
FROM ldb.f_problem a 
join ldb.d_problem d on a.problem_key=d.row_key
JOIN ldb.d_calendar_date b  ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key = c.row_key
where d.backlog_flag ='Y' and c.lagging_count_of_month between 0 and 23
UNION 
SELECT 'Dormant Problems',count(a.row_key) as Dormant_Problems
FROM ldb.f_problem a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where b.dormant_flag='Y' AND d.lagging_count_of_month between 0 and 23
UNION 
SELECT 'Incident MI Duration (Hours)',sum(a.client_duration_c)/3600.00
FROM ldb.f_problem a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where d.lagging_count_of_month between 0 and 23 
UNION 
SELECT 'Known Errors',count(a.row_key) as Known_Errors
FROM ldb.f_problem a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where b.known_error_flag='Y' AND d.lagging_count_of_month between 0 and 23
UNION 
SELECT 'Opened Problems',count(a.row_key) as Opened_Problems
FROM ldb.f_problem a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where d.lagging_count_of_month between 0 and 23
UNION 
SELECT 
'Overdue Problems',
count(a.row_key) as Overdue_Problems
from ldb.f_problem a 
join ldb.d_problem d on a.problem_key=d.row_key
join ldb.d_calendar_date b on a.opened_on_key = b.row_key 
join ldb.d_calendar_month c on b.month_start_date_key = c.row_key 
where d.over_due_flag='Y'
and c.lagging_count_of_month between 0 and 23
UNION 
SELECT 'Overdue Problems %',a.x/b.Y *100 FROM 
(SELECT 
count(a.row_key)*1.0 as X
from ldb.f_problem a 
join ldb.d_problem d on a.problem_key=d.row_key
join ldb.d_calendar_date b on a.opened_on_key = b.row_key 
join ldb.d_calendar_month c on b.month_start_date_key = c.row_key 
where d.over_due_flag='Y'
and c.lagging_count_of_month between 0 and 23) a 
CROSS JOIN
(
SELECT 
count(a.row_key) as Y
from ldb.f_problem a 
join ldb.d_problem d on a.problem_key=d.row_key
join ldb.d_calendar_date b on a.opened_on_key = b.row_key 
join ldb.d_calendar_month c on b.month_start_date_key = c.row_key 
where  c.lagging_count_of_month between 0 and 23
)b 
UNION 
SELECT 'Priority Escalated Problems',
count(a.row_key) as Priority_Escalated_Problems
FROM ldb.f_problem a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where b.priority_escalated_flag='Y' AND d.lagging_count_of_month between 0 and 23 
UNION 
SELECT 'Problem Backlog',count(a.row_key) as Problem_Backlog
FROM ldb.f_problem a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where b.backlog_flag='Y' AND d.lagging_count_of_month between 0 and 23  
UNION 
SELECT 'Problem Backlog Met All SLAs',count(a.row_key) as Problem_Backlog_Met_All_SLAs
FROM ldb.f_problem a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where b.backlog_flag='Y' AND b.met_sla_flag='Y' AND d.lagging_count_of_month between 0 and 23 
UNION 
SELECT 'Problem Backlog Missed Any SLA',count(a.row_key) as Problem_Backlog_Missed_All_SLAs
FROM ldb.f_problem a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where b.backlog_flag='Y' AND b.met_sla_flag='N' AND d.lagging_count_of_month between 0 and 23 
UNION 
SELECT 'Problems Generating Knowledge',count(a.row_key) as Problems_Generating_Knowledge
FROM ldb.f_problem a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where b.knowledge_flag='Y' AND d.lagging_count_of_month between 0 and 23
UNION 
SELECT 'Problems Pending Change',count(a.row_key) as Problems_Pending_Change
FROM ldb.f_problem a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where b.change_flag='Y'AND d.lagging_count_of_month between 0 and 23 
UNION 
SELECT 'Problems Removed by Change',count(a.row_key) as Problems_Removed_by_Change
FROM ldb.f_problem_closed a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.closed_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where b.change_flag='Y' AND d.lagging_count_of_month between 0 and 23
UNION 
SELECT 'RCA Business Days',SUM(a.rca_business_days_c)/86400.0 
FROM ldb.f_problem a 
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
Where c.lagging_count_of_month between 0 and 23
UNION 
SELECT 'RCA Duration Business Days',SUM(a.rca_duration_c)/86400.0 
FROM ldb.f_problem a 
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
Where c.lagging_count_of_month between 0 and 23
UNION 
SELECT 'RCA Duration Calendar Days',SUM(a.rca_pending_calendar_days_c)/86400.0 
FROM ldb.f_problem a 
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
Where c.lagging_count_of_month between 0 and 23
UNION
SELECT 'Reassignment_Count',
SUM(a.reassignment_count) as Reassignment_Count
from ldb.f_problem a 
join ldb.d_problem d on a.problem_key=d.row_key
join ldb.d_calendar_date b on a.opened_on_key = b.row_key 
join ldb.d_calendar_month c on b.month_start_date_key = c.row_key 
where  c.lagging_count_of_month between 0 and 23
UNION 
SELECT 'Related Incidents',sum(a.linked_incident_count) as Related_Incidents
FROM ldb.f_problem  a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where d.lagging_count_of_month between 0 and 23
ORDER BY 1





