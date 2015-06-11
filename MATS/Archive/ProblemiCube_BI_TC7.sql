


select sum(case when dimension_wh_code='RESOLVED' then 1 else 0 end) closed_problems,count(*) open_problems, STR_TO_DATE(due_on_key,'%Y%m%d') as due-date
from #DWH_TABLE_SCHEMA.f_problem F
join #DWH_TABLE_SCHEMA.d_problem D
on(D.row_key=F.problem_key)
join #DWH_TABLE_SCHEMA.d_lov L
on(F.state_src_key=L.row_key)
join #DWH_TABLE_SCHEMA.d_lov_map LM
on(LM.src_key=L.row_key)
join #DWH_TABLE_SCHEMA.d_calendar_date LKP
on(LKP.row_key=F.due_on_key
and LKP.source_id = 0)
--  where STR_TO_DATE(due_on_key,'%Y%m%d') > date_format(now(),'%Y%m%d')-300
group by STR_TO_DATE(due_on_key,'%Y%m%d');

