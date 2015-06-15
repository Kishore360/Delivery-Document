



select count(*) closed_problems
, sum(case when met_sla_flag= 'Y' then 0 else 1 end) closed_problems_missed_sla
, sum(case when met_sla_flag= 'Y' then 1 else 0 end)  closed_problems_met_sla,
organization_name as department_name 
from #DWH_TABLE_SCHEMA.f_problem F
join #DWH_TABLE_SCHEMA.d_problem D
on(D.row_key=F.problem_key)
join #DWH_TABLE_SCHEMA.d_internal_organization LKP
on(LKP.row_key=F.opened_by_department_key)
join #DWH_TABLE_SCHEMA.d_lov L
on(F.state_src_key=L.row_key)
join #DWH_TABLE_SCHEMA.d_lov_map LM
on(LM.src_key=L.row_key)
where LM.dimension_wh_code='RESOLVED'
group by organization_name;

