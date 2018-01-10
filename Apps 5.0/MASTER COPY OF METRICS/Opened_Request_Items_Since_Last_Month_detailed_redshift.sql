SELECT 
'Opened Request Items since Last Month',
count(a.row_key) as Opened_Request_Items_Since_Last_Month
FROM ldb.f_request_item a 
JOIN ldb.d_calendar_date b 
ON a.opened_on_key=b.row_key
where b.lagging_count_of_days between 0 and 29