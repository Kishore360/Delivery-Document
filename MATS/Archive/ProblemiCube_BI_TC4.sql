
select sum(case when dimension_wh_code='RESOLVED' then 1 else 0 end) closed_problems
,count(*) open_problems
,LKP.organization_name as assignment_group
,LKP1.organization_name as assignment_group1,LKP2.organization_name as assignment_group2
,LKP3.organization_name as assignment_group3,LKP4.organization_name as assignment_group4
,count(*)
from #DWH_TABLE_SCHEMA.f_problem F
join #DWH_TABLE_SCHEMA.d_problem D
on(D.row_key=F.problem_key)
join #DWH_TABLE_SCHEMA.d_lov L
on(F.state_src_key=L.row_key)
join #DWH_TABLE_SCHEMA.d_lov_map LM
on(LM.src_key=L.row_key)
join #DWH_TABLE_SCHEMA.d_internal_organization LKP
on(LKP.row_key=F.assignment_group_key)
join #DWH_TABLE_SCHEMA.d_h_all_hierarchies AGH
 ON LKP.row_key=AGH.lev_0_key
left join #DWH_TABLE_SCHEMA.d_internal_organization LKP1
 ON LKP1.row_key=AGH.lev_1_key
left join #DWH_TABLE_SCHEMA.d_internal_organization LKP2
 ON LKP2.row_key=AGH.lev_2_key
left join #DWH_TABLE_SCHEMA.d_internal_organization LKP3
 ON LKP3.row_key=AGH.lev_3_key
left join #DWH_TABLE_SCHEMA.d_internal_organization LKP4
 ON LKP4.row_key=AGH.lev_4_key
 where  AGH.hierarchy_class='ASSIGNMENT GROUP TIER'
group by  LKP.organization_name;

