


select sum(F.age)/count(*) as avg_age,month_name,week_name,quarter_name,year_name,sum(F.age),count(*) 
from #DWH_TABLE_SCHEMA.f_problem F
join #DWH_TABLE_SCHEMA.d_problem D
on(D.row_key=F.problem_key)
join #DWH_TABLE_SCHEMA.d_calendar_date LKP
on(LKP.row_key=F.opened_on_key
and LKP.source_id = 0)
--  where lagging_count_of_month in(0,1)
group by month_name,week_name,quarter_name,year_name;

