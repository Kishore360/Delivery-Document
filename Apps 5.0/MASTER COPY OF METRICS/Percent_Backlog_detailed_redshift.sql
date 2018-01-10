SELECT a.X/b.Y AS Percent_Backlog
FROM 
(
SELECT 
count(a.row_key) as X 
FROM ldb.f_request_item a 
JOIN ldb.d_request_item d
on a.request_item_key=d.row_key
JOIN ldb.d_calendar_date b 
ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c
ON b.month_start_date_key = c.row_key
where  d.backlog_flag='Y'
and c.lagging_count_of_month between 0 and 11
)a
CROSS JOIN
(
SELECT 
count(a.row_key) as Y
FROM ldb.f_request_item a as Y
JOIN ldb.d_calendar_date b 
ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c
ON b.month_start_date_key = c.row_key
where c.lagging_count_of_month between 0 and 11)b