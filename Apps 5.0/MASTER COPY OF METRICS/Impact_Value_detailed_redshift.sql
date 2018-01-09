SELECT sum(a.impact_value_c) AS Impact_Value
FROM ldb.f_change_request a 
JOIN ldb.d_change_request b ON a.change_request_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where d.lagging_count_of_month between 0 and 11