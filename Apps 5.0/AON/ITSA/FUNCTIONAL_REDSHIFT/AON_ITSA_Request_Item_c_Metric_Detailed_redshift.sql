select	'Avg Age (Days)',
	(sum((a11.age / 86400.0))/count(a11.row_key)) AS Avg_Age_Days
from	ldb.f_request_item	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 24
UNION 
select 'Avg Open to Close Duration (Days)',
(sum(a11.open_to_close_duration)/86400.0)/count(a11.row_key)
from ldb. f_request_item_closed a11
join ldb.d_calendar_date       a15
on (a11.closed_on_key = a15.row_key)
WHERE a15.lagging_count_of_month between 0 and 24
UNION 
SELECT 
'Avg Overdue Duration (Days)',
(sum(a.overdue_duration)/86400.0)/count(a.row_key) as Avg_RITM_Overdue_Duration_Days 
FROM ldb.f_request_item a 
JOIN ldb.d_request_item d on a.request_item_key=d.row_key
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key = c.row_key
where  (d.over_due_flag='Y' and c.lagging_count_of_month between 0 and 24)
UNION 
select 'Avg Overdue RITMs',
a.x/b.y from
(select count(a11.row_key) as x
from ldb. f_request_item a11
join ldb.d_request_item a12
on a11.request_item_key=a12.row_key
join ldb.d_calendar_date       a15
on (a11.opened_on_key = a15.row_key)
WHERE a15.lagging_count_of_month between 0 and 24 and a12.over_due_flag='Y')a
cross join 
(select count(a11.row_key) as y
from ldb. f_request_item a11
join ldb.d_request_item a12
on a11.request_item_key=a12.row_key
join ldb.d_calendar_date       a15
on (a11.opened_on_key = a15.row_key)
WHERE a15.lagging_count_of_month between 0 and 24 )b
UNION 
SELECT 
'Business Duration (Days)', 
sum(a.business_duration)/86400 AS Bussiness_Duration 
FROM ldb.f_request_item a 
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
where b.lagging_count_of_month between 0 and 24
UNION 
select 
'Closed RITM Business Duration (Days)',
sum(a11.business_duration)/86400.0
from ldb. f_request_item_closed a11
join ldb.d_request_item a12
on a11.request_item_key=a12.row_key
join ldb.d_calendar_date       a15
on (a11.closed_on_key = a15.row_key)
WHERE a15.lagging_count_of_month between 0 and 24
UNION 
SELECT  
'Closed RITM Reassignment Count',
sum(a11.reassignment_count)
from ldb. f_request_item a11
join ldb.d_request_item a12 on a11.request_item_key=a12.row_key
join ldb.d_calendar_date a15 on (a11.Opened_on_key = a15.row_key)
WHERE a15.lagging_count_of_month between 0 and 24
UNION 
SELECT  
'Closed RITMs',
Count(a11.request_item_key)
from ldb. f_request_item_closed a11
join ldb.d_request_item a12 on a11.request_item_key=a12.row_key
join ldb.d_calendar_date a15 on (a11.closed_on_key = a15.row_key)
WHERE a15.lagging_count_of_month between 0 and 24
UNION 
select 'Max of Closed RITM Reassignments',
max(a11.reassignment_count)
from ldb. f_request_item_closed a11
join ldb.d_request_item a12 on a11.request_item_key=a12.row_key
join ldb.d_calendar_date       a15 on (a11.closed_on_key = a15.row_key)
WHERE a15.lagging_count_of_month between 0 and 24
UNION 
select	'Max of Open to Close Duration (Days)',
(max(a11.open_to_close_duration) / 86400.0) AS Max_of_Request_Item_Open_to_Close_Duration_Days
from	ldb.f_request_item_closed	a11
join	ldb.d_calendar_date	a12 on (a11.closed_on_key = a12.row_key)
join	ldb.d_calendar_month a13 on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 24
UNION 
select 'Max of Opened RITM Reassignments',
max(a11.reassignment_count)
from ldb. f_request_item a11
join ldb.d_request_item a12 on a11.request_item_key=a12.row_key
join ldb.d_calendar_date a15 on (a11.opened_on_key = a15.row_key)
WHERE a15.lagging_count_of_month between 0 and 24
UNION 
select 'Min of Closed RITM Reassignments',Min(a11.reassignment_count)
from ldb. f_request_item_closed a11
join ldb.d_request_item a12 on a11.request_item_key=a12.row_key
join ldb.d_calendar_date  a15 on (a11.closed_on_key = a15.row_key)
WHERE a15.lagging_count_of_month between 0 and 24
UNION 
select	'Min of Open to Close Duration (Days)',
(min(a11.open_to_close_duration) / 86400.0) AS Min_of_Request_Item_Open_to_Close_Duration_Days
from	ldb.f_request_item_closed	a11
join	ldb.d_calendar_date	a12 on 	(a11.closed_on_key = a12.row_key)
join ldb.d_calendar_month	a13 on (a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 24
UNION 
select 'Min of Opened RITM Reassignments',
Min(a11.reassignment_count)
from ldb. f_request_item a11
join ldb.d_request_item a12 on a11.request_item_key=a12.row_key
join ldb.d_calendar_date a15 on (a11.opened_on_key = a15.row_key)
WHERE a15.lagging_count_of_month between 0 and 24
UNION 

select	'Open to Close Duration (Days)',
sum((a11.open_to_close_duration / 86400.0)) AS Request_Item_Open_To_Close_Duration_Days
from	ldb.f_request_item_closed	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.closed_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 24
UNION 
select 'Opened RITM Cost',
(sum(a11.price)/count(a11.row_key))*sum(a11.quantity)
from ldb. f_request_item a11
join ldb.d_request_item a12 on a11.request_item_key=a12.row_key
join ldb.d_calendar_date  a15 on (a11.opened_on_key = a15.row_key)
WHERE a15.lagging_count_of_month between 0 and 24
UNION 
select 'Opened RITM Price',
sum(a11.price)/count(a11.row_key)
from ldb. f_request_item a11
join ldb.d_request_item a12
on a11.request_item_key=a12.row_key
join ldb.d_calendar_date       a15
on (a11.opened_on_key = a15.row_key)
WHERE a15.lagging_count_of_month between 0 and 24
UNION 
select 'Opened RITM Quantity',
sum(a11.quantity)
from ldb. f_request_item a11
join ldb.d_request_item a12
on a11.request_item_key=a12.row_key
join ldb.d_calendar_date       a15
on (a11.opened_on_key = a15.row_key)
WHERE a15.lagging_count_of_month between 0 and 24
UNION 
select 'Opened RITM Reassignment Count',
sum(a11.reassignment_count)
from ldb. f_request_item a11
join ldb.d_request_item a12 on a11.request_item_key=a12.row_key
join ldb.d_calendar_date  a15 on (a11.opened_on_key = a15.row_key)
WHERE a15.lagging_count_of_month between 0 and 24
UNION 
SELECT  
'Opened RITMs',
Count(a11.request_item_key)
from ldb. f_request_item a11
join ldb.d_request_item a12 on a11.request_item_key=a12.row_key
join ldb.d_calendar_date a15 on (a11.opened_on_key = a15.row_key)
WHERE a15.lagging_count_of_month between 0 and 24
UNION 
select 'Opened RITMs Since Last Month',
Count(a11.row_key)
from ldb. f_request_item a11
join ldb.d_request_item a12
on a11.request_item_key=a12.row_key
join ldb.d_calendar_date       a15
on (a11.opened_on_key = a15.row_key)
WHERE a15.lagging_count_of_days between 29 and 59 
UNION 
select	'Overdue Duration (Days)',
sum((a11.overdue_duration / 86400.0)) AS Request_Item_Overdue_Duration_Days
from	ldb.f_request_item	a11
join	ldb.d_calendar_date	a12 on 	(a11.opened_on_key = a12.row_key)
join    ldb.d_calendar_month a13 on (a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 24
UNION 
SELECT 'Overdue RITMs',
Count(a.request_item_key)
FROM ldb.f_request_item a 
JOIN ldb.d_request_item x ON a.request_item_key=x.row_key
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
Where (c.lagging_count_of_month between 0 and 24 AND x.over_due_flag='Y')
UNION 
SELECT 'RITM Backlog',
Count(a.request_item_key)
FROM ldb.f_request_item a 
JOIN ldb.d_request_item x ON a.request_item_key=x.row_key
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
Where (c.lagging_count_of_month between 0 and 24 AND x.backlog_flag='Y')
UNION 
SELECT 'Ressigned %',SUM(a.reassignment_count)/count(a.row_key)
FROM ldb.f_request_item_closed a 
JOIN ldb.d_request_item x ON a.request_item_key=x.row_key
JOIN ldb.d_calendar_date b ON a.closed_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
Where (c.lagging_count_of_month between 0 and 24)
order by 1






