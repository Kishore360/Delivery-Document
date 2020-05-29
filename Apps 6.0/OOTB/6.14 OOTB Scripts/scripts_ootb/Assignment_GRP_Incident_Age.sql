select dr_b.organization_name as assigned_group,max(d.incident_number) as incident,d.age as incident_age,
count(d.incident_number)   as incident_backlog
from #DWH_TABLE_SCHEMA.f_incident f
join #DWH_TABLE_SCHEMA.d_incident d
on f.incident_key=d.row_key
and f.soft_deleted_flag<>'Y'
and d.soft_deleted_flag<>'Y'
and d.backlog_flag='Y'
join #DWH_TABLE_SCHEMA.d_internal_organization dr_b
on f.assignment_group_key=dr_b.row_key
where dr_b.organization_name not in ('UNSPECIFIED','UNKNOWN')
group by dr_b.organization_name,d.incident_number,d.age
order by dr_b.organization_name,d.incident_number,d.age