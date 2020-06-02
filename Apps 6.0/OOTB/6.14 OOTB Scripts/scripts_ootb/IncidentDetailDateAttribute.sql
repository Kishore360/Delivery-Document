select dcd.calendar_date as "Date" , dcd.day_name as "Day Name" , dcd.day_of_month as "Day of month" , dcd.day_of_week "DAY OF WEEK",
dcd.day_of_year "DAY OF YEAR" , dct.hour_24_format_num as "hour_" , dcd.week_day_flag as "week day flag" , dcd.week_number_of_year as "calendar week"
from  #DWH_TABLE_SCHEMA.f_incident fi 
join #DWH_TABLE_SCHEMA.d_internal_contact dc
on  fi.opened_by_key = dc.row_key
join #DWH_TABLE_SCHEMA.d_incident di
on  fi.incident_key = di.row_key
join #DWH_TABLE_SCHEMA.d_calendar_date dcd
on  fi.opened_on_key = dcd.row_key
 join #DWH_TABLE_SCHEMA.d_internal_organization dio 
on fi.assignment_group_key = dio.row_key
join  #DWH_TABLE_SCHEMA.d_lov  dv 
on fi.state_src_key  = dv.row_key
join  #DWH_TABLE_SCHEMA.d_lov_map dvm
on dvm.dimension_code  = dv.dimension_code
and dvm.dimension_class=dv.dimension_class
join #DWH_TABLE_SCHEMA.d_domain dom
on dom.row_key = fi.domain_key
join #DWH_TABLE_SCHEMA.d_calendar_time dct
on fi.opened_time_key = dct.row_key
where dcd.lagging_count_of_month between 0 and 12
