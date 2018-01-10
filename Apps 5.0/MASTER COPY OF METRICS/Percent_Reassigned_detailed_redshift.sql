SELECT a.X/b.Y AS Percent_Reassigned
FROM 
(SELECT 
sum(a.reassignment_count) as X
FROM ldb.f_request_item a 
JOIN ldb.d_calendar_date b 
ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c
ON b.month_start_date_key = c.row_key
where c.lagging_count_of_month between 0 and 11
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
where c.lagging_count_of_month between 0 and 11)b