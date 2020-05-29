select organization_name as "Assignment Group" ,'' as Metrics, 
   concat (round(sum(t.primary_duration),1),' sec')as "State_Duration"
	from #DWH_TABLE_SCHEMA.f_incident f
	join #DWH_TABLE_SCHEMA.d_incident d on d.row_key = f.incident_key
	join #DWH_TABLE_SCHEMA.f_incident_activity t on t.task_key = f.incident_key 
	join #DWH_TABLE_SCHEMA.d_internal_organization INO on INO.row_key = f.assignment_group_key
	join #DWH_TABLE_SCHEMA.d_calendar_date DC on t.created_on_key = DC.row_key
	WHERE t.task_attribute_wh_name = 'state'
	and f.soft_deleted_flag = 'N' and t.soft_deleted_flag = 'N'
	and DC.lagging_count_of_month between 0 and 12 
	group by organization_name
	order by lower(organization_name)