select 
dio.organization_name as assignment_group
,dio1.organization_name as assignment_group1,dio2.organization_name as assignment_group2
,dio3.organization_name as assignment_group3,dio4.organization_name as assignment_group4,
dp.backlog_flag as 	"Problem Backlog"
,''as metric ,
count(case when dp.dormant_flag = 'Y'then 1 else 0 end )as "Dormant problems",
count(case when dp.backlog_flag = 'Y'then 1 else 0 end) as " Problem Backlog",
count(case when dp.over_due_flag ='Y'then 1 else 0 end )as "overdue Problems",
concat(round(cast(sum(CASE WHEN  dp.over_due_flag = 'Y' THEN 1 ELSE 0 end)as numeric)/
cast(count(fp.row_key)as numeric) *100 :: integer),'%')as "Over due Problem Percent"
from #DWH_TABLE_SCHEMA.f_problem fp
left join #DWH_TABLE_SCHEMA.d_problem dp
on(dp.row_key=fp.problem_key)
left join #DWH_TABLE_SCHEMA.d_lov dv
on(fp.state_src_key=dv.row_key)
left join #DWH_TABLE_SCHEMA.d_lov_map dvm
on(dvm.src_key=dv.row_key)
left join #DWH_TABLE_SCHEMA.d_internal_organization dio
on(dio.row_key=fp.assignment_group_key)
left join #DWH_TABLE_SCHEMA.d_h_all_hierarchies dah
 ON dio.row_key=dah.lev_0_key
left join #DWH_TABLE_SCHEMA.d_internal_organization dio1
 ON dio1.row_key=dah.lev_1_key
left join #DWH_TABLE_SCHEMA.d_internal_organization dio2
 ON dio2.row_key=dah.lev_2_key
left join #DWH_TABLE_SCHEMA.d_internal_organization dio3
 ON dio3.row_key=dah.lev_3_key
left join #DWH_TABLE_SCHEMA.d_internal_organization dio4
 ON dio4.row_key=dah.lev_4_key
 where  dah.hierarchy_class='ASSIGNMENT GROUP TIER'
group by  dio.organization_name,dio1.organization_name,dio2.organization_name,dio3.organization_name,dio4.organization_name,dp.backlog_flag;

