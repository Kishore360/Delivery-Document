select	'Avg. Open to Close Duration (Days)',sum((a11.open_to_close_duration / 86400.0))/count(a11.row_key) 
from	ldb.f_request_item_closed_c	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.closed_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 11
union
select	'Business Duration',coalesce(sum((a11.business_duration / 86400.0)),0) AS WJXBFS1
from	ldb.f_request_item	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 11
union
select	'Closed Request Items',count(a11.row_key) AS WJXBFS1
from	ldb.f_request_item_closed_c	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.closed_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 11
union
select	'Cost ($)',(sum(a11.price) / NULLIF(count(a11.row_key), 0)) * sum(a11.quantity) AS WJXBFS1
from	ldb.f_request_item	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 11
union
select	'Open To Close Duration (days)',sum((a11.open_to_close_duration / 86400.0)) AS WJXBFS1
from	ldb.f_request_item_closed_c	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.closed_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 11
union
select	'Opened Request Items',count(a11.row_key) AS WJXBFS1
from	ldb.f_request_item	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 11
union
select	'Overdue Request Items',count(a11.row_key) AS WJXBFS1
from	ldb.f_request_item	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_request_item	a13
	  on 	(a11.request_item_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.over_due_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 11)
 union
 select	'Percent Reassigned',sum(a11.reassignment_count)/count(a11.row_key)
from	ldb.f_request_item_closed_c	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.closed_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 11
union
select	'Price ($)',sum(a11.price) /count(a11.row_key) 
from	ldb.f_request_item	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 11
union
select	'Quantity',sum(a11.quantity) AS WJXBFS1
from	ldb.f_request_item	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 11
union
select	'Reassignment Count',sum(a11.reassignment_count) AS WJXBFS1
from	ldb.f_request_item_closed_c	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.closed_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 11
union
select	'Request Item Approval To Closed Duration (days)',sum(a11.approval_to_closed_duration_c) AS WJXBFS1
from	ldb.f_request_item	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 11
union
select	'Request Item Backlog',count(a11.row_key) AS WJXBFS1
from	ldb.f_request_item	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_request_item	a13
	  on 	(a11.request_item_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.backlog_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 11)
 union
 select	'Request Item Open To Fulfilled Duration (Days)',sum((a11.opened_to_fufilled_duration_c / 86400.0)) AS WJXBFS1
from	ldb.f_request_item	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 11
union
select	'Request Item Opened To Approval Duration (days)',sum(a11.opened_to_approval_duration_c) AS WJXBFS1
from	ldb.f_request_item	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 11
order by 1