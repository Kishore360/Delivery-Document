SELECT COUNT(a.row_key) AS Change_Task_Count
FROM ldb.f_change_request_planned_end_date a 
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
where b.lagging_count_of_month between -24 and 12
