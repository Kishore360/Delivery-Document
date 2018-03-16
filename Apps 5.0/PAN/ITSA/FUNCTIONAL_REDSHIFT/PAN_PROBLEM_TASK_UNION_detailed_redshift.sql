-- FACT ALIAS MODEL IS NOT PRESENT,closed problem tasks,MTTR,ALL OPENED SERIES,PROB TASK OPEN TO CLOSE DURATION -- 
-- FACT ALIAS MODEL IS NOT PRESENT,closed problem tasks,open problem tasks, -- 

SELECT 'All problem Tasks' as metrics,COUNT(a.row_key) as value
from ldb.f_problem_task a 
join ldb.d_calendar_date b 
on a.opened_on_key = b.row_key 
join ldb.d_calendar_month c 
on b.month_start_date_key = c.row_key 
where c.lagging_count_of_month between 0 and 11
UNION
SELECT 'Backlog problem Tasks ' as metrics,count(a.row_key) as value
FROM ldb.f_problem_task a 
JOIN ldb.d_problem_task d
on a.problem_task_key=d.row_key
JOIN ldb.d_calendar_date b 
ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c
ON b.month_start_date_key = c.row_key
where  d.backlog_flag='Y'
and c.lagging_count_of_month between 0 and 11
UNION
select	'Closed knowledge problem Tasks'as metrics,count(a11.row_key) AS value
from	ldb.f_problem_task	a11
join ldb.d_problem_task a15 on a11.problem_task_key=a11.row_key
join ldb.d_problem_task_state a14 on state_src_key=a14.row_key 
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where a14.wh_dimension_name='CLOSED' and 	knowledge_flag='Y' and a13.lagging_count_of_month between 0 and 11
UNION
select	'Closed known error problem Tasks'as metrics,count(a11.row_key) AS value
from	ldb.f_problem_task	a11
join ldb.d_problem_task a15 on a11.problem_task_key=a11.row_key
join ldb.d_problem_task_state a14 on state_src_key=a14.row_key 
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where  a14.wh_dimension_name='CLOSED' and known_error_flag='Y' and 	a13.lagging_count_of_month between 0 and 11
UNION
select	'Closed problem Tasks'as metrics,count(a11.row_key) AS value
from	ldb.f_problem_task	a11
join ldb.d_problem_task a15 on a11.problem_task_key=a11.row_key
join ldb.d_problem_task_state a14 on state_src_key=a14.row_key 
	join	ldb.d_calendar_date	a12
	  on 	(a11.closed_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where a14.wh_dimension_name='CLOSED' and	a13.lagging_count_of_month between 0 and 11
union
select	'knowledge problem Tasks'as metrics,count(a11.row_key) AS value
from	ldb.f_problem_task	a11
join ldb.d_problem_task a15 on a11.problem_task_key=a11.row_key
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	knowledge_flag='Y' and a13.lagging_count_of_month between 0 and 11
UNION
select	'known error problem Tasks'as metrics,count(a11.row_key) AS value
from	ldb.f_problem_task	a11
join ldb.d_problem_task a15 on a11.problem_task_key=a11.row_key
	join	ldb.d_calendar_date	a12
	  on 	(a11.closed_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where known_error_flag='Y' and 	a13.lagging_count_of_month between 0 and 11
UNION
-- UNION MTTR (Need not have this metric as resolved is not there in problem)


select 'Multiple Assignment problem Tasks'as Metric_Name, count( a.row_key ) as value
from ldb.f_problem_task a
join ldb.d_problem_task b on b.row_key=a.problem_task_key
join   ldb.d_calendar_date  A14
         on   (a. opened_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
where	multiple_assignment_flag = 'Y' and   a15.lagging_count_of_month between 0 and 11
/*UNION
OPen knowledge
OPEN KNOWN ERROR*/
union
SELECT 'Open problem Tasks' as metrics,sum(a.row_key) as value
from ldb.f_problem_task a 
join ldb.d_calendar_date b 
on a.opened_on_key = b.row_key 
join ldb.d_calendar_month c 
on b.month_start_date_key = c.row_key 
where c.lagging_count_of_month between 0 and 11
/*union
MTD
WTD
YTD
*/
union
SELECT 'Overdue problems Tasks'as metrics,count(a.row_key) as value
FROM ldb.f_problem_task a 
JOIN ldb.d_problem_task d
on a.problem_task_key=d.row_key
JOIN ldb.d_calendar_date b 
ON a.opened_on_key=b.row_key
join ldb.d_calendar_month c
on b.month_start_date_key=c.row_key
where c.lagging_count_of_month between 0 and 11
and d.over_due_flag='Y'
UNION
select	'Priority_escalated problem Tasks'as metrics,count(a11.row_key) AS value
FROM ldb.f_problem_task a11 
JOIN ldb.d_problem_task d
on a11.problem_task_key=d.row_key
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
		join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(priority_escalated_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 11)
 union
 
 SELECT 'problem Task open to close duration' as metrics,(sum(a11.open_to_close_duration)/86400.0) as value
FROM ldb.f_problem_task a11
join	ldb.d_problem_task	a12
 on 	(a11.problem_task_key = a12.row_key)
JOIN ldb.d_calendar_date b ON a11.closed_on_key=b.row_key
where	 b.lagging_count_of_month between 0 and 12

 union
 
 SELECT 'problem Task open to Resolve  duration (hours)' as metrics,(sum(a11.open_to_resolve_duration)/3600.0) as value 
 --**Need to remove this metric since problem does not have resolved
FROM ldb.f_problem_task a11
join ldb.d_problem_task_state a14 on state_src_key=a14.row_key 
join	ldb.d_problem_task	a12
 on 	(a11.problem_task_key = a12.row_key)
JOIN ldb.d_calendar_date b ON a11.closed_on_key=b.row_key
where	a14.wh_dimension_name='RESOLVED' and  b.lagging_count_of_month between 0 and 12
UNION
select 'problem Task Reassignments'as metrics,sum(reassignment_count) as value
from ldb.f_problem_task a
join   ldb.d_calendar_date  A14
         on   (a. opened_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
where  a15.lagging_count_of_month between 0 and 11