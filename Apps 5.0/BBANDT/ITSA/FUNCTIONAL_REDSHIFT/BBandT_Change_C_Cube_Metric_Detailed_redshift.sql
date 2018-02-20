SELECT '# of Incidents within 5 Days of Close', SUM(a.five_day_ci_c)
FROM ldb.f_change_request_closed a 
JOIN ldb.d_calendar_date b ON a.closed_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key 
JOIN ldb.d_change_request d ON a.change_request_key=d.row_key
where c.lagging_count_of_month between 0 and 24
UNION 
SELECT 'Actual Duration (Days)',SUM(a.actual_duration)/86400.00 AS Actual_Duration_Days
FROM ldb.f_change_request a 
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key 
JOIN ldb.d_change_request d ON a.change_request_key=d.row_key
where c.lagging_count_of_month between 0 and 24
UNION
SELECT 'Avg Changes Age (Days)',(sum(a.change_request_age)/86400.0)/count(a.row_key) as Avg_Age_Days
FROM ldb.f_change_request a 
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key 
JOIN ldb.d_change_request d ON a.change_request_key=d.row_key
where c.lagging_count_of_month between 0 and 24
UNION 
SELECT  'Avg Closed Changes', Count(a.change_request_key)/Count(a.configuration_item_key)
FROM ldb.f_change_request_closed a 
JOIN ldb.d_calendar_date b ON a.closed_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key 
JOIN ldb.d_change_request d ON a.change_request_key=d.row_key
where c.lagging_count_of_month between 0 and 24
UNION 
SELECT 'Avg Days Past Planned End Date',(sum(a.time_past_planned_end_date)/86400.0)/count(a.row_key) as Avg_Days_Past_planned_End_Date
FROM ldb.f_change_request a 
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key 
JOIN ldb.d_change_request d ON a.change_request_key=d.row_key
where c.lagging_count_of_month between 0 and 24
UNION 
SELECT 'Change Backlog',count(1) AS Change_Backlog 
from ldb.f_change_request a
join ldb.d_change_request d on a.change_request_key=d.row_key
join   ldb.d_calendar_date  A14 on   (a. opened_on_key = a14.row_key)
join ldb.d_calendar_month a15 on   (a14.month_start_date_key = a15.row_key)
where backlog_flag='Y' and   a15.lagging_count_of_month between 0 and 24
UNION 
SELECT 'Change Successful Status',
Count(a.change_request_key)
FROM ldb.f_change_request_closed a 
JOIN ldb.d_change_request b ON a.change_request_key=b.row_key
JOIN ldb.d_lov_change_request_status_c c ON b.change_request_status_c_key=c.row_key
JOIN ldb.d_calendar_date d ON a.closed_on_key=d.row_key
JOIN ldb.d_calendar_month e ON d.month_start_date_key=e.row_key
Where c.source_dimension_name='Closed Successful'
AND e.lagging_count_of_month between 0 and 24
UNION 
SELECT 'Change Unsuccessful Status',
Count(a.change_request_key)
FROM ldb.f_change_request_closed a 
JOIN ldb.d_change_request b ON a.change_request_key=b.row_key
JOIN ldb.d_lov_change_request_status_c c ON b.change_request_status_c_key=c.row_key
JOIN ldb.d_calendar_date d ON a.closed_on_key=d.row_key
JOIN ldb.d_calendar_month e ON d.month_start_date_key=e.row_key
Where (c.source_dimension_name='Closed Unsuccessful' or c.source_dimension_name='Closed Non-Compliant')
AND e.lagging_count_of_month between 0 and 24
UNION 
select  'Changes Completed On Time',
count(a.change_request_key) 
from ldb.f_change_request_closed a
join ldb.d_change_request d on a.change_request_key=d.row_key
join   ldb.d_calendar_date  A14
         on   (a. closed_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
where not_on_time_flag='N' and  a15.lagging_count_of_month between 0 and 24
UNION 
select  'Changes Not Completed On Time',
count(a.change_request_key) 
from ldb.f_change_request_closed a
join ldb.d_change_request d on a.change_request_key=d.row_key
join   ldb.d_calendar_date  A14
         on   (a. closed_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
where not_on_time_flag='Y' and  a15.lagging_count_of_month between 0 and 24
UNION 
select 'Changes Past Planned End Date',
Count(a.change_request_key)
from ldb.f_change_request a
join   ldb.d_calendar_date  A14
         on   (a. opened_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
		 JOIN ldb.d_change_request d ON a.change_request_key=d.row_key
where (d.planned_end_on > 0 
AND a15.lagging_count_of_month between 0 and 24)
UNION 
select 'Changes Pending Implementation',
count(a.change_request_key)
from ldb.f_change_request a
join ldb.d_change_request d on a.change_request_key=d.row_key
join   ldb.d_calendar_date  A14
         on   (a. opened_on_key = a14.row_key)
join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
		 join ldb.d_change_request_approval       a241
on (a.approval_state_src_key = a241.row_key)
where (backlog_flag='Y'and wh_dimension_name='APPROVED' AND   a15.lagging_count_of_month between 0 and 24)
UNION 
SELECT 
'Changes Pending Implementation %',
a.pending_impl/b.backlog*100.0 as percent_pending_impl_changes
FROM 
(
select count(1)*1.0 as pending_impl
from ldb.f_change_request a
join ldb.d_change_request d on a.change_request_key=d.row_key
join   ldb.d_calendar_date  A14
         on   (a. opened_on_key = a14.row_key)
join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
		 join ldb.d_change_request_approval       a241
on (a.approval_state_src_key = a241.row_key)
 
		where d.backlog_flag='Y'and a241.wh_dimension_name='APPROVED' and
    a15.lagging_count_of_month between 0 and 24
) a 
CROSS JOIN 
( 
select count(1)*1.0 AS backlog
from ldb.f_change_request a
join ldb.d_change_request d on a.change_request_key=d.row_key
join   ldb.d_calendar_date  A14
         on   (a. opened_on_key = a14.row_key)
join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
		 where d.backlog_flag='Y' AND   a15.lagging_count_of_month between 0 and 24
)b
UNION 
select  'Closed Changes',
count(a.change_request_key) 
from ldb.f_change_request_closed a
join   ldb.d_calendar_date  A14
         on   (a.closed_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
where  a15.lagging_count_of_month between 0 and 24
UNION 
select   'Closed Emergency Changes',
count(a.change_request_key) 
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
select  'Closed Planned Changes',
count(1) 
from ldb.f_change_request_closed a
join ldb.d_change_request d on a.change_request_key=d.row_key
join   ldb.d_calendar_date  A14
         on   (a. closed_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
		where   a15.lagging_count_of_month between 0 and 24
UNION 
select  'Closed Unplanned Changes',
count(1) 
from ldb.f_change_request_closed a
join ldb.d_change_request d on a.change_request_key=d.row_key
join   ldb.d_calendar_date  A14
         on   (a. closed_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
		where unplanned_flag='Y' and   a15.lagging_count_of_month between 0 and 24
UNION 
select 'Count of CI',
 Max(a.configuration_item_key) 
from ldb.f_change_request_closed a
join ldb.d_change_request d on a.change_request_key=d.row_key
join   ldb.d_calendar_date  A14
         on   (a. closed_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
		where a15.lagging_count_of_month between 0 and 24
UNION 
select 'Deviation Duration (Days)',
(planned_duration)-(actual_duration) as Deviation_Duration 
from (
select	sum((a11.planned_duration / 86400.0)) AS planned_duration,
	sum((a11.actual_duration / 86400.0)) AS actual_duration
from	ldb.f_change_request	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 24)
UNION 
select  'Opened Changes',
count(1) 
from ldb.f_change_request a
join   ldb.d_calendar_date  A14
         on   (a. opened_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
where  a15.lagging_count_of_month between 0 and 24
UNION 
select  'Planned Changes',
count(1) 
from ldb.f_change_request a
join ldb.d_change_request d on a.change_request_key=d.row_key
join   ldb.d_calendar_date  A14
         on   (a. opened_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
		where unplanned_flag='N' and   a15.lagging_count_of_month between 0 and 24
UNION 
select	'Planned Duration (Days)',
sum((a11.planned_duration / 86400.0)) AS Planned_Duration_Days
from	ldb.f_change_request	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 24
UNION 
select   'Rescheduled Changes',count(1) 
from ldb.f_change_request a
join ldb.d_change_request d on a.change_request_key=d.row_key
join   ldb.d_calendar_date  A14
         on   (a. opened_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
		where rescheduled_flag='Y' and   a15.lagging_count_of_month between 0 and 24
UNION
select   'Successful Changes',count(1) 
from ldb.f_change_request_closed a
join ldb.d_change_request d on a.change_request_key=d.row_key
join   ldb.d_calendar_date  A14
         on   (a. closed_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
		where (d.failure_flag='N' and   a15.lagging_count_of_month between 0 and 24)
UNION 
select   'Unsuccessful Changes',count(1) 
from ldb.f_change_request_closed a
join ldb.d_change_request d on a.change_request_key=d.row_key
join   ldb.d_calendar_date  A14
         on   (a. closed_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
		where (d.failure_flag='Y' and   a15.lagging_count_of_month between 0 and 24)
UNION 
select   'Unplanned Change Backlog',
count(1) 
from ldb.f_change_request a
join ldb.d_change_request d on a.change_request_key=d.row_key
join   ldb.d_calendar_date  A14
         on   (a. opened_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
		 
		where backlog_flag='Y' and unplanned_flag='Y' and   a15.lagging_count_of_month between 0 and 24
		
UNION 

select  'Unplanned Changes',
count(1) 
from ldb.f_change_request a
join ldb.d_change_request d on a.change_request_key=d.row_key
join   ldb.d_calendar_date  A14
         on   (a. opened_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
		where unplanned_flag='Y' and   a15.lagging_count_of_month between 0 and 24





