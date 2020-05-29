select F.row_key  AS incident,
to_char(D.opened_on, 'DD/MM/YYYY HH24:MI:SS') as opened_date,
to_char(D.last_resolved_on, 'DD/MM/YYYY HH24:MI:SS') as resolved_date,
to_char(D.closed_on, 'DD/MM/YYYY HH24:MI:SS') as  closed_date,
--(case when cast(D.opened_on as varchar(100)) is NULL then 'UNSPECIFIED' else cast(D.opened_on as varchar(100)) end) as opened_date,
--(case when cast(D.last_resolved_on as varchar(100)) is NULL then 'UNSPECIFIED' else cast(D.last_resolved_on as varchar(100)) end) as resolved_date,
--(case when cast(D.closed_on as varchar(100)) is NULL then 'UNSPECIFIED' else cast(D.closed_on as varchar(100)) end) as closed_date,
--(case when cast(t.created_on as varchar(100)) is NULL then 'UNSPECIFIED' else cast(t.created_on as varchar(100)) end) as activity_date,
to_char(t.created_on, 'DD/MM/YYYY HH24:MI:SS') as activity_date,
to_char(cal.calendar_date, 'MM/DD') as date,
D.major_incident_flag as major_incident,
incs.source_dimension_name as current_state,
D.reopened_flag as reopned_incident,
coalesce(CG.organization_name, case when F.assignment_group_key is NULL then 'UNSPECIFIED' else 'UNKNOWN' end)  as Current_group,
TP.source_dimension_name as Task_Priority_Source,
to_char (sum(t.primary_duration),'9,999,999,999') as Duration,
sum(F.update_count) as Updates
from #DWH_TABLE_SCHEMA.f_incident as F
left join  #DWH_TABLE_SCHEMA.f_t_task_activity T on t.task_key = F.incident_key
left join #DWH_TABLE_SCHEMA.d_incident D on D.row_key = F.incident_key
join (SELECT lov.row_key,lov.dimension_name AS source_dimension_name FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class::text = 'STATE~INCIDENT'::text
UNION ALL 
 SELECT lov.row_key, lov.dimension_name AS source_dimension_name  FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0) incs on incs.row_key = D.state_src_key
   left join #DWH_TABLE_SCHEMA.d_internal_organization CG
    on (CG.row_key=F.assignment_group_key)
	join (SELECT lov.dimension_name AS source_dimension_name, lov.row_key as row_key
 FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class::text = 'PRIORITY~TASK'::text
UNION 
 SELECT lov.dimension_name AS source_dimension_name,lov.row_key as row_key
 FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0) TP on TP.row_key = F.priority_src_key
  join #DWH_TABLE_SCHEMA.d_calendar_date as cal on cal.row_key = t.created_on_key
 and cal.lagging_count_of_month between 0 and 12 
AND t.soft_deleted_flag = 'N'::bpchar
  WHERE t.task_wh_type::text = 'incident'::text AND (t.task_attribute_wh_name::text = 'assigned_to'::text OR t.task_attribute_wh_name::text = 'assignment_group'::text)
  group by F.row_key,2,3,4,5,6,7,8,9,10,11
  order by 1,2,3,4,5,6,7,8,9,10,11
  
