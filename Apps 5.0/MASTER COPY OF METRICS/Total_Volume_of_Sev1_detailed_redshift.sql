SELECT
'Total Volume of Sev1++',
count(a.row_key) as Total_Volume_of_Sev1
from ldb.f_problem a 
join ldb.d_problem d
on a.problem_key=d.row_key
join ldb.d_lov_problem_severity_level_c   e
on (d.severity_level_c_key = e.row_key)
join ldb.d_lov_problem_root_cause_category_c f
on (d.root_cause_category_c_key = f.row_key)
join ldb.d_calendar_date b 
on a.opened_on_key = b.row_key 
join ldb.d_calendar_month c 
on b.month_start_date_key = c.row_key 
where e.source_dimension_name ='1 - Critical'
and f.source_dimension_name in ('EA - System Configuration','EI - System Configuration','Vendor')
and c.lagging_count_of_month between 0 and 11