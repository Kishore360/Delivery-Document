


select count(*) closed_problems,month_name,week_name,quarter_name,year_name
from #DWH_TABLE_SCHEMA.f_problem F
join #DWH_TABLE_SCHEMA.d_problem D
on(D.row_key=F.problem_key)
join #DWH_TABLE_SCHEMA.d_lov L
on(F.state_src_key=L.row_key)
join #DWH_TABLE_SCHEMA.d_lov_map LM
on(LM.src_key=L.row_key)
join #DWH_TABLE_SCHEMA.d_calendar_date LKP
on(LKP.row_key=F.opened_on_key
and LKP.source_id = 0)
where LM.dimension_wh_code='RESOLVED'
group by month_name,week_name,quarter_name,year_name;

