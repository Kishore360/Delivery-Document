-- ALL WRITTEN -- 
select	'Actual Elapsed Time SLA No Pause (Hrs)' as metrics,sum((a11.met_sla_without_pause_duration_c / 3600.0)) AS value
from	ldb.f_request_task	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
union

select  'Actual Elapsed Time - SLA with Pause(Hrs)'as metrics,( sum(met_sla_with_pause_duration_c/3600.00) ) AS value
from ldb.f_request_task a
join   ldb.d_calendar_date  A14
         on   (a. opened_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
where  a15.lagging_count_of_month between 0 and 12
union
select	'Closed Request tasks' as metrics,count(a11.row_key) AS value
from	ldb.f_request_task_closed	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.closed_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
union
select	'Current Open Tasks'as metrics,count(a11.row_key) AS value
from	ldb.f_request_task	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_sc_task_state	a13
	  on 	(a11.state_src_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.wh_dimension_code = 'OPEN'
 and a14.lagging_count_of_month between 0 and 12)
union
select	'opened Request tasks' as metrics,count(a11.row_key) AS value
from	ldb.f_request_task	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
union
SELECT 'Overdue Requests Tasks' as metrics,count(a11.row_key) AS value 
FROM ldb.f_request_task a11 
join	ldb.d_request_task	a12
 on 	(a11.request_task_key = a12.row_key)
JOIN ldb.d_calendar_date b ON a11.opened_on_key=b.row_key
join	ldb.d_calendar_month	a13
	  on 	(b.month_start_date_key = a13.row_key)
where	a12.over_due_flag = 'Y' and  b.lagging_count_of_month between 0 and 12
union

select	'Request Item Overdue Duration'as metrics,sum((a11.overdue_duration / 86400.0)) AS value 
-- (NEED TO CONFIRM why this metric is present here )
from	ldb.f_request_item	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
union
select	'Request Task Business Duration'as metrics,sum((a11.business_duration / 86400.0)) AS value
from	ldb.f_request_task	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
union
SELECT 'Request task open to close duration'as metrics,(sum(a11.open_to_close_duration)/3600) as value 
-- (SHOULD COME FROM CLOSED FACT BUT IS RETRIEVED FROM OPENED FACT)
FROM ldb.f_request_task_closed a11
join	ldb.d_request_task	a12
 on 	(a11.request_task_key = a12.row_key)
JOIN ldb.d_calendar_date b ON a11.closed_on_key=b.row_key
where	 b.lagging_count_of_month between 0 and 12

union
select  'Request Task Opened in last 30 days'as metrics,count(a.row_key ) as value
from ldb.f_request_task a
join   ldb.d_calendar_date  A14
         on   (a. opened_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
where  A14.lagging_count_of_days between 0 and 29
union
select	'Request Task Overdue Duration'as metrics,sum((a11.overdue_duration / 86400.0)) AS value
from	ldb.f_request_task	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
union
SELECT 
'Request task Reassignments'as metrics,sum(a.reassignment_count) as value
FROM ldb.f_request_task a 
JOIN ldb.d_calendar_date b 
ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c
ON b.month_start_date_key = c.row_key
where c.lagging_count_of_month between 0 and 12
union
select	'Task Age Days'as metrics,sum(a11.age)*1.0 /	count(a11.row_key)*1.0 AS value
from	ldb.f_request_task	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12

 