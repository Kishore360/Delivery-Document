SELECT '% of Closed Problems Met SLA',(abc/xyz)*100.0 from 
(select	count(a11.row_key)*1.0 AS abc
from	ldb.f_problem_closed	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.closed_on_key = a12.row_key)
	join	ldb.d_problem	a13
	  on 	(a11.problem_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.met_sla_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 11) )a
cross join 
( select	count(a11.row_key)*1.0 AS xyz
from	ldb.f_problem_closed	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.closed_on_key = a12.row_key)
	join	ldb.d_problem	a13
	  on 	(a11.problem_key = a13.row_key)
	join	ldb.d_problem_state	a14
	  on 	(a13.state_src_key = a14.row_key)
	join	ldb.d_calendar_month	a15
	  on 	(a12.month_start_date_key = a15.row_key)
where	(a15.lagging_count_of_month between 0 and 11
 or a14.wh_dimension_code = 'open') )b
 union
 select	'Acknowledged (Min)',sum((a11.open_to_acknowledge_duration_c / 60.0)) AS WJXBFS1
from	ldb.f_problem	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_problem	a13
	  on 	(a11.problem_key = a13.row_key)
	join	ldb.d_problem_state	a14
	  on 	(a13.state_src_key = a14.row_key)
	join	ldb.d_calendar_month	a15
	  on 	(a12.month_start_date_key = a15.row_key)
where	(a15.lagging_count_of_month between 0 and 11
 or a14.wh_dimension_code = 'OPEN')
 union
 SELECT 'Avg # of Reassignments',(sum(a11.reassignment_count)*1.0/count(a11.row_key))*1.0 AS WJXBFS1
from	ldb.f_problem	a11
join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_problem	a13
	  on 	(a11.problem_key = a13.row_key)
	join	ldb.d_problem_state	a14
	  on 	(a13.state_src_key = a14.row_key)
	join	ldb.d_calendar_month	a15
	  on 	(a12.month_start_date_key = a15.row_key)
where	(a15.lagging_count_of_month between 0 and 11
 or a14.wh_dimension_code = 'OPEN')
union
SELECT 'Avg # of Related Incidents',coalesce((sum(a11.linked_incident_count)*1.0/count(a11.row_key))*1.0,0)
from	ldb.f_problem	a11
join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_problem	a13
	  on 	(a11.problem_key = a13.row_key)
	join	ldb.d_problem_state	a14
	  on 	(a13.state_src_key = a14.row_key)
	join	ldb.d_calendar_month	a15
	  on 	(a12.month_start_date_key = a15.row_key)
where	(a15.lagging_count_of_month between 0 and 11
 or a14.wh_dimension_code = 'OPEN')
 union
 select	'Avg Open to Close Duration',sum((a11.open_to_close_duration / 86400.0)) /	count(a11.row_key) 
from	ldb.f_problem_closed	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.closed_on_key = a12.row_key)
	join	ldb.d_problem	a13
	  on 	(a11.problem_key = a13.row_key)
	join	ldb.d_problem_state	a14
	  on 	(a13.state_src_key = a14.row_key)
	join	ldb.d_calendar_month	a15
	  on 	(a12.month_start_date_key = a15.row_key)
where	(a15.lagging_count_of_month between 0 and 11
 or a14.wh_dimension_code = 'OPEN')
 union
 SELECT 'Closed Problems',count(a11.row_key) as Closed_Problems
FROM ldb.f_problem_closed a11
join	ldb.d_calendar_date	a12
	  on 	(a11.closed_on_key = a12.row_key)
	join	ldb.d_problem	a13
	  on 	(a11.problem_key = a13.row_key)
	join	ldb.d_problem_state	a14
	  on 	(a13.state_src_key = a14.row_key)
	join	ldb.d_calendar_month	a15
	  on 	(a12.month_start_date_key = a15.row_key)
where	(a15.lagging_count_of_month between 0 and 11
 or a14.wh_dimension_code = 'OPEN')
Union
SELECT 'Closed Problems Met SLA',count(a11.row_key) as ABC 
FROM ldb.f_problem_closed a11
join	ldb.d_calendar_date	a12
	  on 	(a11.closed_on_key = a12.row_key)
	join	ldb.d_problem	a13
	  on 	(a11.problem_key = a13.row_key)
	join	ldb.d_problem_state	a14
	  on 	(a13.state_src_key = a14.row_key)
	join	ldb.d_calendar_month	a15
	  on 	(a12.month_start_date_key = a15.row_key)
where	( a13.met_sla_flag='Y' and (a15.lagging_count_of_month between 0 and 11
 or a14.wh_dimension_code = 'OPEN'))
Union
SELECT 'Closed Problems Missed SLA',count(a11.row_key) as ABC 
FROM ldb.f_problem_closed a11
join	ldb.d_calendar_date	a12
	  on 	(a11.closed_on_key = a12.row_key)
	join	ldb.d_problem	a13
	  on 	(a11.problem_key = a13.row_key)
	join	ldb.d_problem_state	a14
	  on 	(a13.state_src_key = a14.row_key)
	join	ldb.d_calendar_month	a15
	  on 	(a12.month_start_date_key = a15.row_key)
where	( a13.met_sla_flag='N'and (a15.lagging_count_of_month between 0 and 11
 or a14.wh_dimension_code = 'OPEN'))
 union
 select	'Days Open',sum((a11.open_days_business_duration_c / 32400.0)) AS WJXBFS1
from	ldb.f_problem	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_problem	a13
	  on 	(a11.problem_key = a13.row_key)
	join	ldb.d_problem_state	a14
	  on 	(a13.state_src_key = a14.row_key)
	join	ldb.d_calendar_month	a15
	  on 	(a12.month_start_date_key = a15.row_key)
where	(a15.lagging_count_of_month between 0 and 11
 or a14.wh_dimension_code = 'open')
 union
 select	'Days to Close',sum((a11.open_to_close_business_duration_c / 32400.0)) AS WJXBFS1
from	ldb.f_problem_closed	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.closed_on_key = a12.row_key)
	join	ldb.d_problem	a13
	  on 	(a11.problem_key = a13.row_key)
	join	ldb.d_problem_state	a14
	  on 	(a13.state_src_key = a14.row_key)
	join	ldb.d_calendar_month	a15
	  on 	(a12.month_start_date_key = a15.row_key)
where	(a15.lagging_count_of_month between 0 and 11
 or a14.wh_dimension_code = 'open')
 union
SELECT 'Dormant Problems',count(a11.row_key) as Dormant_Problems
FROM ldb.f_problem	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_problem	a13
	  on 	(a11.problem_key = a13.row_key)
	join	ldb.d_problem_state	a14
	  on 	(a13.state_src_key = a14.row_key)
	join	ldb.d_calendar_month	a15
	  on 	(a12.month_start_date_key = a15.row_key)
where	(a15.lagging_count_of_month between 0 and 11
 or a14.wh_dimension_code = 'open')
and  a13.dormant_flag='Y'
union
 SELECT 'Known Errors',count(a11.row_key) as Known_Errors
FROM ldb.f_problem	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_problem	a13
	  on 	(a11.problem_key = a13.row_key)
	join	ldb.d_problem_state	a14
	  on 	(a13.state_src_key = a14.row_key)
	join	ldb.d_calendar_month	a15
	  on 	(a12.month_start_date_key = a15.row_key)
where	(a15.lagging_count_of_month between 0 and 11
 or a14.wh_dimension_code = 'open')
and  a13.known_error_flag='Y'
union
SELECT 'Open Problems Met SLA',count(a11.row_key) AS WJXBFS1
from	ldb.f_problem	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_problem	a13
	  on 	(a11.problem_key = a13.row_key)
	join	ldb.d_problem_state	a14
	  on 	(a13.state_src_key = a14.row_key)
	join	ldb.d_calendar_month	a15
	  on 	(a12.month_start_date_key = a15.row_key)
where	(a15.lagging_count_of_month between 0 and 11
 or a14.wh_dimension_code = 'open')
and	(a14.wh_dimension_code = 'OPEN'
 and a13.met_sla_flag = 'Y')
union
SELECT 'Open Problems Missed SLA',count(a11.row_key) AS WJXBFS1
from	ldb.f_problem	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_problem	a13
	  on 	(a11.problem_key = a13.row_key)
	join	ldb.d_problem_state	a14
	  on 	(a13.state_src_key = a14.row_key)
	join	ldb.d_calendar_month	a15
	  on 	(a12.month_start_date_key = a15.row_key)
where	(a15.lagging_count_of_month between 0 and 11
 or a14.wh_dimension_code = 'open')
and	(a14.wh_dimension_code = 'OPEN'
 and a13.met_sla_flag = 'N')
union
SELECT 'Opened Problems',count(a11.row_key) as Opened_Problems
FROM ldb.f_problem	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_problem	a13
	  on 	(a11.problem_key = a13.row_key)
	join	ldb.d_problem_state	a14
	  on 	(a13.state_src_key = a14.row_key)
	join	ldb.d_calendar_month	a15
	  on 	(a12.month_start_date_key = a15.row_key)
where	(a15.lagging_count_of_month between 0 and 11
 or a14.wh_dimension_code = 'open')
union
SELECT 
'Overdue Problems',
count(a11.row_key) as Overdue_Problems
from ldb.f_problem	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_problem	a13
	  on 	(a11.problem_key = a13.row_key)
	join	ldb.d_problem_state	a14
	  on 	(a13.state_src_key = a14.row_key)
	join	ldb.d_calendar_month	a15
	  on 	(a12.month_start_date_key = a15.row_key)
where	(a15.lagging_count_of_month between 0 and 11
 or a14.wh_dimension_code = 'open')
and a13.over_due_flag='Y'
union
SELECT 'Overdue Problems Percent' as metrics,(abc/xyz)*100.00 as value from 
(select	count(a11.row_key)*1.0 AS abc
from	ldb.f_problem	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_problem	a13
	  on 	(a11.problem_key = a13.row_key)
	join	ldb.d_problem_state	a14
	  on 	(a13.state_src_key = a14.row_key)
	join	ldb.d_calendar_month	a15
	  on 	(a12.month_start_date_key = a15.row_key)
where	(a15.lagging_count_of_month between 0 and 11
 or a14.wh_dimension_code = 'open')
and	a13.over_due_flag = 'Y' )a
cross join 
(select	count(a11.row_key) AS xyz
from	ldb.f_problem	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_problem	a13
	  on 	(a11.problem_key = a13.row_key)
	join	ldb.d_problem_state	a14
	  on 	(a13.state_src_key = a14.row_key)
	join	ldb.d_calendar_month	a15
	  on 	(a12.month_start_date_key = a15.row_key)
where	(a15.lagging_count_of_month between 0 and 11
 or a14.wh_dimension_code = 'open')
)b
union
SELECT 'Priority Escalated Problems',count(a11.row_key) as Priority_Escalated_Problems
FROM ldb.f_problem	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_problem	a13
	  on 	(a11.problem_key = a13.row_key)
	join	ldb.d_problem_state	a14
	  on 	(a13.state_src_key = a14.row_key)
	join	ldb.d_calendar_month	a15
	  on 	(a12.month_start_date_key = a15.row_key)
where	(a15.lagging_count_of_month between 0 and 11
 or a14.wh_dimension_code = 'open')
and a13.priority_escalated_flag='Y'
union
SELECT 'Problem Backlog',count(a11.row_key) as Problem_Backlog
FROM ldb.f_problem	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_problem	a13
	  on 	(a11.problem_key = a13.row_key)
	join	ldb.d_problem_state	a14
	  on 	(a13.state_src_key = a14.row_key)
	join	ldb.d_calendar_month	a15
	  on 	(a12.month_start_date_key = a15.row_key)
where	(a15.lagging_count_of_month between 0 and 11
 or a14.wh_dimension_code = 'open')
and a13.backlog_flag='Y'
union
SELECT 'Problems Generating Knowledge',count(a11.row_key) as Problems_Generating_Knowledge
FROM ldb.f_problem	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_problem	a13
	  on 	(a11.problem_key = a13.row_key)
	join	ldb.d_problem_state	a14
	  on 	(a13.state_src_key = a14.row_key)
	join	ldb.d_calendar_month	a15
	  on 	(a12.month_start_date_key = a15.row_key)
where	(a15.lagging_count_of_month between 0 and 11
 or a14.wh_dimension_code = 'open')
and a13.knowledge_flag='Y'
union
SELECT 'Problems Pending Change',count(a11.row_key) as Problems_Pending_Change
FROM ldb.f_problem	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_problem	a13
	  on 	(a11.problem_key = a13.row_key)
	join	ldb.d_problem_state	a14
	  on 	(a13.state_src_key = a14.row_key)
	join	ldb.d_calendar_month	a15
	  on 	(a12.month_start_date_key = a15.row_key)
where	(a15.lagging_count_of_month between 0 and 11
 or a14.wh_dimension_code = 'open')
and a13.change_flag='Y'
union
SELECT 
'Problems Reassigned',
sum(a11.reassignment_count) from	ldb.f_problem	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_problem	a13
	  on 	(a11.problem_key = a13.row_key)
	join	ldb.d_problem_state	a14
	  on 	(a13.state_src_key = a14.row_key)
	join	ldb.d_calendar_month	a15
	  on 	(a12.month_start_date_key = a15.row_key)
where	(a15.lagging_count_of_month between 0 and 11
 or a14.wh_dimension_code = 'open')
union
SELECT 'Problems Resolved by Change',count(a11.row_key) as Problems_Removed_by_Change
FROM ldb.f_problem_closed a11 
	join	ldb.d_calendar_date	a12
	  on 	(a11.closed_on_key = a12.row_key)
	join	ldb.d_problem	a13
	  on 	(a11.problem_key = a13.row_key)
	join	ldb.d_problem_state	a14
	  on 	(a13.state_src_key = a14.row_key)
	join	ldb.d_calendar_month	a15
	  on 	(a12.month_start_date_key = a15.row_key)
where	(a15.lagging_count_of_month between 0 and 11
 or a14.wh_dimension_code = 'open')
and a13.change_flag='Y'
union
SELECT 'Related Incidents',sum(a11.linked_incident_count) as Related_Incidents
FROM ldb.f_problem	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_problem	a13
	  on 	(a11.problem_key = a13.row_key)
	join	ldb.d_problem_state	a14
	  on 	(a13.state_src_key = a14.row_key)
	join	ldb.d_calendar_month	a15
	  on 	(a12.month_start_date_key = a15.row_key)
where	(a15.lagging_count_of_month between 0 and 11
 or a14.wh_dimension_code = 'open')
union
select	'Resolve / Discontinue Duration (Days)',sum((a11.resolution_time_duration_c / 86400.0)) AS WJXBFS1
from	ldb.f_problem_closed	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.closed_on_key = a12.row_key)
	join	ldb.d_problem	a13
	  on 	(a11.problem_key = a13.row_key)
	join	ldb.d_problem_state	a14
	  on 	(a13.state_src_key = a14.row_key)
	join	ldb.d_calendar_month	a15
	  on 	(a12.month_start_date_key = a15.row_key)
where	(a15.lagging_count_of_month between 0 and 11
 or a14.wh_dimension_code = 'open')
 union
 select	'Root Cause Duration (Days)',((sum(a11.root_cause_duration_c) / 86400.0)) AS WJXBFS1
from	ldb.f_problem	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_problem	a13
	  on 	(a11.problem_key = a13.row_key)
	join	ldb.d_problem_state	a14
	  on 	(a13.state_src_key = a14.row_key)
	join	ldb.d_calendar_month	a15
	  on 	(a12.month_start_date_key = a15.row_key)
where	(a15.lagging_count_of_month between 0 and 11
 or a14.wh_dimension_code = 'open')
 union
 select	'Solution Duration (Days)',((sum(a11.solution_duration_c) / 86400.0) ) AS WJXBFS1
from	ldb.f_problem	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_problem	a13
	  on 	(a11.problem_key = a13.row_key)
	join	ldb.d_problem_state	a14
	  on 	(a13.state_src_key = a14.row_key)
	join	ldb.d_calendar_month	a15
	  on 	(a12.month_start_date_key = a15.row_key)
where	(a15.lagging_count_of_month between 0 and 11
 or a14.wh_dimension_code = 'open')
 union
 
select	'Time Worked (Min)',sum((a11.time_worked / 60.0)) AS WJXBFS1
from	ldb.f_problem	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_problem	a13
	  on 	(a11.problem_key = a13.row_key)
	join	ldb.d_problem_state	a14
	  on 	(a13.state_src_key = a14.row_key)
	join	ldb.d_calendar_month	a15
	  on 	(a12.month_start_date_key = a15.row_key)
where	(a15.lagging_count_of_month between 0 and 11
 or a14.wh_dimension_code = 'open')
 union
 select	'Updates',sum(a11.update_count_c) AS WJXBFS1
from	ldb.f_problem	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_problem	a13
	  on 	(a11.problem_key = a13.row_key)
	join	ldb.d_problem_state	a14
	  on 	(a13.state_src_key = a14.row_key)
	join	ldb.d_calendar_month	a15
	  on 	(a12.month_start_date_key = a15.row_key)
where	(a15.lagging_count_of_month between 0 and 11
 or a14.wh_dimension_code = 'open')
 union
 select	'Workaround Duration (Days)',((sum(a11.workaround_duration_c) / 86400.0)) AS WJXBFS1
from	ldb.f_problem	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_problem	a13
	  on 	(a11.problem_key = a13.row_key)
	join	ldb.d_problem_state	a14
	  on 	(a13.state_src_key = a14.row_key)
	join	ldb.d_calendar_month	a15
	  on 	(a12.month_start_date_key = a15.row_key)
where	(a15.lagging_count_of_month between 0 and 11
 or a14.wh_dimension_code = 'open')
 order by 1