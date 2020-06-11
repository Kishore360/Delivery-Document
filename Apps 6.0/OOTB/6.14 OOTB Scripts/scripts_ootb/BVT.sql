select dio.organization_name as "Assignment group" ,
'' as Metrics,
 trim(to_char(count(fi.row_key),'999,999,990')) as "All Incidents"
from  #DWH_TABLE_SCHEMA.f_incident fi 
join #DWH_TABLE_SCHEMA.d_internal_contact dc
on  fi.opened_by_key = dc.row_key
join #DWH_TABLE_SCHEMA.d_incident di
on  fi.incident_key = di.row_key
join #DWH_TABLE_SCHEMA.d_calendar_date dcd
on  fi.opened_on_key = dcd.row_key
 join #DWH_TABLE_SCHEMA.d_internal_organization dio 
on fi.assignment_group_key = dio.row_key
--join #DWH_TABLE_SCHEMA.d_calendar_date dcd
--on  fi.opened_on_key = dcd.row_key
join  #DWH_TABLE_SCHEMA.d_lov  dv 
on fi.state_src_key  = dv.row_key
join  #DWH_TABLE_SCHEMA.d_lov_map dvm
on dvm.dimension_code  = dv.dimension_code
and dvm.dimension_class=dv.dimension_class
join #DWH_TABLE_SCHEMA.d_domain dom
on dom.row_key = fi.domain_key
where dcd.lagging_count_of_month between 0 and 12 
and  fi.soft_deleted_flag = 'N' 
group by  dio.organization_name
order by  LOWER(dio.organization_name) asc