SELECT 
'Opened Problems Missed SLA',
count(a.row_key) as Open_Problems_Missed_SLA
from ldb.f_problem a 
join ldb.d_problem d
on a.problem_key=d.row_key
join ldb.d_problem_state e
on a.state_src_key = e.row_key 
join ldb.d_calendar_date b 
on a.opened_on_key = b.row_key 
join ldb.d_calendar_month c 
on b.month_start_date_key = c.row_key 
where e.wh_dimension_name='OPEN'
and d.met_sla_flag='N'
and c.lagging_count_of_month between 0 and 11