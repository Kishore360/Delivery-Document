
SELECT 
'Avg RITM Overdue Duration Days',
(sum(a.overdue_duration)/86400.0)/count(a.row_key) as Avg_RITM_Overdue_Duration_Days 
FROM ldb.f_request_item a 
JOIN ldb.d_request_item d
on a.request_item_key=d.row_key
JOIN ldb.d_calendar_date b 
ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c
ON b.month_start_date_key = c.row_key
where  d.over_due_flag='Y'
and c.lagging_count_of_month between 0 and 11