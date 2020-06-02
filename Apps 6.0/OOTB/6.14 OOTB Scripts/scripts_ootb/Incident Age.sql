select  
dio.organization_name as "Assignment group",
'' as Metrics,
(case when sum(fi.age)= 0 Then ' days' else concat(round(cast(sum(fi.age)as float)/cast(count(fi.row_key)as float),0),' days') end )as "avg of incident age"
from  #DWH_TABLE_SCHEMA.f_incident fi 
 join #DWH_TABLE_SCHEMA.d_internal_organization dio 
on fi.assignment_group_key = dio.row_key
left join #DWH_TABLE_SCHEMA.d_incident di
on  fi.incident_key = di.row_key
left join #DWH_TABLE_SCHEMA.d_calendar_date dcd
on  fi.opened_on_key = dcd.row_key
where dcd.lagging_count_of_month between 0 and 12
 and fi.soft_deleted_flag = 'N'
group by dio.organization_name
order by lower(dio.organization_name)