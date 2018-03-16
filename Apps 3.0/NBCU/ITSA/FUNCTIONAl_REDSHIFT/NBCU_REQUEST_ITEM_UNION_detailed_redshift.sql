--AVG REQUEST ITEM OVERDUE DURATION,OPEN TO FULFILLED DURATION DAYS AND SECS 
-- OVERDUE DURATION DAYS,REQ ITEM AGE ,OPEN_TO_CLOSE DURATION DAYS,Fulfilled RITM MET ALL SLA 
--formula correct data difference in few 100's -- 

SELECT '%Opened RITMs Since Last Month'as metrics,((b.Y)/a.X )*100.0AS value
FROM 
(
SELECT count(a.row_key) as X 
FROM ldb.f_request_item a 
JOIN ldb.d_calendar_date b 
ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c
ON b.month_start_date_key = c.row_key
where c.lagging_count_of_month between 0 and 12
)a
CROSS JOIN
(
SELECT 
count(a.row_key) as Y
FROM ldb.f_request_item a 
JOIN ldb.d_calendar_date b 
ON a.opened_on_key=b.row_key
where b.lagging_count_of_days between 0 and 29)b
union
select	'Actual Elapsed Time SLA No Pause Hrs'as metrics,sum((a11.met_sla_without_pause_duration_c / 3600.0)) AS value
from	ldb.f_request_item	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
union

select	'Actual Elapsed Time SLA Pause Hrs'as metrics,sum((a11.met_sla_with_pause_duration_c / 3600.0)) AS value
from	ldb.f_request_item	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
union
select	'Applied Effort(Secs)' as metrics,sum(a11.hours_minutes_c) AS value
from	ldb.f_request_item_closed_c	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.closed_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
union
select	'Avg of Request Item Open to Close Duration (Days)' as metrics,((sum((a11.open_to_close_duration / 86400.0)))/count(a11.row_key)) AS value
from	ldb.f_request_item_closed_c	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.closed_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
union
select   'Avg Request Item Overdue duration'as metrics, avg((a11.overdue_duration / 86400.0)) AS value
from      ldb.f_request_item         a11
                join        ldb.d_calendar_date      a12
                  on         (a11.opened_on_key = a12.row_key)
                join        ldb.d_calendar_month  a13
                  on         (a12.month_start_date_key = a13.row_key)
where   a13.lagging_count_of_month between 0 and 12
union
select	'Business Elapsed Time Resolution SLA No Pause (Hrs)'as metrics,sum((a11.business_elapsed_resolution_without_pause_sla_duration_c / 3600.0)) AS value
from	ldb.f_request_item	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12

union

select	'Business Elapsed Time Resolution SLA With Pause (Hrs)'as metrics,sum((a11.business_elapsed_resolution_with_pause_sla_duration_c / 3600.0)) AS value
from	ldb.f_request_item	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
union
select	'Closed Request Item'as metrics,count(a11.row_key) AS value
from	ldb.f_request_item_closed_c	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.closed_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
union
SELECT 'Closed Request Items Met All SLAs Percent'as metrics,(a.X/b.Y)*100.0 AS value
FROM 
(SELECT 
count(a.row_key) as X 
FROM ldb.f_request_item_closed_c a 
JOIN ldb.d_request_item d
on a.request_item_key=d.row_key
JOIN ldb.d_calendar_date b1 
ON a.closed_on_key=b1.row_key
JOIN ldb.d_calendar_month c
ON b1.month_start_date_key = c.row_key
where c.lagging_count_of_month between 0 and 12
and d.met_sla_flag='Y'
)a
CROSS JOIN
(
SELECT 
count(a.row_key) as Y
FROM ldb.f_request_item_closed_c a 
JOIN ldb.d_calendar_date b 
ON a.closed_on_key=b.row_key
JOIN ldb.d_calendar_month c
ON b.month_start_date_key = c.row_key
where c.lagging_count_of_month between 0 and 12)b
union
select	'Cost $'as metrics,(sum(a11.price * a11.quantity)) AS value
from	ldb.f_request_item	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
union
select	'Fulfilled Request Item'as metrics,count(a11.fulfilled_on_c_key) AS value 
from	ldb.f_request_item_fulfilled_c	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.fulfilled_on_c_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
union
select	'Fulfilled Request Item Met ALL SLAs'as metrics,count(a11.fulfilled_on_c_key) AS value --DATA NOT MATCHING
from	ldb.f_request_item_fulfilled_c	a11
JOIN ldb.d_request_item d
on a11.request_item_key=d.row_key
	join	ldb.d_calendar_date	a12
	  on 	(a11.fulfilled_on_c_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
and d.met_sla_flag='Y'
union

select 'Fulfilled Request Items Met All SLAs Percent'as metrics,coalesce(Resolved_Request_Items_Met_All_SLAs/Fulfilled_Request_Item,0)*100.0as value
from (
select	count(a11.row_key) AS Resolved_Request_Items_Met_All_SLAs
from	ldb.f_request_item_fulfilled_c	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.fulfilled_on_c_key = a12.row_key)
	join	ldb.d_request_item	a13
	  on 	(a11.request_item_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.met_sla_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 12) )a
cross join 
(select	count(a11.row_key) AS Fulfilled_Request_Item
from	ldb.f_request_item_fulfilled_c	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.fulfilled_on_c_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12  )b
union
select	'Fulfilled Request Items Missed Any SLA'as metrics,count(a11.row_key) AS value
from	ldb.f_request_item_fulfilled_c	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.fulfilled_on_c_key = a12.row_key)
	join	ldb.d_request_item	a13
	  on 	(a11.request_item_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.met_sla_flag = 'N'
 and a14.lagging_count_of_month between 0 and 12)
 union
 select	'INT FCR'as metrics,count(a11.fulfilled_on_c_key) AS value
from	ldb.f_request_item_fulfilled_c	a11
	join	ldb.d_request_item	a12
	  on 	(a11.request_item_key = a12.row_key)
	join	ldb.d_calendar_date	a13
	  on 	(a11.fulfilled_on_c_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a13.month_start_date_key = a14.row_key)
where	(a12.international_first_contact_resolution_flag_c = 'Y'
 and a14.lagging_count_of_month between 0 and 12)
 union
 select	'INT FTR' as metrics,count(a11.fulfilled_on_c_key) AS value
from	ldb.f_request_item_fulfilled_c	a11
	join	ldb.d_request_item	a12
	  on 	(a11.request_item_key = a12.row_key)
	join	ldb.d_calendar_date	a13
	  on 	(a11.fulfilled_on_c_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a13.month_start_date_key = a14.row_key)
where	(a12.international_first_time_resolution_flag_c = 'Y'
 and a14.lagging_count_of_month between 0 and 12)
 union
 select	'Max of Request Item Open to Close Duration(Days)'as metrics,(max(a11.open_to_close_duration) / 86400.0) AS value
from	ldb.f_request_item_closed_c	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.closed_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
union
select	'Mean Time to Fulfillment (Days)'as metrics,sum((a11.fulfillment_time_c / 86400.0)) /	count(a11.row_key) AS value
from	ldb.f_request_item_closed_c	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.closed_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
union
SELECT 'Met SLA No Pause' as metrics,count(a.row_key) as value
FROM ldb.f_request_item a 
JOIN ldb.d_request_item d
on a.request_item_key=d.row_key
JOIN ldb.d_calendar_date b1 
ON a.opened_on_key=b1.row_key
JOIN ldb.d_calendar_month c
ON b1.month_start_date_key = c.row_key
where c.lagging_count_of_month between 0 and 12
and d.met_resolution_with_pause_sla_c_flag='Y'
union
select	'Met SLA With Pause'as metrics,count(a11.row_key) AS value
from	ldb.f_request_item	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_request_item	a13
	  on 	(a11.request_item_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.met_sla_with_pause_c_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 12)
 union
  
 select	'Min of Request Item Open to Close Duration Days'as metrics,(min(a11.open_to_close_duration) / 86400.0) AS value
from	ldb.f_request_item_closed_c	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.closed_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
union
union
SELECT 'Missed SLA No Pause' as metrics,count(a.row_key) as value
FROM ldb.f_request_item a 
JOIN ldb.d_request_item d
on a.request_item_key=d.row_key
JOIN ldb.d_calendar_date b1 
ON a.opened_on_key=b1.row_key
JOIN ldb.d_calendar_month c
ON b1.month_start_date_key = c.row_key
where c.lagging_count_of_month between 0 and 12
and d.met_resolution_with_pause_sla_c_flag='N'
union
select	'Missed SLA With Pause'  as metrics,count(a11.row_key) AS value
from	ldb.f_request_item	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_request_item	a13
	  on 	(a11.request_item_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.met_sla_with_pause_c_flag = 'N'
 and a14.lagging_count_of_month between 0 and 12)
 union
 SELECT 'Opened Request Items'as metrics,count(a.row_key) as value
FROM ldb.f_request_item a 
JOIN ldb.d_calendar_date b 
ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c
ON b.month_start_date_key = c.row_key
where c.lagging_count_of_month between 0 and 12
union
select 'Opened Request Items since Last Month' as metrics,case when (overall-last_month)<0 then 0 else (overall-last_month) end   as value from 
(SELECT 
count(a.row_key) as overall
FROM ldb.f_request_item a 
JOIN ldb.d_calendar_date b 
ON a.opened_on_key=b.row_key
where b.lagging_count_of_days between 0 and 12)
cross join 
(SELECT 
count(a.row_key) as last_month
FROM ldb.f_request_item a 
JOIN ldb.d_calendar_date b 
ON a.opened_on_key=b.row_key
where b.lagging_count_of_days between 30 and 59)
union
select	'Opened to Fulfilled Duration(Days)' as metrics,sum(a11.fulfillment_time_c/86400.0) AS value --data not matching
from	ldb.f_request_item_fulfilled_c	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.fulfilled_on_c_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
union
SELECT 
select	'Opened to Fulfilled Duration (secs)' as metrics,sum(a11.fulfillment_time_c) AS value --data not matching
from	ldb.f_request_item_fulfilled_c	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.fulfilled_on_c_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
union
SELECT 
'Overdue Request Items' as metrics,count(a.row_key) as value
FROM ldb.f_request_item a 
JOIN ldb.d_request_item d
on a.request_item_key=d.row_key
JOIN ldb.d_calendar_date b 
ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c
ON b.month_start_date_key = c.row_key
where  d.over_due_flag='Y'
and c.lagging_count_of_month between 0 and 12
union
SELECT 'Percent Reassigned' as metrics,(a.X/b.Y)*100 AS value 
FROM 
(SELECT 
sum(a.reassignment_count)*1.0 as X
FROM ldb.f_request_item_closed_c a 
JOIN ldb.d_calendar_date b 
ON a.closed_on_key=b.row_key
JOIN ldb.d_calendar_month c
ON b.month_start_date_key = c.row_key
where c.lagging_count_of_month between 0 and 12
)a
CROSS JOIN
(
SELECT 
count(a.row_key)*1.0 as Y
FROM ldb.f_request_item_closed_c a 
JOIN ldb.d_calendar_date b 
ON a.closed_on_key=b.row_key
JOIN ldb.d_calendar_month c
ON b.month_start_date_key = c.row_key
where c.lagging_count_of_month between 0 and 12)b
union
select	'Price $' as metrics,sum(a11.price) AS value
from	ldb.f_request_item	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
union
select	'Quantity' as metrics,sum(a11.quantity) AS value
from	ldb.f_request_item	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
union
select 'reassignement count' as metrics,sum(a11.reassignment_count) as value
from ldb. f_request_item_closed_c a11
join ldb.d_request_item a12
on a11.request_item_key=a12.row_key
join ldb.d_calendar_date       a15
on (a11.closed_on_key = a15.row_key)
WHERE a15.lagging_count_of_month between 0 and 12
union
select	'Reopened Request Items Met All SLAs' as metrics,count(a11.row_key) AS value
from	ldb.f_request_item	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_request_item	a13
	  on 	(a11.request_item_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.reopened_c_flag = 'Y'
 and a13.met_sla_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 12)
 union
 select	'Reopened Request Items Missed Any SLA'as metrics,count(a11.row_key) AS value
from	ldb.f_request_item	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_request_item	a13
	  on 	(a11.request_item_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.reopened_c_flag = 'Y'
 and a13.met_sla_flag = 'N'
 and a14.lagging_count_of_month between 0 and 12)
 union
 select	'Request Item Age'as metrics,sum(a11.age) AS value -- data not matching
from	ldb.f_request_item	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
union
select	'Request Item Backlog'as metrics,count(a11.row_key) AS value
from	ldb.f_request_item	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_request_item	a13
	  on 	(a11.request_item_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.backlog_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 12)
 union
 select	'Request Item Open To Close Duration(Days)' as metrics,sum((a11.open_to_close_duration / 86400.0)) AS value -- data not matching
from	ldb.f_request_item_closed_c	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.closed_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
union
select	'Request Item Overdue Duration Days'as metrics,sum((a11.overdue_duration / 86400.0)) AS value-- data not matching
from	ldb.f_request_item	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
union
select	'Request Item Reopen count'as metrics,sum(a11.reopened_count_c) AS value
from	ldb.f_request_item	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
union
select	'Time Worked Secs'as metrics,sum(a11.time_in_seconds_c) AS value
from	ldb.f_request_item	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12


