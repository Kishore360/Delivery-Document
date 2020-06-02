select dr_b.organization_name as assigned_group,
round((avg((f.dormancy_age / 86400.0))),1)  as avg_Days_since_last_update,
round((avg((f.age / 86400.0))),1) as Avg_Incident_age_Current_Open_incident
from #DWH_TABLE_SCHEMA.f_incident f
join #DWH_TABLE_SCHEMA.d_incident d
on f.incident_key=d.row_key
and f.soft_deleted_flag<>'Y'
and d.soft_deleted_flag<>'Y'
and d.backlog_flag='Y'
join  #DWH_TABLE_SCHEMA.d_internal_organization dr_b
on f.assignment_group_key=dr_b.row_key
join #DWH_TABLE_SCHEMA.d_calendar_date dcd
on f.opened_on_key=dcd.row_key
and dcd.lagging_count_of_month between 0 and 12
where dr_b.organization_name not in ('UNSPECIFIED','UNKNOWN')
group by dr_b.organization_name
order by dr_b.organization_name