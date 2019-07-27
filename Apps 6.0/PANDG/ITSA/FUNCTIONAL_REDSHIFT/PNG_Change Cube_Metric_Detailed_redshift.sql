SELECT 'Actual_Duration_Days',SUM(a.actual_duration)/86400.00 AS Actual_Duration_Days
FROM ldb.f_change_request a 
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key 
JOIN ldb.d_change_request d ON a.change_request_key=d.row_key
where c.lagging_count_of_month between 0 and 11
UNION 
SELECT 'Avg_Age_Days',(sum(a.change_request_age)/86400.0)/count(a.row_key) as Avg_Age_Days
FROM ldb.f_change_request a 
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key 
JOIN ldb.d_change_request d ON a.change_request_key=d.row_key
where c.lagging_count_of_month between 0 and 11
UNION 
SELECT 'Avg_Days_Past_planned_End_Date',(sum(a.time_past_planned_end_date)/86400.0)/count(a.row_key) as Avg_Days_Past_planned_End_Date
FROM ldb.f_change_request a 
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key 
JOIN ldb.d_change_request d ON a.change_request_key=d.row_key
where c.lagging_count_of_month between 0 and 11
UNION 
SELECT 'Avg_Days_since_Last_Update',a.X/b.Z AS Avg_Days_since_Last_Update
FROM 
(SELECT (sum(a.dormancy_age)/86400.00)*1.00 AS X
FROM ldb.f_change_request a 
JOIN ldb.d_change_request x ON a.change_request_key=x.row_key
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
where c.lagging_count_of_month between 0 and 11 
and x.backlog_flag='Y') a
CROSS JOIN 
(
SELECT (Count(distinct a.change_request_key))*1.00 as Z
FROM ldb.f_change_request a 
JOIN ldb.d_change_request x ON a.change_request_key=x.row_key
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
where c.lagging_count_of_month between 0 and 11 
and x.backlog_flag='Y'
) b 
UNION 
SELECT 'Avg_Deviation_Duration_Last_30_Days',a.X/b.Z AS Avg_Deviation_Duration_Last_30_Days
FROM 
(
SELECT (sum(a.planned_duration)/86400.00-sum(a.actual_duration)/86400.00)*1.00 AS X 
FROM ldb.f_change_request a 
JOIN ldb.d_change_request x ON a.change_request_key=x.row_key
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
where b.lagging_count_of_days between 0 and 11
) a 
CROSS JOIN 
( SELECT Count(distinct a.change_request_key) AS Z
FROM ldb.f_change_request a 
JOIN ldb.d_change_request x ON a.change_request_key=x.row_key
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
where b.lagging_count_of_days between 0 and 11
) b 
UNION 
select 'Change_Backlog',count(1) AS Change_Backlog 
from ldb.f_change_request a
join ldb.d_change_request d on a.change_request_key=d.row_key
join   ldb.d_calendar_date  A14 on   (a. opened_on_key = a14.row_key)
join ldb.d_calendar_month a15 on   (a14.month_start_date_key = a15.row_key)
where backlog_flag='Y' and   a15.lagging_count_of_month between 0 and 11
UNION 
SELECT 'Planned_Duration_in_days',sum(a.planned_duration)/86400.00 AS Planned_Duration_in_days
FROM ldb.f_change_request a 
JOIN ldb.d_change_request d ON a.change_request_key=d.row_key
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
Where c.lagging_count_of_month between 0 and 11
UNION 
select 'Changes by Planned Start Date',
count(a.row_key)
from ldb.f_change_request_planned_start_date a
join   ldb.d_calendar_date  A14
         on   (a. opened_on_key = a14.row_key)
join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
		 
		where 
    a15.lagging_count_of_month between 0 and 12
UNION 
select 'Changes by Planned End Date',count(a.row_key)
from ldb.f_change_request_planned_end_date a  
join   ldb.d_calendar_date  A14
         on   (a. opened_on_key = a14.row_key)
join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
		 
		where 
    a15.lagging_count_of_month between 0 and 12
UNION 
select  'Changes Completed On Time',
count(1) 
from ldb.f_change_request_closed a
join ldb.d_change_request d on a.change_request_key=d.row_key
join   ldb.d_calendar_date  A14
         on   (a. closed_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
where not_on_time_flag='N' and  a15.lagging_count_of_month between 0 and 11
UNION 
select  'Changes Not Completed On Time',
count(1) 
from ldb.f_change_request_closed a
join ldb.d_change_request d on a.change_request_key=d.row_key
join   ldb.d_calendar_date  A14
         on   (a. closed_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
where not_on_time_flag='Y' and  a15.lagging_count_of_month between 0 and 11
UNION 
SELECT 'Changes_Not_Completed_On_Time_Percentage_Last_30_Days',
a.X/b.Y*100.00 AS Changes_Not_Completed_On_Time_Percentage_Last_30_Days
FROM 
(
SELECT count(a.change_request_key)*1.00 AS X 
FROM ldb.f_change_request_closed a 
JOIN ldb.d_change_request d ON a.change_request_key=d.row_key
JOIN ldb.d_calendar_date b ON a.closed_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
Where d.not_on_time_flag='Y'
and b.lagging_count_of_days between 0 and 11
) a 
CROSS JOIN 
(
SELECT count(a.change_request_key)*1.00 AS Y
FROM ldb.f_change_request_closed a 
JOIN ldb.d_change_request d ON a.change_request_key=d.row_key
JOIN ldb.d_calendar_date b ON a.closed_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
Where b.lagging_count_of_days between 0 and 11 ) b 
UNION 
select 'Changes_past_Planned_End_Date',
sum(time_past_planned_end_date/86400.00) /count(a.row_key)
from ldb.f_change_request a
join   ldb.d_calendar_date  A14
         on   (a. opened_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
where  a15.lagging_count_of_month between 0 and 11
UNION 
select 'changes pending implementation',
count(1)
from ldb.f_change_request a
join ldb.d_change_request d on a.change_request_key=d.row_key
join   ldb.d_calendar_date  A14
         on   (a. opened_on_key = a14.row_key)
join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
		 join ldb.d_change_request_approval       a111
on (a.approval_state_src_key = a111.row_key)
where backlog_flag='Y'and wh_dimension_name='APPROVED' AND   a15.lagging_count_of_month between 0 and 11
UNION 
select  'Closed_Changes',
count(1) 
from ldb.f_change_request_closed a
join   ldb.d_calendar_date  A14
         on   (a.closed_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
where  a15.lagging_count_of_month between 0 and 11
UNION 
select   'Closed Emergency Changes',
count(1) 
from ldb.f_change_request_closed a
join ldb.d_change_request d on a.change_request_key=d.row_key
join   ldb.d_calendar_date  A14
         on   (a. closed_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
		 join ldb.d_change_request_state       a119
on (a.state_src_key = a119.row_key)
where emergency_flag='Y' and wh_dimension_name in ('CLOSED') and  a15.lagging_count_of_month between 0 and 11
UNION 
SELECT 
'closed_emergency_changes_percent',
a.closed_emergency/b.opened_changes*100.0 as closed_emergency_changes_percent
FROM 
(
select   count(1) closed_emergency
from ldb.f_change_request_closed a
join ldb.d_change_request d on a.change_request_key=d.row_key
join   ldb.d_calendar_date  A14
         on   (a. closed_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
		 join ldb.d_change_request_state       a119
on (a.state_src_key = a119.row_key)
where emergency_flag='Y' and wh_dimension_name in ('CLOSED') and  a15.lagging_count_of_month between 0 and 11

) a 
CROSS JOIN 
( 
select count(1)*1.0 as opened_changes
from ldb.f_change_request a
join   ldb.d_calendar_date  A14
         on   (a. opened_on_key = a14.row_key)
join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
		 		where 
    a15.lagging_count_of_month between 0 and 11
)b
UNION 
select  'Closed Unplanned Changes',
count(1) 
from ldb.f_change_request_closed a
join ldb.d_change_request d on a.change_request_key=d.row_key
join   ldb.d_calendar_date  A14
         on   (a. closed_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
		where unplanned_flag='Y' and   a15.lagging_count_of_month between 0 and 11
UNION 
select 'Deviation_Duratio_Days',
(planned_duration)-(actual_duration) as Deviation_Duration from (
select	sum((a11.planned_duration / 86400.0)) AS planned_duration,
	sum((a11.actual_duration / 86400.0)) AS actual_duration
from	ldb.f_change_request	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 11)z
UNION 
SELECT 'Impact_Value',
sum(a.impact_value_c) AS Impact_Value
FROM ldb.f_change_request a 
JOIN ldb.d_change_request b ON a.change_request_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where d.lagging_count_of_month between 0 and 11
UNION 
select  'Opened_Changes',
count(1) 
from ldb.f_change_request a
join   ldb.d_calendar_date  A14
         on   (a. opened_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
where  a15.lagging_count_of_month between 0 and 11
UNION 
SELECT 
'percent_pending_implementation_changes',
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
		 join ldb.d_change_request_approval       a111
on (a.approval_state_src_key = a111.row_key)
 
		where d.backlog_flag='Y'and a111.wh_dimension_name='APPROVED' and
    a15.lagging_count_of_month between 0 and 11

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
		 where d.backlog_flag='Y' AND   a15.lagging_count_of_month between 0 and 11
)b
UNION 
select  'Planned Changes',
count(1) 
from ldb.f_change_request a
join ldb.d_change_request d on a.change_request_key=d.row_key
join   ldb.d_calendar_date  A14
         on   (a. opened_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
		where unplanned_flag='N' and   a15.lagging_count_of_month between 0 and 11
UNION 

select	'Planned_Duration_Days',
sum((a11.planned_duration / 86400.0)) AS Planned_Duration_Days
from	ldb.f_change_request	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 11
UNION 

select   'Rescheduled_Changes',count(1) 
from ldb.f_change_request a
join ldb.d_change_request d on a.change_request_key=d.row_key
join   ldb.d_calendar_date  A14
         on   (a. opened_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
		where rescheduled_flag='Y' and   a15.lagging_count_of_month between 0 and 11
UNION 
SELECT 'Rescheduled_Changes_Percentage_Last_30_Days',
a.X/b.Y*100.00 AS Rescheduled_Changes_Percentage_Last_30_Days
FROM 
(SELECT count(a.change_request_key)*1.00 AS X 
FROM ldb.f_change_request a 
JOIN ldb.d_change_request d ON a.change_request_key=d.row_key
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
Where d.rescheduled_flag='Y'
and b.lagging_count_of_days between 0 and 11 
) a 
CROSS JOIN 
( 
SELECT count(a.change_request_key)*1.00 AS Y 
FROM ldb.f_change_request a 
JOIN ldb.d_change_request d ON a.change_request_key=d.row_key
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
Where b.lagging_count_of_days between 0 and 11 
) b 
UNION 
SELECT 'Risk_Value',sum(a.risk_value_c) AS Risk_Value
FROM ldb.f_change_request a 
JOIN ldb.d_change_request b ON a.change_request_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where d.lagging_count_of_month between 0 and 11
UNION 
select   'Successful_Changes',count(1) 
from ldb.f_change_request_closed a
join ldb.d_change_request d on a.change_request_key=d.row_key
join   ldb.d_calendar_date  A14
         on   (a. closed_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
		where failure_flag='N' and   a15.lagging_count_of_month between 0 and 11
UNION 

select   'Unplanned changes backlog',
count(1) 
from ldb.f_change_request a
join ldb.d_change_request d on a.change_request_key=d.row_key
join   ldb.d_calendar_date  A14
         on   (a. opened_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
		 
		where backlog_flag='Y' and unplanned_flag='Y' and   a15.lagging_count_of_month between 0 and 11
		
UNION 

select  'Unplanned Changes',
count(1) 
from ldb.f_change_request a
join ldb.d_change_request d on a.change_request_key=d.row_key
join   ldb.d_calendar_date  A14
         on   (a. opened_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
		where unplanned_flag='Y' and   a15.lagging_count_of_month between 0 and 11
UNION 
SELECT 'Unplanned_Changes_percentage_Last_30_Days',
a.X/b.Y*100.00 AS Unplanned_Changes_percentage_Last_30_Days
FROM 
(SELECT count(a.change_request_key)*1.00 AS X 
FROM ldb.f_change_request a 
JOIN ldb.d_change_request d ON a.change_request_key=d.row_key
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
Where d.unplanned_flag='Y'
and b.lagging_count_of_days between 0 and 11 
) a 
CROSS JOIN 
( 
SELECT count(a.change_request_key)*1.00 AS Y 
FROM ldb.f_change_request a 
JOIN ldb.d_change_request d ON a.change_request_key=d.row_key
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
Where b.lagging_count_of_days between 0 and 11 
) b 	
UNION 
select 'Unsuccessfulll_Changes',  
count(1) 
from ldb.f_change_request_closed a
join ldb.d_change_request d on a.change_request_key=d.row_key
join   ldb.d_calendar_date  A14
         on   (a. closed_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
		where failure_flag='Y' and   a15.lagging_count_of_month between 0 and 11
UNION 
SELECT 'Vulnerability_Value',
sum(a.vulnerability_value_c) AS Vulnerability_Value
FROM ldb.f_change_request a 
JOIN ldb.d_change_request b ON a.change_request_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where d.lagging_count_of_month between 0 and 11
			