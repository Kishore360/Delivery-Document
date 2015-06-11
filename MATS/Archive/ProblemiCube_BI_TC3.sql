

select sum(case when dimension_wh_code='RESOLVED' then 1 else 0 end) closed_problems
,count(*) open_problems
,LKP.location_name
from #DWH_TABLE_SCHEMA.f_problem F
join #DWH_TABLE_SCHEMA.d_problem D
on(D.row_key=F.problem_key)
join #DWH_TABLE_SCHEMA.d_lov L
on(F.state_src_key=L.row_key)
join #DWH_TABLE_SCHEMA.d_lov_map LM
on(LM.src_key=L.row_key)
join #DWH_TABLE_SCHEMA.d_location LKP
on(LKP.row_key=F.location_key)
group by LKP.location_name;

