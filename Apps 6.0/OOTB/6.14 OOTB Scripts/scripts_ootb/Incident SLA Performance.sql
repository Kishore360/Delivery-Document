select dio.organization_name  as "Name",
'' as  metric ,
sum(case when di.multiple_assignment_flag = 'Y'and di.overall_sla_outcome_flag = 'Y' then 1 else 0 end )as "Multiple assignment incidents met all sla",
sum(case when di.multiple_assignment_flag = 'Y'and di.overall_sla_outcome_flag = 'N' then 1 else 0 end )as "Multiple assignment incidents missed any sla",
sum(CASE WHEN di.reopened_flag ='Y' and overall_sla_outcome_flag = 'Y' THEN 1 ELSE 0 end) as "Reopened incidents met all sla",
sum(CASE WHEN di.reopened_flag ='Y' and overall_sla_outcome_flag = 'N' THEN 1 ELSE 0 end) as "Reopened incidents missed any sla"

from #DWH_TABLE_SCHEMA.f_incident fi 
left join #DWH_TABLE_SCHEMA.d_incident di
on  fi.incident_key = di.row_key

 left join #DWH_TABLE_SCHEMA.d_internal_organization dio 
on fi.company_key= dio.row_key
left join #DWH_TABLE_SCHEMA.d_calendar_date dcd
on  fi.opened_on_key = dcd.row_key
left join #DWH_TABLE_SCHEMA.d_calendar_date dcd1
on fi.closed_on_key = dcd1.row_key
left join  #DWH_TABLE_SCHEMA.d_lov  dv 
on fi.state_src_key  = dv.row_key
left join  #DWH_TABLE_SCHEMA.d_lov_map dvm
on dvm.dimension_code  = dv.dimension_code
and dvm.dimension_class=dv.dimension_class
where dcd.lagging_count_of_month between 0 and 12 
group by dio.row_key ,dio.organization_name
order by dio.row_key asc