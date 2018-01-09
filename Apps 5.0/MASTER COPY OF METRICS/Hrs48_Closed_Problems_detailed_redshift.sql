SELECT 
'48Hrs Closed Problems',
count(a.row_key) as Hrs48_Closed_Problems
from ldb.f_problem a 
join ldb.d_problem d
on a.problem_key=d.row_key
join ldb.d_calendar_date b 
on a.opened_on_key = b.row_key 
join ldb.d_calendar_month c 
on b.month_start_date_key = c.row_key 
where d.closed_problem_48hrs_c_flag='Y'
and d.stable_to_rca_c_flag='Y'
and c.lagging_count_of_month between 0 and 11