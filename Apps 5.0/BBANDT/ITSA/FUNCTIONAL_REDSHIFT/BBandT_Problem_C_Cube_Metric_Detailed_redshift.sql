SELECT 'All Problem Tasks',Count(a.problem_tasks_count)
FROM ldb.f_problem a 
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
where c.lagging_count_of_month between 0 and 24
UNION 
SELECT 'Avg # of Reassignments',Avg(a.reassignment_count)*1.0 as Avg_Reassignments
FROM ldb.f_problem  a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where d.lagging_count_of_month between 0 and 24 
UNION 
SELECT 'Avg # of Related Incidents',
SUM(a.linked_incident_count)/Count(a.row_key)*1.0 as Avg_related_incidents
FROM ldb.f_problem  a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where d.lagging_count_of_month between 0 and 24 
UNION 
SELECT 
'Avg Age',
(SUM(a.age)/86400.0/count(a.row_key)) as Avg_of_Problems_Age_Days
FROM ldb.f_problem a 
JOIN ldb.d_calendar_date b 
ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c
ON b.month_start_date_key = c.row_key
where c.lagging_count_of_month between 0 and 24
UNION 
SELECT 'Avg Open to Close Duration ',sum(a.open_to_close_duration)/86400.0/count(a.row_key)
FROM ldb.f_problem_closed a 
JOIN ldb.d_calendar_date b ON a.closed_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
where c.lagging_count_of_month between 0 and 24
UNION 
SELECT 'Closed Problems',count(a.row_key) as Closed_Problems
FROM ldb.f_problem_closed a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.closed_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where d.lagging_count_of_month between 0 and 24
UNION 
SELECT 'Closed Problems Met SLA',count(a.row_key) as Closed_Problems_Met_SLA
FROM ldb.f_problem_closed a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.closed_on_key=b.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where (b.met_sla_flag='Y'
AND d.lagging_count_of_month between 0 and 24 )
UNION 
SELECT 'Closed Problems Missed SLA',count(a.row_key) as Closed_Problems_Missed_SLA
FROM ldb.f_problem_closed a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.closed_on_key=b.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where (b.met_sla_flag='N'
AND d.lagging_count_of_month between 0 and 24 )
UNION
SELECT 'Dormant Problems',count(a.row_key) as Dormant_Problems
FROM ldb.f_problem a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where b.dormant_flag='Y' AND d.lagging_count_of_month between 0 and 24
UNION 
SELECT 'Incident to Problem Closed Duration',
SUM(a.inci_to_prob_closed_duration_c)/3600.0 *1.0 as Incident_problem_closed_duration
FROM ldb.f_problem  a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where d.lagging_count_of_month between 0 and 24 
UNION 
SELECT 'Incident to Problem Created Duration',
SUM(a.inci_to_prob_created_duration_c)/3600.0 *1.0 as inci_to_prob_created_duration_c
FROM ldb.f_problem  a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where d.lagging_count_of_month between 0 and 24 
UNION 
SELECT 'Known Errors',count(a.row_key) as Known_Errors
FROM ldb.f_problem a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where b.known_error_flag='Y' AND d.lagging_count_of_month between 0 and 24
UNION 
SELECT 'Open Problems Met SLA',count(a.row_key) as Open_Problems_met_SLA
FROM ldb.f_problem a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
JOIN ldb.d_problem_state e ON a.state_src_key=e.row_key
where e.source_dimension_name IN ('Open','Known Error')
AND b.met_sla_flag='Y'
AND d.lagging_count_of_month between 0 and 24
UNION 
SELECT 'Open Problems Missed SLA',count(a.row_key) as Open_Problems_Missed_SLA
FROM ldb.f_problem a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
JOIN ldb.d_problem_state e ON a.state_src_key=e.row_key
where e.source_dimension_name IN ('Open','Known Error')
AND b.met_sla_flag='N'
AND d.lagging_count_of_month between 0 and 24
UNION 
SELECT 'Opened Problems',count(a.row_key) as Opened_Problems
FROM ldb.f_problem a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where d.lagging_count_of_month between 0 and 24
UNION 
SELECT 
'Overdue Problems',
count(a.row_key) as Overdue_Problems
from ldb.f_problem a 
join ldb.d_problem d on a.problem_key=d.row_key
join ldb.d_calendar_date b on a.opened_on_key = b.row_key 
join ldb.d_calendar_month c on b.month_start_date_key = c.row_key 
where d.over_due_flag='Y'
and c.lagging_count_of_month between 0 and 24
UNION 
SELECT 'Overdue Problems %',a.x/b.Y *100 FROM 
(SELECT 
count(a.row_key)*1.0 as X
from ldb.f_problem a 
join ldb.d_problem d on a.problem_key=d.row_key
join ldb.d_calendar_date b on a.opened_on_key = b.row_key 
join ldb.d_calendar_month c on b.month_start_date_key = c.row_key 
where d.over_due_flag='Y'
and c.lagging_count_of_month between 0 and 24) a 
CROSS JOIN
(
SELECT 
count(a.row_key) as Y
from ldb.f_problem a 
join ldb.d_problem d on a.problem_key=d.row_key
join ldb.d_calendar_date b on a.opened_on_key = b.row_key 
join ldb.d_calendar_month c on b.month_start_date_key = c.row_key 
where  c.lagging_count_of_month between 0 and 24
)b 
UNION 
SELECT 'Priority Escalated Problems',
count(a.row_key) as Priority_Escalated_Problems
FROM ldb.f_problem a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where b.priority_escalated_flag='Y' AND d.lagging_count_of_month between 0 and 24 
UNION 
SELECT 'Problem Backlog',count(a.row_key) as Problem_Backlog
FROM ldb.f_problem a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where b.backlog_flag='Y' AND d.lagging_count_of_month between 0 and 24 
UNION 
SELECT 'Problems Generating Knowledge',count(a.row_key) as Problems_Generating_Knowledge
FROM ldb.f_problem a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where b.knowledge_flag='Y' AND d.lagging_count_of_month between 0 and 24
UNION 
SELECT 'Problems Pending Change',count(a.row_key) as Problems_Pending_Change
FROM ldb.f_problem a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where b.change_flag='Y'AND d.lagging_count_of_month between 0 and 24 
UNION 
SELECT 'Problems Reassigned',SUM(a.reassignment_count)
FROM ldb.f_problem a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where  d.lagging_count_of_month between 0 and 24
UNION 
SELECT 'Problems Removed by Change',count(a.row_key) as Problems_Removed_by_Change
FROM ldb.f_problem_closed a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.closed_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where b.change_flag='Y' AND d.lagging_count_of_month between 0 and 24
UNION 
SELECT 'Problems without Related Incidents',Count(a.row_key)
FROM ldb.f_problem a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where  b.linked_incident_flag='N'
AND d.lagging_count_of_month between 0 and 24
UNION 
SELECT 'Related Incidents',sum(a.linked_incident_count) as Related_Incidents
FROM ldb.f_problem  a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where d.lagging_count_of_month between 0 and 24
ORDER BY 1
