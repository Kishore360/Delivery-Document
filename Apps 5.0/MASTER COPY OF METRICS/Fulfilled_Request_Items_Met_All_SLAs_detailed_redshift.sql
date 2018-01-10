SELECT 
'Fulfilled Request Items Met All SLAs',
count(a.row_key) as Fulfilled_Request_Items_Met_All_SLAs 
FROM ldb.f_request_item_fulfilled_c a 
JOIN ldb.d_request_item d
on a.request_item_key=d.row_key
JOIN ldb.d_calendar_date b1 
ON a.opened_on_key=b1.row_key
JOIN ldb.d_calendar_month c
ON b1.month_start_date_key = c.row_key
where c.lagging_count_of_month between 0 and 11
and d.met_sla_flag='Y'