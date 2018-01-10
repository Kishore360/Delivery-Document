
SELECT 
'Met SLA No Pause',
count(a.row_key) as Met_SLA_No_Pause 
FROM ldb.f_request_item a 
JOIN ldb.d_request_item d
on a.request_item_key=d.row_key
JOIN ldb.d_calendar_date b1 
ON a.opened_on_key=b1.row_key
JOIN ldb.d_calendar_month c
ON b1.month_start_date_key = c.row_key
where c.lagging_count_of_month between 0 and 11
and d.met_resolution_with_pause_sla_c_flag='Y'