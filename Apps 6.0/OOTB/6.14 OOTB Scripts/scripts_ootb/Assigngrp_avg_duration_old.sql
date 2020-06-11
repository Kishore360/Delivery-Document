   select
   coalesce(CG.organization_name, case when F.assignment_group_key is NULL then 'UNSPECIFIED' else 'UNKNOWN' end)  as Current_group,
   concat(trim(to_char(round((avg (t.primary_duration / 3600.0 )),1), '9999999999D9')),' hours') AS avg_duration_for_assignee
   from #DWH_TABLE_SCHEMA.f_incident as F
left join  #DWH_TABLE_SCHEMA.f_t_task_activity T 
on t.task_key = F.incident_key and f.soft_deleted_flag = 'N'::bpchar AND t.soft_deleted_flag = 'N'::bpchar
	left join #DWH_TABLE_SCHEMA.d_internal_organization CG
    on (CG.row_key=F.assignment_group_key)
 join #DWH_TABLE_SCHEMA.d_calendar_date as cal on cal.row_key = t.created_on_key
 and cal.lagging_count_of_month between 0 and 12 
where t.primary_duration is not null 
  and t.task_wh_type::text = 'incident'::text AND (t.task_attribute_wh_name::text = 'assigned_to'::text OR t.task_attribute_wh_name::text = 'assignment_group'::text)
	group by 1
	order by lower (coalesce(CG.organization_name, case when F.assignment_group_key is NULL then 'UNSPECIFIED' else 'UNKNOWN' end))