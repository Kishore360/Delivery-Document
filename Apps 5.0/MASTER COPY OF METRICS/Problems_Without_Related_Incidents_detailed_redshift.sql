SELECT 'Problems Without Related Incidents',
count(a.row_key) as Problems_Without_Related_Incidents
from ldb.f_problem a 
join ldb.d_problem d
on a.problem_key=d.row_key
join ldb.d_calendar_date b 
on a.opened_on_key = b.row_key 
join ldb.d_calendar_month c 
on b.month_start_date_key = c.row_key 
where d.linked_incident_flag='N'
and c.lagging_count_of_month between 0 and 11