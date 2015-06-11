



select sum(F.age)/count(*) as avg_age,organization_name,LMP.dimension_wh_code as priority,LMS.dimension_wh_code as state,sum(F.age),count(*) 
from #DWH_TABLE_SCHEMA.f_problem F
join #DWH_TABLE_SCHEMA.d_problem D
on(D.row_key=F.problem_key)
join #DWH_TABLE_SCHEMA.d_lov LP
on(F.priority_src_key=LP.row_key)
join #DWH_TABLE_SCHEMA.d_lov_map LMP
on(LMP.src_key=LP.row_key)
join #DWH_TABLE_SCHEMA.d_lov LS
on(F.state_src_key=LS.row_key)
join #DWH_TABLE_SCHEMA.d_lov_map LMS
on(LMS.src_key=LS.row_key)
join #DWH_TABLE_SCHEMA.d_internal_organization LKP
on(LKP.row_key=F.assignment_group_key)
--  where lagging_count_of_month in(0,1)
group by organization_name;

