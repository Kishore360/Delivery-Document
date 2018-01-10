SELECT a.X/b.Y AS Request_Item_Resolution_Percent
FROM 
(
SELECT count(a.row_key) as X 
FROM ldb.f_request_item_fulfilled_c a 
JOIN ldb.d_request_item d
on a.request_item_key=d.row_key
JOIN ldb.d_calendar_date b1 
ON a.opened_on_key=b1.row_key
JOIN ldb.d_calendar_month c
ON b1.month_start_date_key = c.row_key
where c.lagging_count_of_month between 0 and 11
and d.met_sla_flag='Y'
)a
CROSS JOIN
(
SELECT 
count(a.row_key) as Y 
FROM ldb.f_request_item_fulfilled_c a 
JOIN ldb.d_calendar_date b1 
ON a.opened_on_key=b1.row_key
JOIN ldb.d_calendar_month c
ON b1.month_start_date_key = c.row_key
where c.lagging_count_of_month between 0 and 11)b