select a.source_dimension_name as "Current State",'' as metrics,
	concat(round((max(t.primary_duration)/3600.0),1),' hours') as "Max Duration For State",
	concat(round((min(t.primary_duration)/3600.0),1),' hours') as "Min Duration For State",
	concat(round((avg(t.primary_duration)/3600.0),1),' hours') as "Avg Duration For State",
	concat((round(sum(t.primary_duration)/86400.0,1)),' days')as "State_Duration"
	from #DWH_TABLE_SCHEMA.f_incident f
	left join #DWH_TABLE_SCHEMA.d_incident d on d.row_key = f.incident_key
	left join #DWH_TABLE_SCHEMA.f_incident_activity t on t.task_key = f.incident_key 
	left join #DWH_TABLE_SCHEMA.d_calendar_date DC on t.created_on_key = DC.row_key
	left join 
	(SELECT lov.dimension_name AS source_dimension_name,lov.row_key as row_key
FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'STATE~INCIDENT'
UNION ALL 
 SELECT lov.dimension_name AS source_dimension_name,lov.row_key as row_key
    FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0)a on a.row_key = d.state_src_key
	where
	 DC.lagging_count_of_month between 0 and 12 
	 AND t.task_attribute_wh_name = 'state'
	and f.soft_deleted_flag = 'N' and t.soft_deleted_flag = 'N'
	group by a.source_dimension_name
	order by lower(a.source_dimension_name)