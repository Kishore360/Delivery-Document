SELECT '% Opened Request Items since Last Month' as metrics,((abc-xyz)/xyz) as value from 
(select	count(a11.row_key)*1.0 AS xyz
from	ldb.f_request_item	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.previous_month_key)
where	a13.lagging_count_of_month between 0 and 24)a
cross join 
( select	count(a11.row_key)*1.0 AS abc
from	ldb.f_request_item	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 24)b
union
select	'Avg of Request Item Open to Fulfill Duration (Days)',sum((a11.open_to_close_duration / 86400.0))/count(a11.fulfilled_on_c_key) AS WJXBFS1
	 from	ldb.f_request_item_fulfilled_c	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.fulfilled_on_c_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 24
union
select	'Avg of Time to Fulfill (hours)',(sum(a11.time_to_fulfill_c) / 3600.0) /	count(a11.fulfilled_on_c_key) 
from	ldb.f_request_item_fulfilled_c	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.fulfilled_on_c_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 24
union

select	'Avg Request Item Overdue Duration (Days)',avg((a11.overdue_duration / 86400.0)) AS WJXBFS1
from	ldb.f_request_item	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 24
union
SELECT 
'Bussiness_Duration',
coalesce(sum(a.business_duration)/86400,0) AS Bussiness_Duration 
FROM ldb.f_request_item a 
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
where b.lagging_count_of_month between 0 and 24
UNION 
SELECT 
'Closed_Request_Items',
count(a.row_key) as Closed_Request_Items
FROM ldb.f_request_item_closed a 
JOIN ldb.d_calendar_date b ON a.closed_on_key=b.row_key
where b.lagging_count_of_month between 0 and 24
union
select	'Cost ($)',(sum(a11.price) * sum(a11.quantity)) AS WJXBFS1
from	ldb.f_request_item	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 24
union
select	'Fulfilled Request Items',count(a11.fulfilled_on_c_key) AS WJXBFS1
from	ldb.f_request_item_fulfilled_c	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.fulfilled_on_c_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 24
union
select	'Fulfilled Request Items Met All SLAs',count(a11.fulfilled_on_c_key) AS WJXBFS1
from	ldb.f_request_item_fulfilled_c	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.fulfilled_on_c_key = a12.row_key)
	join	ldb.d_request_item	a13
	  on 	(a11.request_item_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.ri_met_resolution_sla_c_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 24)
 union
 SELECT 'Fulfilled Request Items Met All SLAs Percent' as metrics,(abc/xyz)*100.0 as value from 
(select	count(a11.fulfilled_on_c_key)*1.0 AS abc
from	ldb.f_request_item_fulfilled_c	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.fulfilled_on_c_key = a12.row_key)
	join	ldb.d_request_item	a13
	  on 	(a11.request_item_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.ri_met_resolution_sla_c_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 24) )a
cross join 
( select	count(a11.fulfilled_on_c_key) AS xyz
from	ldb.f_request_item_fulfilled_c	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.fulfilled_on_c_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 24 )b
union
select	'Fulfilled Request Items Met All SLAs',count(a11.fulfilled_on_c_key) AS WJXBFS1
from	ldb.f_request_item_fulfilled_c	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.fulfilled_on_c_key = a12.row_key)
	join	ldb.d_request_item	a13
	  on 	(a11.request_item_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.ri_met_resolution_sla_c_flag = 'N'
 and a14.lagging_count_of_month between 0 and 24)
 union
 select	'Max of Request Item Open to Fulfill Duration (Days)',(max(a11.open_to_close_duration) / 86400.0) AS WJXBFS1
from	ldb.f_request_item_fulfilled_c	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.fulfilled_on_c_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 24
union
select	'Min of Request Item Open to Fulfill Duration (Days)',(min(a11.open_to_close_duration) / 86400.0) AS WJXBFS1
from	ldb.f_request_item_fulfilled_c	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.fulfilled_on_c_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 24
union
select	'Multiple Assignment Requests Met All SLAs',count(a11.row_key) AS WJXBFS1
from	ldb.f_request_item	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_request_item	a13
	  on 	(a11.request_item_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.multiple_assignment_flag = 'Y'
 and a13.ri_met_resolution_sla_c_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 24)
 union
 select	'Multiple Assignment Requests missed All SLAs',count(a11.row_key) AS WJXBFS1
from	ldb.f_request_item	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_request_item	a13
	  on 	(a11.request_item_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.multiple_assignment_flag = 'Y'
 and a13.ri_met_resolution_sla_c_flag = 'N'
 and a14.lagging_count_of_month between 0 and 24)
 union
select	'Open to Fulfill Duration (Days)',sum((a11.open_to_close_duration / 86400.0)) AS WJXBFS1
from	ldb.f_request_item_fulfilled_c	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.fulfilled_on_c_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 24
union
select	'Opened Request Items',count(a11.row_key) AS WJXBFS1
from	ldb.f_request_item	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 24
union
SELECT 'Opened Request Items since Last Month' as metrics,(abc-xyz) as value from 
(select	count(a11.row_key)*1.0 AS xyz
from	ldb.f_request_item	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.previous_month_key)
where	a13.lagging_count_of_month between 0 and 24)a
cross join 
( select	count(a11.row_key)*1.0 AS abc
from	ldb.f_request_item	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 24)b
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
 and a14.lagging_count_of_month between 0 and 24)
 union
 select	'Percent Reassigned',(abc/efg)*100
from
(SELECT ((case when abc>0 then abc else xyz end)*1.0) as abc from 
(select	sum(a11.reassignment_count) AS abc
from	ldb.f_request_item	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 24 )a
cross join 
( select	sum(a11.reassignment_count) AS xyz
from	ldb.f_request_item_closed	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.closed_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 24)b)a
cross join
(select	count(a11.row_key) AS efg
from	ldb.f_request_item_closed	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.closed_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 24)c
union
select	'Price ($)',sum(a11.price) AS WJXBFS1
from	ldb.f_request_item	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 24
union
select	'Quantity',sum(a11.quantity) AS WJXBFS1
from	ldb.f_request_item	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 24
union
SELECT 'Reassignment Count' as metrics,case when abc>0 then abc else xyz end as value from 
(select	sum(a11.reassignment_count) AS abc
from	ldb.f_request_item	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 24 )a
cross join 
( select	sum(a11.reassignment_count) AS xyz
from	ldb.f_request_item_closed	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.closed_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 24)b
union
select	'Request Item Age (Days)',sum((a11.age / 86400.0)) AS WJXBFS1
from	ldb.f_request_item	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 24
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
 and a14.lagging_count_of_month between 0 and 24)
 union
 select	'Request Item Overdue Duration (Days)',sum((a11.overdue_duration / 86400.0)) AS WJXBFS1
from	ldb.f_request_item	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 24
union
select	'Request Items Met All SLAs',count(a11.row_key) AS WJXBFS1
from	ldb.f_request_item_closed	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.closed_on_key = a12.row_key)
	join	ldb.d_request_item	a13
	  on 	(a11.request_item_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.met_sla_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 24)
 union
 select	'Time to Fulfill (hours)',(sum(a11.time_to_fulfill_c) / 3600.0) AS WJXBFS1
from	ldb.f_request_item_fulfilled_c	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.fulfilled_on_c_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 24
union
select	'Time to Respond',sum(a11.time_to_respond_c) AS WJXBFS1
from	ldb.f_request_item_closed	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.closed_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 24
order by 1
 
