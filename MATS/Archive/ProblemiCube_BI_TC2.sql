


select sum(case when dimension_wh_code='RESOLVED' then 1 else 0 end) closed_problems
,count(*) open_problems
, LKP.full_name as assigned_to
from #DWH_TABLE_SCHEMA.f_problem F
join #DWH_TABLE_SCHEMA.d_problem D
on(D.row_key=F.problem_key)
join #DWH_TABLE_SCHEMA.d_lov L
on(F.state_src_key=L.row_key)
join #DWH_TABLE_SCHEMA.d_lov_map LM
on(LM.src_key=L.row_key)
join #DWH_TABLE_SCHEMA.d_internal_contact LKP
on(LKP.row_key=F.assigned_to_key)
group by  LKP.full_name;

