select t_state.source_dimension_name Old_State,'' as metrics,
	concat(round((avg(t.primary_duration)),1),' sec') as "Avg Duration For State"
	from #DWH_TABLE_SCHEMA.f_incident f
	join #DWH_TABLE_SCHEMA.d_incident d on d.row_key = f.incident_key
	join #DWH_TABLE_SCHEMA.f_incident_activity t on t.task_key = f.incident_key 
	join #DWH_TABLE_SCHEMA.d_calendar_date DC on t.created_on_key = DC.row_key
	join (SELECT lov.dimension_name AS source_dimension_name,lov.row_key as row_key
     FROM #DWH_TABLE_SCHEMA.d_lov lov
     LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
     JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'STATE~INCIDENT'
     UNION ALL 
     SELECT lov.dimension_name AS source_dimension_name,lov.row_key as row_key
     FROM #DWH_TABLE_SCHEMA.d_lov lov
     WHERE lov.row_key = -1 OR lov.row_key = 0) t_state
	on t_state.row_key = t.task_attribute_wh_new_value_key
	where
	 DC.lagging_count_of_month between 0 and 12 
	 AND t.task_attribute_wh_name = 'state'
	and f.soft_deleted_flag = 'N' and t.soft_deleted_flag = 'N'
	group by Old_State
	order by upper(t_state.source_dimension_name)