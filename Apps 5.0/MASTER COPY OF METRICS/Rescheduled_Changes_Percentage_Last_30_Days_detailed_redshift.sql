SELECT a.X/b.Y*100.00 AS Rescheduled_Changes_Percentage_Last_30_Days
FROM 
(SELECT count(a.change_request_key)*1.00 AS X 
FROM ldb.f_change_request a 
JOIN ldb.d_change_request d ON a.change_request_key=d.row_key
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
Where d.rescheduled_flag='Y'
and b.lagging_count_of_days between 0 and 29 
) a 
CROSS JOIN 
( 
SELECT count(a.change_request_key)*1.00 AS Y 
FROM ldb.f_change_request a 
JOIN ldb.d_change_request d ON a.change_request_key=d.row_key
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
Where b.lagging_count_of_days between 0 and 29 
) b 