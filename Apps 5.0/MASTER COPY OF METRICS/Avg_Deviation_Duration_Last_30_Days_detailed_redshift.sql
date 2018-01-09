



SELECT a.X/b.Z AS Avg_Deviation_Duration_Last_30_Days
FROM 
(
SELECT (sum(a.planned_duration)/86400.00-sum(a.actual_duration)/86400.00)*1.00 AS X 
FROM ldb.f_change_request a 
JOIN ldb.d_change_request x ON a.change_request_key=x.row_key
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
where b.lagging_count_of_days between 0 and 29
) a 
CROSS JOIN 
( SELECT Count(distinct a.change_request_key) AS Z
FROM ldb.f_change_request a 
JOIN ldb.d_change_request x ON a.change_request_key=x.row_key
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
where b.lagging_count_of_days between 0 and 29
) b 
