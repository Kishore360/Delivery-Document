SELECT 
'Bussiness_Duration',
sum(a.open_to_close_duration)/86400 AS Bussiness_Duration 
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
UNION 
SELECT 
'Open_to_Close_Duration',
Avg(a.open_to_close_duration/36400) AS Open_to_Close_Duration
FROM ldb.f_request_item_closed a
JOIN ldb.d_calendar_date b ON a.closed_on_key=b.row_key 
WHERE b.lagging_count_of_month between 0 and 24 
UNION 
SELECT 
'Opened_Request_Items',
count(a.row_key) as Opened_Request_Items
FROM ldb.f_request_item  a
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key 
WHERE b.lagging_count_of_month between 0 and 24 
UNION 
SELECT 
'Opened_Request_Items',
count(a.row_key) as Opened_Request_Items
FROM ldb.f_request_item  a
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key 
JOIN ldb.d_request_item c ON a.request_item_key=c.row_key
WHERE b.lagging_count_of_month between 0 and 24 
and c.over_due_flag='Y'
UNION 
SELECT 
'Percent_Reassigned',
count(a.reassignment_count)/count(a.row_key)*100 as Percent_Reassigned
FROM ldb.f_request_item_closed  a
JOIN ldb.d_calendar_date b ON a.closed_on_key=b.row_key 
WHERE b.lagging_count_of_month between 0 and 24 
UNION 
SELECT 
'Reassignment_Count',
count(a.reassignment_count) as Reassignment_Count
FROM ldb.f_request_item a 
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key 
WHERE b.lagging_count_of_month between 0 and 24 
UNION 
SELECT 
'Opened_Request_Items',
count(a.row_key) as Request_Item_Backlog
FROM ldb.f_request_item  a
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key 
JOIN ldb.d_request_item c ON a.request_item_key=c.row_key
WHERE b.lagging_count_of_month between 0 and 24 
and c.backlog_flag='Y'
UNION 
SELECT 
'Request_Item_Effort_In Hour)_C',
sum(a.time_worked) as Request_Item_Effort_InHours_C
FROM ldb.f_request_item  a
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key 
WHERE b.lagging_count_of_month between 0 and 24 
