SELECT 
'All Problem Tasks',
sum(a.problem_tasks_count) as All_Problem_Tasks
from ldb.f_problem a 
join ldb.d_calendar_date b 
on a.opened_on_key = b.row_key 
join ldb.d_calendar_month c 
on b.month_start_date_key = c.row_key 
where c.lagging_count_of_month between 0 and 11