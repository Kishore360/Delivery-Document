


select (sum(case when met_sla_flag= 'Y' then 1 else 0 end)/count(*))*100,LMP.dimension_wh_code as priority,count(*) 
from #DWH_TABLE_SCHEMA.f_problem F
join #DWH_TABLE_SCHEMA.d_problem D
on(D.row_key=F.problem_key)
join #DWH_TABLE_SCHEMA.d_lov LP
on(F.priority_src_key=LP.row_key)
join #DWH_TABLE_SCHEMA.d_lov_map LMP
on(LMP.src_key=LP.row_key)
join #DWH_TABLE_SCHEMA.d_lov L
on(F.state_src_key=L.row_key)
join #DWH_TABLE_SCHEMA.d_lov_map LM
on(LM.src_key=L.row_key)
where LM.dimension_wh_code='RESOLVED'
group by LMP.dimension_wh_code;

