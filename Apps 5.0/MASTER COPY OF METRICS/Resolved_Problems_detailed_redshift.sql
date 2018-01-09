SELECT 
'Resolved Problems',
count(a.row_key) as Resolved_Problems
from ldb.f_problem_resolved a 
join ldb.d_calendar_date b 
on a.opened_on_key = b.row_key 
join ldb.d_calendar_month c 
on b.month_start_date_key = c.row_key 
where c.lagging_count_of_month between 0 and 11