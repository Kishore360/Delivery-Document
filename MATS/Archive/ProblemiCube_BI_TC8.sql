


select sum(case when dimension_wh_code='RESOLVED' then 1 else 0 end) closed_problems,count(*) open_problems,met_sla_flag,knowledge_flag,over_due_flag
from #DWH_TABLE_SCHEMA.f_problem F
join #DWH_TABLE_SCHEMA.d_problem D
on(D.row_key=F.problem_key)
join #DWH_TABLE_SCHEMA.d_lov L
on(F.state_src_key=L.row_key)
join #DWH_TABLE_SCHEMA.d_lov_map LM
on(LM.src_key=L.row_key)
group by met_sla_flag,knowledge_flag,over_due_flag;

