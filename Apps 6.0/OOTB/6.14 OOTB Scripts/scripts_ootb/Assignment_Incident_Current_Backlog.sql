select dr_a.full_name as assigned_to,d.incident_number as incident,
lov_priority.dimension_name as Priority, lov_priority.dimension_code as Incident_priority_code,
d.short_description as Incident_short_Description, count(1) 
from #DWH_TABLE_SCHEMA.f_incident f
join #DWH_TABLE_SCHEMA.d_incident d
on f.incident_key=d.row_key
and f.soft_deleted_flag<>'Y'
and d.soft_deleted_flag<>'Y'
and d.backlog_flag='Y'
join #DWH_TABLE_SCHEMA.d_internal_contact dr_a
on f.assigned_to_key=dr_a.row_key
join 
(select d2.* from
#DWH_TABLE_SCHEMA.d_lov d2
where dimension_class='PRIORITY~INCIDENT'
union
select d2.* from
#DWH_TABLE_SCHEMA.d_lov d2
where row_key in (0,-1)
) lov_priority
on f.priority_src_key=lov_priority.row_key
group by dr_a.full_name,d.incident_number,lov_priority.dimension_name,lov_priority.dimension_code,d.short_description
order by dr_a.full_name,d.incident_number,lov_priority.dimension_name,lov_priority.dimension_code,d.short_description