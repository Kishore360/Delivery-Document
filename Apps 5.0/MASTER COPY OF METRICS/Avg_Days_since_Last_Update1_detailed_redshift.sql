SELECT a.X/b.Y AS Avg_Days_since_Last_Update
FROM 
(
SELECT 
(sum(a.age)/86400.0)*1.00 as X 
FROM ldb.f_request_item a 
JOIN ldb.d_request_item d
on a.request_item_key=d.row_key
JOIN ldb.d_calendar_date b 
ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c
ON b.month_start_date_key = c.row_key
where  d.backlog_flag='Y'
and c.lagging_count_of_month between 0 and 11)a
CROSS JOIN
(SELECT 
(COUNT(distinct a.request_item_key))*1.00 as Y 
FROM ldb.f_request_item a 
JOIN ldb.d_request_item d
on a.request_item_key=d.row_key
JOIN ldb.d_calendar_date b 
ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c
ON b.month_start_date_key = c.row_key
where  d.backlog_flag='Y'
and c.lagging_count_of_month between 0 and 11)b