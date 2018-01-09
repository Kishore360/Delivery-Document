SELECT
'Vendor Related Outage Duration (days)',
count(a.outage_duration_c)/86400.0 as Vendor_Related_Outage_Duration
from ldb.f_problem a 
join ldb.d_problem d
on a.problem_key=d.row_key
join ldb.d_lov_problem_root_cause_category_c f
on (d.root_cause_category_c_key = f.row_key)
join ldb.d_calendar_date b 
on a.opened_on_key = b.row_key 
join ldb.d_calendar_month c 
on b.month_start_date_key = c.row_key 
where f.source_dimension_name like '%Vendor%'
and c.lagging_count_of_month between 0 and 11