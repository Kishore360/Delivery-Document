-- ALL WRITTEN-- 

SELECT 'All Request Tasks' as metrics,COUNT(a.row_key) as value
from ldb.f_request_task a 
join ldb.d_calendar_date b 
on a.opened_on_key = b.row_key 
join ldb.d_calendar_month c 
on b.month_start_date_key = c.row_key 
where c.lagging_count_of_month between 0 and 11
union
select  'Avg Open to Close Duration (Hours)'as Metric_Name,( sum(open_to_close_duration/3600.00) /count(a.row_key)) as value
from ldb.f_request_task_closed_c a
join   ldb.d_calendar_date  A14
         on   (a. closed_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
where  a15.lagging_count_of_month between 0 and 11
UNION
SELECT 'Backlog Request Tasks ' as metrics,count(a.row_key) as value
FROM ldb.f_request_task a 
JOIN ldb.d_request_task d
on a.request_task_key=d.row_key
JOIN ldb.d_calendar_date b 
ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c
ON b.month_start_date_key = c.row_key
where  d.backlog_flag='Y'
and c.lagging_count_of_month between 0 and 11
UNION
select	'Closed Request Tasks'as metrics,count(a11.row_key) AS value
from	ldb.f_request_task_closed_c	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.closed_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 11
UNION

SELECT 'Request Tasks Backlog'as metrics,count(a.row_key) as value
FROM ldb.f_request_task a 
JOIN ldb.d_calendar_date b 
ON a.opened_on_key=b.row_key
join ldb.d_sc_task_state a110 
on (a.state_src_key = a110.row_key) 
join ldb.d_calendar_month d
on b.month_start_date_key=d.row_key
where d.lagging_count_of_month between 0 and 11 and
a110.wh_dimension_code='OPEN'
UNION
select	'First call resolution Taks' as metrics,count(a11.row_key) AS value
from	ldb.f_request_task_closed_c	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.closed_on_key = a12.row_key)
	join	ldb.d_request_task	a13
	  on 	(a11.request_task_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.first_call_resolution_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 11)
UNION
select 'Multiple Assignment Request Tasks'as Metric_Name, count( a.row_key ) as value
from ldb.f_request_task a
join ldb.d_request_task b on b.row_key=a.request_task_key
join   ldb.d_calendar_date  A14
         on   (a. opened_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
where	multiple_assignment_flag = 'Y' and   a15.lagging_count_of_month between 0 and 11
UNION
SELECT 'Overdue Requests Tasks'as metrics,count(a.row_key) as value
FROM ldb.f_request_task a 
JOIN ldb.d_request_task d
on a.request_task_key=d.row_key
JOIN ldb.d_calendar_date b 
ON a.opened_on_key=b.row_key
join ldb.d_calendar_month c
on b.month_start_date_key=c.row_key
where c.lagging_count_of_month between 0 and 11
and d.over_due_flag='Y'
UNION
select	'Priority escalated incidents'as metrics,count(a11.row_key) AS value
FROM ldb.f_request_task a11 
JOIN ldb.d_request_task d
on a11.request_task_key=d.row_key
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
		join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(priority_escalated_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 11)
 union
 
 SELECT 'Request Task open to close duration (hours)' as metrics,(sum(a11.open_to_close_duration)/3600.0) as value
FROM ldb.f_request_task_closed_c a11
join	ldb.d_request_task	a12
 on 	(a11.request_task_key = a12.row_key)
JOIN ldb.d_calendar_date b ON a11.closed_on_key=b.row_key
 join ldb.d_calendar_month a15
         on   (b.month_start_date_key = a15.row_key)
where	 a15.lagging_count_of_month between 0 and 11

UNION
select 'Request Task Reassignment Count'as metrics,sum(reassignment_count) as value
from ldb.f_request_task a
join   ldb.d_calendar_date  A14
         on   (a. opened_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
where  a15.lagging_count_of_month between 0 and 11