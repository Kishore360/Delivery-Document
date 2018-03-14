select	'Acknowledged (Min)',sum((a11.open_to_acknowledge_duration_c / 60.0)) AS WJXBFS1
from	ldb.f_request_task	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 35
union
select	'All Request Tasks',count(a11.row_key) AS WJXBFS1
from	ldb.f_request_task	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 35
union
select	'Backlog Request Tasks',count(a11.row_key) AS WJXBFS1
from	ldb.f_request_task	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_request_task	a13
	  on 	(a11.request_task_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.backlog_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 35)
 union
 select	'Closed Request Tasks',count(a11.row_key) AS WJXBFS1
from	ldb.f_request_task_closed	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.closed_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 35
union
select	'Days Open',sum((a11.open_days_business_duration_c / 32400.0)) AS WJXBFS1
from	ldb.f_request_task	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 35
union
select	'Days to Close',sum((a11.open_to_close_business_duration_c / 32400.0)) AS WJXBFS1
from	ldb.f_request_task_closed	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.closed_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 35
union
select	'First Call Resolution Request Tasks',count(a11.row_key) AS WJXBFS1
from	ldb.f_request_task	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_request_task	a13
	  on 	(a11.request_task_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.first_call_resolution_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 35)
 union
 select	'Multiple Assignment Requests Tasks',count(a11.row_key) AS WJXBFS1
from	ldb.f_request_task	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_request_task	a13
	  on 	(a11.request_task_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.multiple_assignment_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 35)
 union
 select	'Opened Request Tasks',count(a11.row_key) AS WJXBFS1
from	ldb.f_request_task	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 35
union
select	'Overdue Requests Tasks',count(a11.row_key) AS WJXBFS1
from	ldb.f_request_task	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_request_task	a13
	  on 	(a11.request_task_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.over_due_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 35)
 union
 select	'Priority Escalated Requests Tasks',count(a11.row_key) AS WJXBFS1
from	ldb.f_request_task	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_request_task	a13
	  on 	(a11.request_task_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.priority_escalated_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 35)
 union
 select	'Request Task Backlog',count(a11.row_key) AS WJXBFS1
from	ldb.f_request_task	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_request_task	a13
	  on 	(a11.request_task_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.backlog_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 35)
 union
 select	'Request Task Open To Close Duration (Days)',sum((a11.open_to_close_duration / 86400.0))/count(a11.row_key) AS WJXBFS2
from	ldb.f_request_task_closed	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.closed_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 35
union
select	'Request Task Opened To Fulfilled Duration (Days)',sum((a11.opened_to_fufilled_duration_c / 86400.0)) AS WJXBFS1
from	ldb.f_request_task	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 35
union
select	'Request Task Opened To Fulfilled Duration (Days)',sum((a11.opened_to_fufilled_duration_c / 86400.0)) AS WJXBFS1
from	ldb.f_request_task	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 35
union
select	'Request Task Reassignment Count',sum(a11.reassignment_count) AS WJXBFS1
from	ldb.f_request_task	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 35
order by 1