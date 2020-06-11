select dio.organization_name as "Assignment group" ,''as metric,
trim(to_char(sum(case when di.backlog_flag ='Y'then 1 else 0 end ),'999,999,990'))as "backlog incidents",
sum(case when dvm.dimension_wh_code = 'CLOSED' then 1 else 0 end) as "Closed Incidents",
--trim(to_char(sum(case when dvm.dimension_wh_code ='OPEN'then 1 else 0 end ),'999,999,990'))as "current open",
concat(round(cast(sum(CASE WHEN dvm.dimension_wh_code = 'OPEN' THEN 1 ELSE 0 end)as numeric)/
cast(count(fi.row_key)as numeric) *100 :: integer),'%') as "percentage current open",
sum(case when di.dormant_flag = 'Y'then 1 else 0 end ) as "dormant incidents"
from #DWH_TABLE_SCHEMA.f_incident fi 
left join #DWH_TABLE_SCHEMA.d_internal_contact dc
on  fi.opened_by_key = dc.row_key
left join #DWH_TABLE_SCHEMA.d_incident di
on  fi.incident_key = di.row_key
left join #DWH_TABLE_SCHEMA.d_calendar_date dcd
on  fi.opened_on_key = dcd.row_key
 left join #DWH_TABLE_SCHEMA.d_internal_organization dio 
on fi.assignment_group_key = dio.row_key
left join #DWH_TABLE_SCHEMA.d_lov  dv 
on fi.state_src_key  = dv.row_key
left join #DWH_TABLE_SCHEMA.d_lov_map dvm
on dvm.dimension_code  = dv.dimension_code
and dvm.dimension_class=dv.dimension_class
--join #DWH_TABLE_SCHEMA.d_domain dom
--on dom.row_key = fi.domain_key
--left join #DWH_TABLE_SCHEMA.d_h_all_hierarchies dh
--on dh.lev_0_key = dio.row_key and dh.hierarchy_class='ASSIGNMENT GROUP TYPE'
--left join #DWH_TABLE_SCHEMA.d_h_all_hierarchies dh_1
--on dh_1.lev_0_key = dio.row_key and dh_1.hierarchy_class='ASSIGNMENT GROUP TIER'
where dcd.lagging_count_of_month between 0 and 12 
and fi.soft_deleted_flag = 'N'
group by  dio.organization_name -- dh.lev_1_id , dh_1.lev_1_id
order by lower(dio.organization_name) asc