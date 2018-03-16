-- AVG OPEN TO CLOSE DURATION-- should come only from closed fact but is also coming from opened fact --
-- PROBLEMS RESOLVED BY CHANGE-- should come only from closed fact but is also coming from opened fact --
-- ALL PROBLEM TASKS COUNT AND AVG METRIC IS DIRECTLY AVG ()?

SELECT  '% of Closed Problems Met SLA' as metrics,(count(xyz.x)/count(abc.ab))*100.0 as value from 
(select count(1) x
FROM ldb.f_problem_resolved a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.closed_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where  b.met_sla_flag='Y')xyz
cross join 
(select count(1) ab
 FROM ldb.f_problem_resolved a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.closed_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
) abc 
union

SELECT 'Actual Outage Time (Days)' as metrics,sum(a.actual_outage_time_c)/86400.00 AS value
FROM ldb.f_problem a 
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
 

union
SELECT 'ALL Problem Tasks count'as metrics,sum(a.problem_tasks_count)AS value
FROM ldb.f_problem a 
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key

UNION
SELECT 'Avg # of Reassignments' as metrics,Avg(a.reassignment_count*1.0) as value
FROM ldb.f_problem  a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
 
union
SELECT 'Avg # of Related Incidents'as metrics,avg(a.linked_incident_count*1.0) as value
FROM ldb.f_problem  a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key

union
select	'Avg Age' as metrics,	(sum((a11.age / 86400.0))/count(a11.row_key)) AS value
from	ldb.f_problem	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)

union
SELECT 'Avg Open To CLose Duration Days' as metrics,sum(a.open_to_close_duration/86400.0)/count(a.row_key)AS value
FROM ldb.f_problem_resolved a 
JOIN ldb.d_calendar_date b ON a.closed_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key

UNION 
SELECT 'Closed Problems'as metrics,count(a.row_key) as  value
FROM ldb.f_problem_resolved a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.closed_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key

UNION 
SELECT 'Closed Problems Met SLA'as metrics,count(a.row_key) as value
FROM ldb.f_problem_resolved a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.closed_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where b.met_sla_flag='Y'

UNION 
SELECT 'Closed Problems Missed SLA'as metrics,count(a.row_key) as value
FROM ldb.f_problem_resolved a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.closed_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
 
where  b.met_sla_flag='N'
UNION 
SELECT 'Dormant Problems'as metrics,count(a.row_key) as value
FROM ldb.f_problem a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where b.dormant_flag='Y' 
-- UNION duration(days) prob needs to renamed as open to close duration
union
SELECT 'Known Errors'as metrics,count(a.row_key) as value
FROM ldb.f_problem a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
 
where  b.known_error_flag='Y'
UNION 
SELECT 'Opened Problems Met SLA'as metrics,count(a.row_key) as value
FROM ldb.f_problem a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
join	ldb.d_problem_state	a14 on 	(a.state_src_key = a14.row_key)
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where a14.wh_dimension_code = 'OPEN' and met_sla_flag='Y' 
UNION 
SELECT 'Opened Problems Missed SLA'as metrics,count(a.row_key) as value
FROM ldb.f_problem a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where met_sla_flag='N' 
UNION 
SELECT 'Opened Problems'as metrics,count(a.row_key) as value
FROM ldb.f_problem a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
 
UNION 
SELECT 
'Overdue Problems'as metrics,
count(a.row_key) as value
from ldb.f_problem a 
join ldb.d_problem d on a.problem_key=d.row_key
join ldb.d_calendar_date b on a.opened_on_key = b.row_key 
join ldb.d_calendar_month c on b.month_start_date_key = c.row_key 
where d.over_due_flag='Y'

UNION 
SELECT 'Overdue Problems Percent'as metrics,a.x/b.Y *100 as value FROM 
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
count(a.row_key)*1.0 as Y
from ldb.f_problem a 
join ldb.d_problem d on a.problem_key=d.row_key
join ldb.d_calendar_date b on a.opened_on_key = b.row_key 
join ldb.d_calendar_month c on b.month_start_date_key = c.row_key 
)b 
UNION 
SELECT 'Priority Escalated Problems'as metrics,count(a.row_key) as value
FROM ldb.f_problem a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
 
where b.priority_escalated_flag='Y'
UNION
SELECT 'Problem Backlog'as metrics,count(a.row_key) as value
FROM ldb.f_problem a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
 
where b.backlog_flag='Y'
UNION 
SELECT 'Problems Generating Knowledge'as metrics,count(a.row_key) as value
FROM ldb.f_problem a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
 
where b.knowledge_flag='Y'
UNION 
SELECT 'Problems Pending Change'as metrics,count(a.row_key) as value
FROM ldb.f_problem a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
 
where b.change_flag='Y'
UNION 
SELECT 'Problems Reassigned'as metrics,count(a.row_key) as value
FROM ldb.f_problem a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
 
where a.reassignment_count>0
UNION
SELECT 'Problems Resolved by Change' as metrics,count(a.row_key) as value
FROM ldb.f_problem_resolved a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.closed_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where  b.change_flag='Y'
UNION

SELECT 'Problems Without Related Incidents'as metrics,count(a.row_key) as value
from ldb.f_problem a 
join ldb.d_problem d
on a.problem_key=d.row_key
join ldb.d_calendar_date b 
on a.opened_on_key = b.row_key 
join ldb.d_calendar_month c 
on b.month_start_date_key = c.row_key 
where d.linked_incident_flag='N'

UNION 
SELECT 'Related Incidents'as metrics,sum(a.linked_incident_count) as value
FROM ldb.f_problem  a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
