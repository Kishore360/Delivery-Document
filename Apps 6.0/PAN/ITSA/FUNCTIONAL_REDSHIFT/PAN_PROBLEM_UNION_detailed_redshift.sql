SELECT 'ALL Problem Tasks count',sum(a.problem_tasks_count) as value
FROM ldb.f_problem a 
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key

UNION
select'Avg Reassignments'as metrics,value/ bb.cnt from 
(SELECT sum(a.reassignment_count)*1.0 as value
FROM ldb.f_problem  a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key)a 
cross join 
(select count(1) cnt FROM ldb.f_problem  a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key)bb
 
union
select'Avg Linked Incidents'as metrics,(value1/ bb.cnt)  as value from 
(SELECT sum(a.linked_incident_count)*1.0 as value1
FROM ldb.f_problem  a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key)a 
cross join 
(select count(1) cnt FROM ldb.f_problem  a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key)bb
 
union
select	'Avg Age (Days)' as metrics,	(sum((a11.age / 86400.0))/count(a11.row_key)) AS value
from	ldb.f_problem	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)

union
SELECT 'Avg Open To CLose Duration (Days)',sum(a.open_to_close_duration)/86400.0/count(a.row_key) as value
FROM ldb.f_problem_closed a 
JOIN ldb.d_calendar_date b ON a.closed_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key

UNION 
SELECT 'Closed Problems' as metrics,count(a.row_key) as value
FROM ldb.f_problem_closed a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.closed_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key

UNION 
SELECT 'Closed Problems Met SLA' as metrics,count(a.row_key) as value
FROM ldb.f_problem_closed a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.closed_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where b.met_sla_flag='Y'
union
SELECT 'Closed Problems Met ALL SLA%' as metrics,(value1/value2)*100.0 as value from
(select count(a.row_key) as value1
FROM ldb.f_problem_closed a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.closed_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where b.met_sla_flag='Y')a
cross join 
(select count(a.row_key) as value2
FROM ldb.f_problem_closed a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.closed_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
)b


UNION 
SELECT 'Closed Problems Missed SLA' as metrics,count(a.row_key) as value
FROM ldb.f_problem_closed a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.closed_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
 
and  b.met_sla_flag='N'
UNION 
SELECT 'Dormant Problems'as metrics,count(a.row_key) as value
FROM ldb.f_problem a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where b.dormant_flag='Y' 
UNION 
SELECT 'Known Errors' as metrics,count(a.row_key) as value
FROM ldb.f_problem a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
 
AND  b.known_error_flag='Y'
UNION 
SELECT 'Opened Problems' as metrics,count(a.row_key) as value
FROM ldb.f_problem a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
 
UNION 
SELECT 'Overdue Problems' as metrics,count(a.row_key) as value
from ldb.f_problem a 
join ldb.d_problem d on a.problem_key=d.row_key
join ldb.d_calendar_date b on a.opened_on_key = b.row_key 
join ldb.d_calendar_month c on b.month_start_date_key = c.row_key 
where d.over_due_flag='Y'

UNION 
SELECT 'Overdue Problems Percent' as metrics,a.x/b.Y *100 as value FROM 
(SELECT 
count(a.row_key)*1.0 as X
from ldb.f_problem a 
join ldb.d_problem d on a.problem_key=d.row_key
join ldb.d_calendar_date b on a.opened_on_key = b.row_key 
join ldb.d_calendar_month c on b.month_start_date_key = c.row_key 
where d.over_due_flag='Y'
) a 
CROSS JOIN
(
SELECT 
count(a.row_key) as Y
from ldb.f_problem a 
join ldb.d_problem d on a.problem_key=d.row_key
join ldb.d_calendar_date b on a.opened_on_key = b.row_key 
join ldb.d_calendar_month c on b.month_start_date_key = c.row_key 

)b 
UNION 
SELECT 'Priority Escalated Problems' as metrics,count(a.row_key) as value
FROM ldb.f_problem a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
 
AND b.priority_escalated_flag='Y'
UNION
SELECT 'Problem Backlog' as metrics,count(a.row_key) as value
FROM ldb.f_problem a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
 
AND b.backlog_flag='Y'
UNION
SELECT 'Problem Backlog Met ALL SLAs' as metrics,count(a.row_key) as value
FROM ldb.f_problem a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
AND b.backlog_flag='Y' and met_sla_flag='Y'
UNION
SELECT 'Problem Backlog Missed Any SLA' as metrics,count(a.row_key) as value
FROM ldb.f_problem a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
AND b.backlog_flag='Y' and  met_sla_flag='N'
UNION 
SELECT 'Problems Generating Knowledge' as metrics,count(a.row_key) as value
FROM ldb.f_problem a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
 
AND b.knowledge_flag='Y'
UNION 
SELECT 'Problems Pending Change' as metrics,count(a.row_key) as value
FROM ldb.f_problem a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
 
AND b.change_flag='Y'
UNION 
SELECT 'Reassignment count' as metrics,sum(b.reassignment_count) as value
FROM ldb.f_problem a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
AND b.reassignment_count>0
UNION
SELECT 'Problems Removed by Change' as metrics,count(a.row_key) as value
FROM ldb.f_problem_closed a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.closed_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
 
AND b.change_flag='Y'


UNION 
SELECT 'Related Incidents' as metrics,sum(a.linked_incident_count) as value
FROM ldb.f_problem  a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
union
SELECT 'Days since Last Update'as metrics,sum(a.dormancy_age)/86400.0 as value
FROM ldb.f_problem a 
join ldb.d_problem d
on a.problem_key=d.row_key
JOIN ldb.d_calendar_date b 
ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c
ON b.month_start_date_key = c.row_key
where d.backlog_flag ='Y'
union
SELECT 'AVG Days since Last Update' as metrics,avg(a.dormancy_age)/86400.0 as value
FROM ldb.f_problem a 
join ldb.d_problem d
on a.problem_key=d.row_key
JOIN ldb.d_calendar_date b 
ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c
ON b.month_start_date_key = c.row_key
where d.backlog_flag ='Y'
