


select sum(F.open_to_close_duration)/count(*) as avg_open_to_close_duration,organization_name as assignment_group, sum(F.open_to_close_duration),count(*) 
from #DWH_TABLE_SCHEMA.f_problem F
join #DWH_TABLE_SCHEMA.d_problem D
on(D.row_key=F.problem_key)
join #DWH_TABLE_SCHEMA.d_internal_organization LKP
on(LKP.row_key=F.assignment_group_key)
--  where lagging_count_of_month in(0,1)
group by organization_name;

