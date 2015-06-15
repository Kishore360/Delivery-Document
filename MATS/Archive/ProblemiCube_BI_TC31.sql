


select count(*) open_problems
, sum(case when knowledge_flag= 'Y' then 0 else 1 end) knowledge_problems
, sum(case when backlog_flag= 'Y' then 0 else 1 end) backlog_problems
, sum(case when known_error_flag= 'Y' then 0 else 1 end) know_error_problems
, sum(case when dormant_flag= 'Y' then 0 else 1 end) dormant_problems
,organization_name as assignment_group 
from #DWH_TABLE_SCHEMA.f_problem F
join #DWH_TABLE_SCHEMA.d_problem D
on(D.row_key=F.problem_key)
join #DWH_TABLE_SCHEMA.d_internal_organization LKP
on(LKP.row_key=F.assignment_group_key)
join #DWH_TABLE_SCHEMA.d_lov L
on(F.state_src_key=L.row_key)
join #DWH_TABLE_SCHEMA.d_lov_map LM
on(LM.src_key=L.row_key)
group by organization_name;

