SELECT 'Actual Duration (Days)',SUM(a.actual_duration)/86400.00 AS Actual_Duration_Days
FROM ldb.f_change_request a 
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key 
JOIN ldb.d_change_request d ON a.change_request_key=d.row_key
where c.lagging_count_of_month between 0 and 23
UNION 
SELECT 'Avg Age (Days)',(sum(a.change_request_age)/86400.0)/count(a.row_key) as Avg_Age_Days
FROM ldb.f_change_request a 
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key 
JOIN ldb.d_change_request d ON a.change_request_key=d.row_key
where c.lagging_count_of_month between 0 and 23
UNION 
SELECT 'Avg Days Past Planned End Date',(sum(a.time_past_planned_end_date)/86400.0)/count(a.row_key) as Avg_Days_Past_planned_End_Date
FROM ldb.f_change_request a 
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key 
JOIN ldb.d_change_request d ON a.change_request_key=d.row_key
where c.lagging_count_of_month between 0 and 23
UNION 
SELECT 'Avg Days since Last Update',a.X/b.Z AS Avg_Days_since_Last_Update
FROM 
(SELECT (sum(a.dormancy_age)/86400.00)*1.00 AS X
FROM ldb.f_change_request a 
JOIN ldb.d_change_request x ON a.change_request_key=x.row_key
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
where x.backlog_flag='Y' AND c.lagging_count_of_month between 0 and 23 
 ) a
CROSS JOIN 
(
SELECT (Count(distinct a.change_request_key))*1.00 as Z
FROM ldb.f_change_request a 
JOIN ldb.d_change_request x ON a.change_request_key=x.row_key
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
where (x.backlog_flag='Y' AND c.lagging_count_of_month between 0 and 23)
) b 
UNION 
SELECT 'Avg Deviation Duration - Last 30 Days',a.X/b.Z*1.0 AS Avg_Deviation_Duration_Last_30_Days
FROM 
(
SELECT (sum(a.planned_duration)/86400.00-sum(a.actual_duration)/86400.00)*1.00 AS X 
FROM ldb.f_change_request a 
JOIN ldb.d_change_request x ON a.change_request_key=x.row_key
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
where b.lagging_count_of_days between 0 and 23
) a 
CROSS JOIN 
( SELECT Count(distinct a.change_request_key) AS Z
FROM ldb.f_change_request a 
JOIN ldb.d_change_request x ON a.change_request_key=x.row_key
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
where b.lagging_count_of_days between 0 and 23
) b 
UNION 
SELECT 'Cancelled Changes',Count(a.row_key) as Cancelledchanges 
FROM ldb.f_change_request_closed a 
JOIN ldb.d_calendar_date b ON a.closed_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
JOIN ldb.d_change_request_state d ON a.state_src_key=d.row_key
JOIN ldb.d_change_request e ON a.change_request_key=e.row_key
JOIN ldb.d_lov_change_request_sub_status_c x ON e.sub_status_src_c_key=x.row_key
WHERE (d.source_dimension_name='Closed Cancelled' AND x.source_dimension_name='Cancelled')
AND (c.lagging_count_of_month between 0 and 23)
UNION 
select 'Change Backlog',count(1) AS Change_Backlog 
from ldb.f_change_request a
join ldb.d_change_request d on a.change_request_key=d.row_key
join  ldb.d_calendar_date  A14 on   (a. opened_on_key = a14.row_key)
join ldb.d_calendar_month a15 on   (a14.month_start_date_key = a15.row_key)
where backlog_flag='Y' and a15.lagging_count_of_month between 0 and 23
UNION 
SELECT 'Change Task Count',COUNT(a.row_key) AS Change_Task_Count
FROM ldb.f_change_request_planned_end_date a 
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
where b.lagging_count_of_month between 0 and 23
UNION 
select 'Changes by Planned Start Date',
count(a.row_key)
from ldb.f_change_request_planned_start_date a
join   ldb.d_calendar_date  a14
         on   (a. opened_on_key = a14.row_key)
join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
		 
		where 
    a15.lagging_count_of_month between 0 and 23
UNION 
select 'Changes by Planned End Date',count(a.row_key)
from ldb.f_change_request_planned_end_date a  
join   ldb.d_calendar_date  a14
         on   (a. opened_on_key = a14.row_key)
join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
		 
		where 
    a15.lagging_count_of_month between 0 and 23

UNION 
select  'Changes Completed On Time',
count(a.row_key) 
from ldb.f_change_request_closed a
join ldb.d_change_request d on a.change_request_key=d.row_key
join   ldb.d_calendar_date  A14
         on   (a. closed_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
where not_on_time_flag='N' and  a15.lagging_count_of_month between 0 and 23
UNION
select  'Changes Not Completed On Time',
count(a.row_key) 
from ldb.f_change_request_closed a
join ldb.d_change_request d on a.change_request_key=d.row_key
join   ldb.d_calendar_date  A14
         on   (a. closed_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
where not_on_time_flag='Y' and  a15.lagging_count_of_month between 0 and 23
UNION 
select 'Changes Past Planned End Date',
sum(time_past_planned_end_date/86400.00) /count(a.row_key)
from ldb.f_change_request a
join   ldb.d_calendar_date  A14
         on   (a. opened_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
where  a15.lagging_count_of_month between 0 and 23
UNION 
select 'Changes Pending Implementation',
count(a.row_key)
from ldb.f_change_request a
join ldb.d_change_request d on a.change_request_key=d.row_key
join   ldb.d_calendar_date  A14
         on   (a. opened_on_key = a14.row_key)
join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
		 join ldb.d_change_request_approval       a111
on (a.approval_state_src_key = a111.row_key)
where backlog_flag='Y'and wh_dimension_name='APPROVED' AND   a15.lagging_count_of_month between 0 and 23
UNION 
select  'Closed Changes',
count(a.row_key) 
from ldb.f_change_request_closed a
join   ldb.d_calendar_date  A14
         on   (a.closed_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
where  a15.lagging_count_of_month between 0 and 23
UNION 
select   'Closed Emergency Changes',
count(a.row_key) 
from ldb.f_change_request_closed a
join ldb.d_change_request d on a.change_request_key=d.row_key
join   ldb.d_calendar_date  A14
         on   (a. closed_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
		 join ldb.d_change_request_state       a119
on (a.state_src_key = a119.row_key)
where emergency_flag='Y' and wh_dimension_name in ('CLOSED') and  a15.lagging_count_of_month between 0 and 23
UNION 
select  'Closed Unplanned Changes',
count(a.row_key) 
from ldb.f_change_request_closed a
join ldb.d_change_request d on a.change_request_key=d.row_key
join   ldb.d_calendar_date  A14
         on   (a. closed_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
		where unplanned_flag='Y' and   a15.lagging_count_of_month between 0 and 23
UNION 
SELECT 'Complete Changes', 
count(a.row_key)
FROM ldb.f_change_request a 
JOIN ldb.d_change_request b ON a.change_request_key=b.row_key
JOIN ldb.d_change_request_state c ON a.state_src_key=c.row_key
JOIN ldb.d_calendar_date d ON a.opened_on_key=d.row_key
JOIN ldb.d_calendar_month e ON d.month_start_date_key=e.row_key
WHERE (c.source_dimension_name= 'Completed'
AND e.lagging_count_of_month between 0 and 23)
UNION 
SELECT 'Count of CI',
count(distinct a.configuration_item_key)
FROM ldb.f_change_request_closed a 
JOIN ldb.d_calendar_date b ON a.closed_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
WHERE c.lagging_count_of_month between 0 and 23 
UNION 
SELECT 'Days since Last Update',SUM(a.dormancy_age)/86400.0
FROM ldb.f_change_request a 
JOIN ldb.d_change_request b ON a.change_request_key=b.row_key
JOIN ldb.d_change_request_state c ON a.state_src_key=c.row_key
JOIN ldb.d_calendar_date d ON a.opened_on_key=d.row_key
JOIN ldb.d_calendar_month e ON d.month_start_date_key=e.row_key
WHERE (b.backlog_flag='Y'
AND e.lagging_count_of_month between 0 and 23)
UNION 
select 'Deviation_Duratio_Days',
(planned_duration)-(actual_duration) as Deviation_Duration 
from (
select	sum((a11.planned_duration / 86400.0)) AS planned_duration,
	sum((a11.actual_duration / 86400.0)) AS actual_duration
from	ldb.f_change_request	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 23)







