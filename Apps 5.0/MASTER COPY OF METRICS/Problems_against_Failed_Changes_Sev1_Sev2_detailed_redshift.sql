SELECT
'Failed Changes Sev 1 & 2++',
count(a.row_key) as Problems_against_Failed_Changes_Sev1_Sev2
from ldb.f_problem a 
join ldb.d_problem d
on a.problem_key=d.row_key
join ldb.d_lov_problem_severity_level_c   e
on (d.severity_level_c_key = e.row_key)
join ldb.d_calendar_date b 
on a.opened_on_key = b.row_key 
join ldb.d_calendar_month c 
on b.month_start_date_key = c.row_key 
where e.source_dimension_name in ('1 - Critical','2 - High')
and d.result_of_change_c_flag='Y'
and c.lagging_count_of_month between 0 and 11