select d.row_key ,stf.source_dimension_name old_state, stt.source_dimension_name new_state,
d.major_incident_flag as "Major Incident", DC.calendar_date as date,
a.source_dimension_name current_state,d.state_count inc_st_cnt,
b.source_dimension_name task_priority, '' as metrics,sum(d.state_count) as state_count,
concat (cast(sum(t.primary_duration/86400.0) as decimal(10,1)),' days')as "State_Duration"
from #DWH_TABLE_SCHEMA.d_incident d
join #DWH_TABLE_SCHEMA.f_incident f on f.incident_key = d.row_key
join #DWH_TABLE_SCHEMA.f_t_task_activity t on t.task_key = f.incident_key 
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
  WHERE lov.row_key = -1 OR lov.row_key = 0) stf on stf.row_key = d.state_src_key
  join 
   (SELECT lov.row_key as row_key, lov.dimension_name AS source_dimension_name
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class::text = 'STATE~INCIDENT'::text
UNION ALL 
 SELECT lov.row_key, lov.dimension_name AS source_dimension_name
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0) stt on stt.row_key  = d.state_src_key
  left join (SELECT lov.dimension_name AS source_dimension_name,lov.row_key as row_key
FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'STATE~INCIDENT'
UNION ALL 
 SELECT lov.dimension_name AS source_dimension_name,lov.row_key as row_key
    FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0)a on a.row_key = d.state_src_key
  left join
  ( SELECT lov.row_key, lov.dimension_name AS source_dimension_name
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class::text = 'PRIORITY~TASK'::text
UNION 
 SELECT lov.row_key, lov.dimension_name AS source_dimension_name
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0)b on b.row_key = f.priority_src_key

	where t.task_wh_type = 'incident' AND t.task_attribute_wh_name = 'state'
	and f.soft_deleted_flag = 'N' and t.soft_deleted_flag = 'N'
	and DC.lagging_count_of_month between 0 and 12 
group by 1,2,3,4,5,6,7,8
order by d.row_key asc