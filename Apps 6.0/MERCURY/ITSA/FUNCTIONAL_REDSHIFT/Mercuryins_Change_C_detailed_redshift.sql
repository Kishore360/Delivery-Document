select	'Actual_Duration' as metrics,sum((a11.actual_duration / 86400.0)) AS value
from	ldb.f_change_request	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 35
UNION

select   'Avg closed changes'as metrics,(count(1)*1.00 /count(distinct configuration_item_key)*1.00)AS value
from ldb.f_change_request_closed a
join   ldb.d_calendar_date  A14
         on   (a.closed_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
where  a15.lagging_count_of_month between 0 and 35
UNION
select   'Changes completed on time'as metrics,count(1) AS value
from ldb.f_change_request_closed a
join ldb.d_change_request d on a.change_request_key=d.row_key
join   ldb.d_calendar_date  A14
         on   (a. closed_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
where not_on_time_flag='N' and  a15.lagging_count_of_month between 0 and 35
UNION
select   'Changes Not completed on time'as metrics,count(1) AS value
from ldb.f_change_request_closed a
join ldb.d_change_request d on a.change_request_key=d.row_key
join   ldb.d_calendar_date  A14
         on   (a. closed_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
where not_on_time_flag='Y' and  a15.lagging_count_of_month between 0 and 35
UNION
select 'Changes past planned end date'as metrics,count(1) AS value from ( 
select a.change_request_key, (sum(a.time_past_planned_end_date  /86400.00) /count(a.row_key))abc
from ldb.f_change_request a
join ldb.d_change_request b on a.change_request_key=b.row_key
join   ldb.d_calendar_date  A14
         on   (a. opened_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
where  a15.lagging_count_of_month between 0 and 35 group by 1)a where abc>0 
UNION
select  'closed changes'as metrics, count(1) AS value
from ldb.f_change_request_closed a
join   ldb.d_calendar_date  A14
         on   (a.closed_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
where  a15.lagging_count_of_month between 0 and 35
UNION
select  'closed Emergency changes'as metrics, count(1) AS value
from ldb.f_change_request_closed a
join ldb.d_change_request d on a.change_request_key=d.row_key
join   ldb.d_calendar_date  A14
         on   (a. closed_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
		 join ldb.d_change_request_state       a119
on (a.state_src_key = a119.row_key)
where emergency_flag='Y' and wh_dimension_name in ('CLOSED') and  a15.lagging_count_of_month between 0 and 35
UNION
select  'closed Unplanned changes'as metrics,  count(1) AS value
from ldb.f_change_request_closed a
join ldb.d_change_request d on a.change_request_key=d.row_key
join   ldb.d_calendar_date  A14
         on   (a. closed_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
		where unplanned_flag='Y' and   a15.lagging_count_of_month between 0 and 35
		UNION
		select  'count of ci'as metrics,  (count(distinct configuration_item_key))AS value 
from ldb.f_change_request_closed a
join   ldb.d_calendar_date  A14
         on   (a.closed_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
where  a15.lagging_count_of_month between 0 and 35
UNION
select  'Days past planned end date'as metrics,sum((a11.time_past_planned_end_date / 86400.0))/count(distinct a11.change_request_key) AS WJXBFS2
from	ldb.f_change_request	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 35
UNION
select 'Deviation_Duration'as metrics,planned_duration-actual_duration as value from (
select	sum((a11.planned_duration / 86400.0)) AS planned_duration,
	sum((a11.actual_duration / 86400.0)) AS actual_duration
from	ldb.f_change_request	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 35)z
UNION
select	'EA Emergency',count(a11.change_request_key) AS WJXBFS1
from	ldb.f_change_request	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_change_request	a13
	  on 	(a11.change_request_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.emergency_ea_c_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 35)
 UNION
 select	'EI Emergency',count(a11.change_request_key) AS WJXBFS1
from	ldb.f_change_request	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_change_request	a13
	  on 	(a11.change_request_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.emergency_ei_c_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 35)
 UNION
 select	'Failed Changes',count(distinct a11.change_request_key) AS WJXBFS1
from	ldb.f_change_request_closed	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.closed_on_key = a12.row_key)
	join	ldb.d_change_request	a13
	  on 	(a11.change_request_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.failed_change_c_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 35)
 UNION
 select	'Failed Op Changes',count(a11.change_request_key) AS WJXBFS1
from	ldb.f_change_request	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_change_request	a13
	  on 	(a11.change_request_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.failed_op_changes_c_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 35)
 UNION
 select  'open unplanned changes' as metrics,count(1) as value 
from ldb.f_change_request a
join ldb.d_change_request d on a.change_request_key=d.row_key
join   ldb.d_calendar_date  A14
         on   (a. opened_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
		 
		where backlog_flag='Y' and unplanned_flag='Y' and   a15.lagging_count_of_month between 0 and 35
		UNION
		select 'opened changes' as metrics,  count(1) as value 
from ldb.f_change_request a
join   ldb.d_calendar_date  A14
         on   (a. opened_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
where  a15.lagging_count_of_month between 0 and 35
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
    a15.lagging_count_of_month between 0 and 35

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
		 where backlog_flag='Y' AND   a15.lagging_count_of_month between 0 and 35
)b
UNION
select  'planned changes'as metrics, count(1) as value
from ldb.f_change_request a
join ldb.d_change_request d on a.change_request_key=d.row_key
join   ldb.d_calendar_date  A14
         on   (a. opened_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
		where unplanned_flag='N' and   a15.lagging_count_of_month between 0 and 35
		UNION
select	'Plaanned Changes - EA',count(a11.change_request_key) AS WJXBFS1
from	ldb.f_change_request	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_change_request	a13
	  on 	(a11.change_request_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.planned_changes_ea_c_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 35)
 union
 select	'Planned Changes - EI',count(a11.change_request_key) AS WJXBFS1
from	ldb.f_change_request	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_change_request	a13
	  on 	(a11.change_request_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.planned_changes_ei_c_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 35)
 		UNION
		select	'Planned_Duration'as metrics,sum((a11.planned_duration / 86400.0)) AS value
from	ldb.f_change_request	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 35
UNION
select  'Rescheduled changes' as metrics, count(1) as value
from ldb.f_change_request a
join ldb.d_change_request d on a.change_request_key=d.row_key
join   ldb.d_calendar_date  A14
         on   (a. opened_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
		where rescheduled_flag='Y' and   a15.lagging_count_of_month between 0 and 35
		UNION
		select	'RFC_Age' as metrics,sum((a11.change_request_age / 86400.0)) /count(distinct a11.change_request_key) AS WJXBFS2
from	ldb.f_change_request	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 35
UNION
select 'RFC Backlog'as metrics,count(1) as value
from ldb.f_change_request a
join ldb.d_change_request d on a.change_request_key=d.row_key
join   ldb.d_calendar_date  A14
         on   (a. opened_on_key = a14.row_key)
join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
where backlog_flag='Y' and   a15.lagging_count_of_month between 0 and 35
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
where backlog_flag='Y'and wh_dimension_name='APPROVED' AND   a15.lagging_count_of_month between 0 and 35
UNION
select  'SUCCESSFUL changes' as metrics, count(distinct a11.change_request_key) AS WJXBFS1
from	ldb.f_change_request_closed	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.closed_on_key = a12.row_key)
	join	ldb.d_change_request	a13
	  on 	(a11.change_request_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.failed_change_c_flag = 'N'
 and a14.lagging_count_of_month between 0 and 35)
		
		UNION
		select  'unplanned changes'as metrics, count(1) as value
		from ldb.f_change_request a
join ldb.d_change_request d on a.change_request_key=d.row_key
join   ldb.d_calendar_date  A14
         on   (a. opened_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
		where unplanned_flag='Y' and   a15.lagging_count_of_month between 0 and 35
		UNION
		select   'unsuccessful changes'as metrics,count(1)  as value
from ldb.f_change_request_closed a
join ldb.d_change_request d on a.change_request_key=d.row_key
join   ldb.d_calendar_date  A14
         on   (a. closed_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
		where failure_flag='Y' and   a15.lagging_count_of_month between 0 and 35


 