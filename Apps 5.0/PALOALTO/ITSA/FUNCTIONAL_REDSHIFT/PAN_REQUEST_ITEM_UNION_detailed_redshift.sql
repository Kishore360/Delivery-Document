-- PRICE --

select 'Age (Secs)'as Metric_Name, ( sum(a.age)) as value
from ldb.f_request_item a
join ldb.d_request_item d on a.request_item_key=d.row_key
join   ldb.d_calendar_date  A14
         on   (a. opened_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
where  a15.lagging_count_of_month between 0 and 11 or closed_on between '2017-01-29 00:00:00' and '2018-01-29 00:00:00'
union
select 'Approval To Close Duration (Secs)'as Metric_Name, ( sum(approval_to_close_duration_c))as value
from ldb.f_request_item_closed_c a
join ldb.d_request_item d on a.request_item_key=d.row_key
join   ldb.d_calendar_date  A14
         on   (a. closed_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
where  a15.lagging_count_of_month between 0 and 11 or closed_on between '2017-01-29 00:00:00' and '2018-01-29 00:00:00'
union
select  'Open to Close Duration (Days)'as Metric_Name,( sum(open_to_close_duration/86400.00) ) as value
from ldb.f_request_item_closed_c a
join ldb.d_request_item d on a.request_item_key=d.row_key
join   ldb.d_calendar_date  A14
         on   (a. closed_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
where  a15.lagging_count_of_month between 0 and 11 or closed_on between '2017-01-29 00:00:00' and '2018-01-29 00:00:00'
UNION
select  'Open to Close Duration (Hours)'as Metric_Name,( sum(open_to_close_duration/3600.00)) as value
from ldb.f_request_item_closed_c a
join ldb.d_request_item d on a.request_item_key=d.row_key
join   ldb.d_calendar_date  A14
         on   (a. closed_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
where  a15.lagging_count_of_month between 0 and 11 or closed_on between '2017-01-29 00:00:00' and '2018-01-29 00:00:00'
union
select  'Open to Approval Duration (Secs)'as Metric_Name,( sum(open_to_approval_duration_c)) as value
from ldb.f_request_item a
join ldb.d_request_item d on a.request_item_key=d.row_key
join   ldb.d_calendar_date  A14
         on   (a. opened_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
where  a15.lagging_count_of_month between 0 and 11 or closed_on between '2017-01-29 00:00:00' and '2018-01-29 00:00:00'
union
select	'Closed_Request_Item'as metrics,count(a11.row_key) AS value
from	ldb.f_request_item_closed_c	a11
join ldb.d_request_item d on a11.request_item_key=d.row_key
	join	ldb.d_calendar_date	a12
	  on 	(a11.closed_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 11 or closed_on between '2017-01-29 00:00:00' and '2018-01-29 00:00:00'
union
select 'Closed Within 48 hrs Request Items'as Metric_Name, ( sum(closed_within_48_hours_c)) as value
from ldb.f_request_item_closed_c a
join ldb.d_request_item d on a.request_item_key=d.row_key
join   ldb.d_calendar_date  A14
         on   (a. closed_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
where  a15.lagging_count_of_month between 0 and 11 or closed_on between '2017-01-29 00:00:00' and '2018-01-29 00:00:00'
union
select	'Cost_$'as metrics,(sum(a11.price * a11.quantity)) AS value
from	ldb.f_request_item	a11
join ldb.d_request_item d on a11.request_item_key=d.row_key
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 11 or closed_on between '2017-01-29 00:00:00' and '2018-01-29 00:00:00'
 union
 select  'Current Open Requests'as Metric_Name, count(1) as value
from ldb.f_request_item a
join ldb.d_request_item d on a.request_item_key=d.row_key
join ldb.d_request_item_state b on a.state_src_key=b.row_key
join   ldb.d_calendar_date  A14
         on   (a. opened_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
where wh_dimension_name='OPEN' and  a15.lagging_count_of_month between 0 and 11 or closed_on between '2017-01-29 00:00:00' and '2018-01-29 00:00:00'
union
 select	'Request Item Open To Close Duration (Days)' as metrics,sum((a11.open_to_close_duration / 86400)) AS value -- data not matching
from	ldb.f_request_item_closed_c	a11
join ldb.d_request_item d on a11.request_item_key=d.row_key
	join	ldb.d_calendar_date	a12
	  on 	(a11.closed_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 11 or closed_on between '2017-01-29 00:00:00' and '2018-01-29 00:00:00'
 union
 select	'Request Item Open To Close Duration (Hours)' as metrics,sum((a11.open_to_close_duration / 3600)) AS value -- data not matching
from	ldb.f_request_item_closed_c	a11
join ldb.d_request_item d on a11.request_item_key=d.row_key
	join	ldb.d_calendar_date	a
	  on 	(a11.closed_on_key = a.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 11 or closed_on between '2017-01-29 00:00:00' and '2018-01-29 00:00:00'


union
 SELECT 'Opened Request Items'as metrics,count(a.row_key) as value
FROM ldb.f_request_item a 
join ldb.d_request_item d on a.request_item_key=d.row_key
JOIN ldb.d_calendar_date b 
ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c
ON b.month_start_date_key = c.row_key
where c.lagging_count_of_month between 0 and 11 or closed_on between '2017-01-29 00:00:00' and '2018-01-29 00:00:00'
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
and c.lagging_count_of_month between 0 and 11 or closed_on between '2017-01-29 00:00:00' and '2018-01-29 00:00:00'
union
SELECT 'Percent Reassigned' as metrics,(a.X/b.Y)*100 AS value 
FROM 
(SELECT 
sum(a.reassignment_count)*1.0 as X
FROM ldb.f_request_item_closed_c a 
join ldb.d_request_item d on a.request_item_key=d.row_key
JOIN ldb.d_calendar_date b 
ON a.closed_on_key=b.row_key
JOIN ldb.d_calendar_month c
ON b.month_start_date_key = c.row_key
where c.lagging_count_of_month between 0 and 11 or closed_on between '2017-01-29 00:00:00' and '2018-01-29 00:00:00'
)a
CROSS JOIN
(
SELECT 
count(a.row_key)*1.0 as Y
FROM ldb.f_request_item_closed_c a 
join ldb.d_request_item d on a.request_item_key=d.row_key
JOIN ldb.d_calendar_date b 
ON a.closed_on_key=b.row_key
JOIN ldb.d_calendar_month c
ON b.month_start_date_key = c.row_key
where c.lagging_count_of_month between 0 and 11 or closed_on between '2017-01-29 00:00:00' and '2018-01-29 00:00:00')b
union
select	'Price $' as metrics,sum(a11.price) AS value
from	ldb.f_request_item	a11
join ldb.d_request_item d on a11.request_item_key=d.row_key
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 11 or closed_on between '2017-01-29 00:00:00' and '2018-01-29 00:00:00'
union
select	'Quantity' as metrics,sum(a11.quantity) AS value
from	ldb.f_request_item	a11
join ldb.d_request_item d on a11.request_item_key=d.row_key
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 11 or closed_on between '2017-01-29 00:00:00' and '2018-01-29 00:00:00'
union
select 'reassignement count' as metrics,sum(a11.reassignment_count) as value-- data not matching
from ldb. f_request_item_closed_c a11
join ldb.d_request_item a12
on a11.request_item_key=a12.row_key
join ldb.d_calendar_date       a15
on (a11.closed_on_key = a15.row_key)
join	ldb.d_calendar_month	a14
	  on 	(a15.month_start_date_key = a14.row_key)
WHERE a14.lagging_count_of_month between 0 and 11 or closed_on between '2017-01-29 00:00:00' and '2018-01-29 00:00:00'
union
select	'Request Item Backlog'as metrics,count(a11.row_key) AS value
from	ldb.f_request_item	a11
join ldb.d_request_item d on a11.request_item_key=d.row_key
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_request_item	a13
	  on 	(a11.request_item_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.backlog_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 11 or d.closed_on between '2017-01-29 00:00:00' and '2018-01-29 00:00:00')

 union
 select  'Avg Open to Close Duration (Hours)'as Metric_Name,( sum(open_to_close_duration/86400.00) /count(a.row_key)) as value
from ldb.f_request_item_closed_c a
join ldb.d_request_item d on a.request_item_key=d.row_key
join   ldb.d_calendar_date  A14
         on   (a. closed_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
where  a15.lagging_count_of_month between 0 and 11 or closed_on between '2017-01-29 00:00:00' and '2018-01-29 00:00:00'
