SELECT 
'SLA Business Duration (Days)',
sum(a.sla_business_duration)/86400.0 as SLA_Business_Duration
from ldb.f_problem a 
join ldb.d_calendar_date b 
on a.opened_on_key = b.row_key 
join ldb.d_calendar_month c 
on b.month_start_date_key = c.row_key 
where c.lagging_count_of_month between 0 and 11	