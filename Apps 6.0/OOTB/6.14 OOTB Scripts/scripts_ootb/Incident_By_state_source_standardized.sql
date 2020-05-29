select d.incident_number as incident, di.source_dimension_name as Incident_State_Source,
di.wh_dimension_name as Incident_state_Standardized
from #DWH_TABLE_SCHEMA.f_incident f
join #DWH_TABLE_SCHEMA.d_incident d
on f.incident_key=d.row_key
and f.soft_deleted_flag<>'Y'
and d.soft_deleted_flag<>'Y'
and d.backlog_flag='Y'
join ldb.d_incident_state di
on d.state_src_key = di.row_key
join #DWH_TABLE_SCHEMA.d_calendar_date dcd
on f.opened_on_key=dcd.row_key
--and dcd.lagging_count_of_month between 0 and 12
join #DWH_TABLE_SCHEMA.d_internal_organization dr_b
on f.assignment_group_key=dr_b.row_key
--group by d.incident_number,di.source_dimension_name,di.wh_dimension_name
order by d.incident_number,di.source_dimension_name,di.wh_dimension_name