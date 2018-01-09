

SELECT a.X/b.Z AS Avg_Days_since_Last_Update
FROM 
(SELECT (sum(a.dormancy_age)/86400.00)*1.00 AS X
FROM ldb.f_change_request a 
JOIN ldb.d_change_request x ON a.change_request_key=x.row_key
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
where c.lagging_count_of_month between 0 and 11 
and x.backlog_flag='Y') a
CROSS JOIN 
(
SELECT (Count(distinct a.change_request_key))*1.00 as Z
FROM ldb.f_change_request a 
JOIN ldb.d_change_request x ON a.change_request_key=x.row_key
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
where c.lagging_count_of_month between 0 and 11 
and x.backlog_flag='Y'
) b 