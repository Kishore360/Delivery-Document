SELECT 
'Result of Change',
count(a.row_key) as Result_Of_Change_Problems
from ldb.f_problem a 
join ldb.d_problem d
on a.problem_key=d.row_key
join ldb.d_calendar_date b 
on a.opened_on_key = b.row_key 
join ldb.d_calendar_month c 
on b.month_start_date_key = c.row_key 
where d.closed_problem_48hrs_c_flag='Y'
and d.result_of_change_c_flag='Y'
and c.lagging_count_of_month between 0 and 11