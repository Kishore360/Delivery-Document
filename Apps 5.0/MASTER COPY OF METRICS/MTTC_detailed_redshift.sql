SELECT 
'MTTC',
(SUM(a.open_to_close_duration/86400.0)/count(a.row_key)) as MTTC
FROM ldb.f_problem_resolved a 
join ldb.d_problem d
on a.problem_key=d.row_key
join ldb.d_problem_state e
on a.state_src_key = e.row_key
JOIN ldb.d_calendar_date b 
ON a.closed_on_key=b.row_key
JOIN ldb.d_calendar_month c
ON b.month_start_date_key = c.row_key
where e.wh_dimension_name='CLOSED'
and c.lagging_count_of_month between 0 and 11