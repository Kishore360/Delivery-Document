SELECT 
'Request Item Actual Elapsed Time - SLA No Pause C',
sum(a.met_sla_without_pause_duration_c)/3600.0 as RequestItem_Actual_Elapsed_Time_SLA_No_Pause 
FROM ldb.f_request_item a 
JOIN ldb.d_calendar_date b 
ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c
ON b.month_start_date_key = c.row_key
where c.lagging_count_of_month between 0 and 11