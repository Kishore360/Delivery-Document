



select sum(F.linked_incident_count)/count(*) as avg_related_incident_count,organization_name,dimension_wh_code as priority,sum(F.linked_incident_count)
from #DWH_TABLE_SCHEMA.f_problem F
join #DWH_TABLE_SCHEMA.d_problem D
on(D.row_key=F.problem_key)
join #DWH_TABLE_SCHEMA.d_lov L
on(F.priority_src_key=L.row_key)
join #DWH_TABLE_SCHEMA.d_lov_map LM
on(LM.src_key=L.row_key)
join #DWH_TABLE_SCHEMA.d_internal_organization LKP
on(LKP.row_key=F.assignment_group_key)
--  where lagging_count_of_month in(0,1)
group by organization_name;

