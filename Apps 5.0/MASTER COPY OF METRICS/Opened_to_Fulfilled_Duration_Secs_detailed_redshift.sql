
SELECT 
'Opened to Fulfilled Duration (Secs)',
sum(a.fulfillment_time_c) as Opened_to_Fulfilled_Duration_Secs 
FROM ldb.f_request_item_closed_c a 
JOIN ldb.d_calendar_date b 
ON a.closed_on_key=b.row_key
JOIN ldb.d_calendar_month c
ON b.month_start_date_key = c.row_key
where c.lagging_count_of_month between 0 and 11