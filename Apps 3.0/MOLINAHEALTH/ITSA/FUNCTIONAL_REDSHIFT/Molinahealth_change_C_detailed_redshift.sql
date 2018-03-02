SELECT 
'% Closed Emergency Changes'as metric ,
round(a.abc/b.xyz*100.0,2) as value
FROM 
(
select	count( a11.row_key)*1.0 AS abc
from	ldb.f_change_request_closed	a11
	join	ldb.d_change_request	a12
	  on 	(a11.change_request_key = a12.row_key)
	join	ldb.d_change_request_state	a13
	  on 	(a11.state_src_key = a13.row_key)
	join	ldb.d_calendar_date	a14
	  on 	(a11.closed_on_key = a14.row_key)
	join	ldb.d_calendar_month	a15
	  on 	(a14.month_start_date_key = a15.row_key)
where	(a12.emergency_flag = 'Y'
 and a13.wh_dimension_code = 'CLOSED'
 and a15.lagging_count_of_month between 0 and 24)
) a 
CROSS JOIN 
( 
select	count( a11.row_key)*1.0 AS xyz
from	ldb.f_change_request_closed	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.closed_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 24
)b
union
SELECT 
'% Emergency Changes'as metric ,
round(a.abc/b.xyz*100.0,2) as value
FROM 
(
select	count( a11.row_key)*1.0 AS abc
from	ldb.f_change_request	a11
	join	ldb.d_change_request	a12
	  on 	(a11.change_request_key = a12.row_key)
	join	ldb.d_change_request_state	a13
	  on 	(a11.state_src_key = a13.row_key)
	join	ldb.d_calendar_date	a14
	  on 	(a11.opened_on_key = a14.row_key)
	join	ldb.d_calendar_month	a15
	  on 	(a14.month_start_date_key = a15.row_key)
where	(a12.emergency_flag = 'Y'
 and a15.lagging_count_of_month between 0 and 24)
) a 
CROSS JOIN 
( 
select	count( a11.row_key)*1.0 AS xyz
from	ldb.f_change_request	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 24
)b
union
select	'Actual Duration (Days)' as metrics,sum((a11.actual_duration / 86400.0)) AS value
from	ldb.f_change_request	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 24
UNION

select   'Avg Closed Changes'as metrics,(count(1)*1.00 /count(distinct configuration_item_key)*1.00)AS value
from ldb.f_change_request_closed a
join   ldb.d_calendar_date  A14
         on   (a.closed_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
where  a15.lagging_count_of_month between 0 and 24
UNION
select   'Changes Completed On Time'as metrics,count(1) AS value
from ldb.f_change_request_closed a
join ldb.d_change_request d on a.change_request_key=d.row_key
join   ldb.d_calendar_date  A14
         on   (a. closed_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
where not_on_time_flag='N' and  a15.lagging_count_of_month between 0 and 24
UNION
select   'Changes Not Completed On Time'as metrics,count(1) AS value
from ldb.f_change_request_closed a
join ldb.d_change_request d on a.change_request_key=d.row_key
join   ldb.d_calendar_date  A14
         on   (a. closed_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
where not_on_time_flag='Y' and  a15.lagging_count_of_month between 0 and 24
UNION
select 'Changes Past Planned End Date'as metrics,count(1) AS value from ( 
select a.change_request_key, (sum(a.days_past_planned_end_date  /86400.00) /count(a.row_key))abc
from ldb.f_change_request a
join ldb.d_change_request b on a.change_request_key=b.row_key
join   ldb.d_calendar_date  A14
         on   (a. opened_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
where  a15.lagging_count_of_month between 0 and 24 group by 1)a where abc>0 
UNION
select  'Closed Changes'as metrics, count(1) AS value
from ldb.f_change_request_closed a
join   ldb.d_calendar_date  A14
         on   (a.closed_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
where  a15.lagging_count_of_month between 0 and 24
UNION
select  'Closed Emergency Changes'as metrics, count(1) AS value
from ldb.f_change_request_closed a
join ldb.d_change_request d on a.change_request_key=d.row_key
join   ldb.d_calendar_date  A14
         on   (a. closed_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
		 join ldb.d_change_request_state       a119
on (a.state_src_key = a119.row_key)
where emergency_flag='Y' and wh_dimension_name in ('CLOSED') and  a15.lagging_count_of_month between 0 and 24
UNION
select  'Closed Unplanned Changes'as metrics,  count(1) AS value
from ldb.f_change_request_closed a
join ldb.d_change_request d on a.change_request_key=d.row_key
join   ldb.d_calendar_date  A14
         on   (a. closed_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
		where unplanned_flag='Y' and   a15.lagging_count_of_month between 0 and 24
		UNION
		select  'Count of CI'as metrics,  (count(distinct configuration_item_key))AS value 
from ldb.f_change_request_closed a
join   ldb.d_calendar_date  A14
         on   (a.closed_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
where  a15.lagging_count_of_month between 0 and 24
UNION
select  'Days past planned end date'as metrics,sum((a11.days_past_planned_end_date / 86400.0))/count(distinct a11.change_request_key) AS WJXBFS2
from	ldb.f_change_request	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 24
UNION
select 'Deviation Duration (Days)'as metrics,planned_duration-actual_duration as value from (
select	sum((a11.planned_duration / 86400.0)) AS planned_duration,
	sum((a11.actual_duration / 86400.0)) AS actual_duration
from	ldb.f_change_request	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 24)z
union
select	'Emergency Changes',count( a11.row_key)*1.0 AS abc
from	ldb.f_change_request	a11
	join	ldb.d_change_request	a12
	  on 	(a11.change_request_key = a12.row_key)
	join	ldb.d_change_request_state	a13
	  on 	(a11.state_src_key = a13.row_key)
	join	ldb.d_calendar_date	a14
	  on 	(a11.opened_on_key = a14.row_key)
	join	ldb.d_calendar_month	a15
	  on 	(a14.month_start_date_key = a15.row_key)
where	(a12.emergency_flag = 'Y'
 and a15.lagging_count_of_month between 0 and 24)
 UNION
 select  'open unplanned changes' as metrics,count(1) as value 
from ldb.f_change_request a
join ldb.d_change_request d on a.change_request_key=d.row_key
join   ldb.d_calendar_date  A14
         on   (a. opened_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
		 
		where backlog_flag='Y' and unplanned_flag='Y' and   a15.lagging_count_of_month between 0 and 24
		UNION
		select 'opened changes' as metrics,  count(1) as value 
from ldb.f_change_request a
join   ldb.d_calendar_date  A14
         on   (a. opened_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
where  a15.lagging_count_of_month between 0 and 24
UNION
SELECT 
'percent of  rfc pending implementation',
a.pending_impl/b.backlog*100.0 as percent_pending_impl_changes
FROM 
(
select count(1)*1.0 as pending_impl
from ldb.f_change_request a
join ldb.d_change_request d on a.change_request_key=d.row_key
join   ldb.d_calendar_date  A14
         on   (a.opened_on_key = a14.row_key)
join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
		 join ldb.d_change_request_approval       a111
on (a.approval_state_src_key = a111.row_key)
where backlog_flag='Y'and a111.wh_dimension_name='APPROVED' and
    a15.lagging_count_of_month between 0 and 24

) a 
CROSS JOIN 
( 
select count(1) as backlog
from ldb.f_change_request a
join ldb.d_change_request d on a.change_request_key=d.row_key
join   ldb.d_calendar_date  A14
         on   (a. opened_on_key = a14.row_key)
join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
		 where backlog_flag='Y' AND   a15.lagging_count_of_month between 0 and 24
)b
UNION
select  'planned changes'as metrics, count(1) as value
from ldb.f_change_request a
join ldb.d_change_request d on a.change_request_key=d.row_key
join   ldb.d_calendar_date  A14
         on   (a. opened_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
		where unplanned_flag='N' and   a15.lagging_count_of_month between 0 and 24
UNION
		select	'Planned Duration (Days)'as metrics,sum((a11.planned_duration / 86400.0)) AS value
from	ldb.f_change_request	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 24
union
select	''sum(a11.reassignment_count) AS WJXBFS1
from	ldb.f_change_request	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 24
UNION
select  'Rescheduled changes' as metrics, count(1) as value
from ldb.f_change_request a
join ldb.d_change_request d on a.change_request_key=d.row_key
join   ldb.d_calendar_date  A14
         on   (a. opened_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
		where rescheduled_flag='Y' and   a15.lagging_count_of_month between 0 and 24
		UNION
		select	'RFC_Age' as metrics,sum((a11.change_request_age / 86400.0)) /count(distinct a11.change_request_key) AS WJXBFS2
from	ldb.f_change_request	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 24
UNION
select 'RFC Backlog'as metrics,count(1) as value
from ldb.f_change_request a
join ldb.d_change_request d on a.change_request_key=d.row_key
join   ldb.d_calendar_date  A14
         on   (a. opened_on_key = a14.row_key)
join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
where backlog_flag='Y' and   a15.lagging_count_of_month between 0 and 24
UNION
select 'RFC pending implementation'as metrics,count(1)as value
from ldb.f_change_request a
join ldb.d_change_request d on a.change_request_key=d.row_key
join   ldb.d_calendar_date  A14
         on   (a. opened_on_key = a14.row_key)
join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
		 join ldb.d_change_request_approval       a111
on (a.approval_state_src_key = a111.row_key)
where backlog_flag='Y'and wh_dimension_name='APPROVED' AND   a15.lagging_count_of_month between 0 and 24
UNION
select  'SUCCESSFUL changes' as metrics, count(distinct a11.change_request_key) AS WJXBFS1
from	ldb.f_change_request_closed	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.closed_on_key = a12.row_key)
	join	ldb.d_change_request	a13
	  on 	(a11.change_request_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.failure_flag = 'N'
 and a14.lagging_count_of_month between 0 and 24)
		
		UNION
		select  'unplanned changes'as metrics, count(1) as value
		from ldb.f_change_request a
join ldb.d_change_request d on a.change_request_key=d.row_key
join   ldb.d_calendar_date  A14
         on   (a. opened_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
		where unplanned_flag='Y' and   a15.lagging_count_of_month between 0 and 24
		UNION
		select   'unsuccessful changes'as metrics,count(1)  as value
from ldb.f_change_request_closed a
join ldb.d_change_request d on a.change_request_key=d.row_key
join   ldb.d_calendar_date  A14
         on   (a. closed_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
		where failure_flag='Y' and   a15.lagging_count_of_month between 0 and 24



