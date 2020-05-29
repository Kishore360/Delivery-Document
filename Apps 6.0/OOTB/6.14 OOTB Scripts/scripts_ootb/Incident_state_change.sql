select d.row_key incident,
old_state.source_dimension_name old_state, 
new_state.source_dimension_name new_state,
d.major_incident_flag as Major_Incident, 
to_char(DC.calendar_date  ,'MM/DD') as date,
curr_state.source_dimension_name current_state,
d.state_count inc_st_cnt,
priority.source_dimension_name task_priority, 
'' as metrics,
max(d.state_count) as state_count,
concat (round(sum(t.primary_duration),0),' sec')as "State_Duration"

from #DWH_TABLE_SCHEMA.d_incident d

join #DWH_TABLE_SCHEMA.f_incident f on f.incident_key = d.row_key

join #DWH_TABLE_SCHEMA.f_incident_activity t on t.task_key = f.incident_key 

join #DWH_TABLE_SCHEMA.d_internal_organization INO on INO.row_key = f.assignment_group_key

join #DWH_TABLE_SCHEMA.d_calendar_date DC on t.created_on_key = DC.row_key

join
	(SELECT lov.row_key as row_key, lov.dimension_name AS source_dimension_name
     FROM #DWH_TABLE_SCHEMA.d_lov lov
     LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
     JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class::text = 'STATE~INCIDENT'::text
     UNION ALL 
     SELECT lov.row_key, lov.dimension_name AS source_dimension_name
     FROM #DWH_TABLE_SCHEMA.d_lov lov
     WHERE lov.row_key = -1 OR lov.row_key = 0) old_state 
on old_state.row_key = t.task_attribute_wh_new_value_key

join 
   (SELECT lov.row_key as row_key, lov.dimension_name AS source_dimension_name
    FROM #DWH_TABLE_SCHEMA.d_lov lov
    LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
    JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class::text = 'STATE~INCIDENT'::text
    UNION ALL 
    SELECT lov.row_key, lov.dimension_name AS source_dimension_name
    FROM #DWH_TABLE_SCHEMA.d_lov lov
    WHERE lov.row_key = -1 OR lov.row_key = 0) new_state 
on new_state.row_key  = t.task_attribute_wh_next_value_key

join 
   (SELECT lov.dimension_name AS source_dimension_name,lov.row_key as row_key
    FROM #DWH_TABLE_SCHEMA.d_lov lov
    LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
    JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'STATE~INCIDENT'
    UNION ALL 
    SELECT lov.dimension_name AS source_dimension_name,lov.row_key as row_key
    FROM #DWH_TABLE_SCHEMA.d_lov lov
    WHERE lov.row_key = -1 OR lov.row_key = 0) curr_state
on curr_state.row_key = d.state_src_key

join
  ( SELECT lov.row_key, lov.dimension_name AS source_dimension_name
    FROM #DWH_TABLE_SCHEMA.d_lov lov
    LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
    JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class::text = 'PRIORITY~INCIDENT'::text
    UNION 
    SELECT lov.row_key, lov.dimension_name AS source_dimension_name
    FROM #DWH_TABLE_SCHEMA.d_lov lov
    WHERE lov.row_key = -1 OR lov.row_key = 0) priority
on priority.row_key = f.priority_src_key

	where  t.task_attribute_wh_name = 'state'
	and f.soft_deleted_flag = 'N' and t.soft_deleted_flag = 'N'
	and DC.lagging_count_of_month between 0 and 12 
group by incident, old_state, new_state, Major_Incident, date,
current_state,inc_st_cnt, task_priority, DC.calendar_date
order by d.row_key,lower(old_state.source_dimension_name),lower(new_state.source_dimension_name), DC.calendar_date, Major_Incident, date,
current_state,inc_st_cnt, task_priority, DC.calendar_date