SELECT count(a.row_key)
FROM ldb.f_request_task a 
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
join ldb.d_sc_task_state a110 
on (a.state_src_key = a110.row_key) 
where b.lagging_count_of_month between 0 and 12 and
a110.wh_dimension_code='OPEN'