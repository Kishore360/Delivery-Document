select d.row_key as Incident,
to_char(d.opened_on  ,'fmMM/fmDD/YYYY fmHH12:MI:SS AM') ,
to_char(d.closed_on  ,'fmMM/fmDD/YYYY fmHH12:MI:SS AM') ,
 d.reopened_flag,
 to_char(d.last_resolved_on  ,'fmMM/fmDD/YYYY fmHH12:MI:SS AM') ,

dis.source_dimension_name current_state,inc.full_name as assigned_to
,'' as metrics,
concat((round(sum(t.primary_duration)/86400.0,1)),' days')as "State_Duration"
from #DWH_TABLE_SCHEMA.d_incident d
join #DWH_TABLE_SCHEMA.f_incident f on f.incident_key = d.row_key
join #DWH_TABLE_SCHEMA.f_incident_activity t on t.task_key = f.incident_key 
	join #DWH_TABLE_SCHEMA.d_internal_organization INO on INO.row_key = f.assignment_group_key
	join #DWH_TABLE_SCHEMA.d_calendar_date DC on t.created_on_key = DC.row_key
	join ( SELECT lov.row_key, lov.dimension_name AS source_dimension_name
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class::text = 'STATE~INCIDENT'::text
UNION ALL 
 SELECT lov.row_key,lov.dimension_name AS source_dimension_name
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0)dis on dis.row_key = d.state_src_key 
  join #DWH_TABLE_SCHEMA.d_internal_contact inc on inc.row_key = f.assigned_to_key
		where t.task_attribute_wh_name = 'state'
	and f.soft_deleted_flag = 'N' and t.soft_deleted_flag = 'N'
	and DC.lagging_count_of_month between 0 and 12 
group by 1,2,3,4,5,6,7
order by 1