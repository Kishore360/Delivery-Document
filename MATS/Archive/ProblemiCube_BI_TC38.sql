


select  count(*) open_problems
, sum(case when linked_incident_flag= 'Y' then 1 else 0 end) problem_linked_incident
, sum(case when linked_incident_flag= 'Y' then 0 else 1 end) problem_without_linked_incident
,month_name,week_name,quarter_name,year_name
from #DWH_TABLE_SCHEMA.f_problem F
join #DWH_TABLE_SCHEMA.d_problem D
on(D.row_key=F.problem_key)
join #DWH_TABLE_SCHEMA.d_calendar_date LKP
on(LKP.row_key=F.opened_on_key
and LKP.source_id = 0)
group by month_name,week_name,quarter_name,year_name;

