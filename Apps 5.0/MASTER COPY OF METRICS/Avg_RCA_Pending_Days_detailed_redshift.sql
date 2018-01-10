SELECT 
'Average RCA Pending (Days)',
sum(a.rca_pending_calendar_days_c)/count(a.row_key) as Avg_RCA_Pending_Days
FROM ldb.f_problem a 
JOIN ldb.d_calendar_date b 
ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c
ON b.month_start_date_key = c.row_key
where c.lagging_count_of_month between 0 and 11