SELECT a.X/b.Y AS Avg_Closed_Changes
FROM 
(SELECT count(distinct a.change_request_key)*1.00 as X
FROM ldb.f_change_request_closed a 
JOIN ldb.d_change_request b ON a.change_request_key=b.row_key
JOIN ldb.d_calendar_date c ON a.closed_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where d.lagging_count_of_month between 0 and 11) a
CROSS JOIN 
(SELECT max(a.configuration_item_key)*1.00 AS Y
FROM ldb.f_change_request_closed a 
JOIN ldb.d_change_request b ON a.change_request_key=b.row_key
JOIN ldb.d_calendar_date c ON a.closed_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where d.lagging_count_of_month between 0 and 11)b 