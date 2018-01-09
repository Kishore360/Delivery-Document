SELECT Sum(a.level_modified_c) AS Level_Modified
FROM ldb.f_change_request a 
JOIN ldb.d_change_request d ON a.change_request_key=d.row_key
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
Where c.lagging_count_of_month between 0 and 11