SELECT sum(a.planned_outage_duration_c)/86400.00 AS Planned_Outage_Duration_Days
FROM ldb.f_change_request a 
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
where c.lagging_count_of_month between 0 and 11 
