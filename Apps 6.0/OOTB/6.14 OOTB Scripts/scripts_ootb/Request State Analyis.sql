select dio.organization_name ,d_sc_task_state.source_dimension_name as "Task State", '' as metric , count(case when d_sc_task_state.wh_dimension_code = 'OPEN' then frt.row_key end )  from #DWH_TABLE_SCHEMA.f_request_task frt 
left join #DWH_TABLE_SCHEMA.d_request_task drt 
on drt.row_key = frt.request_task_key
left join #DWH_TABLE_SCHEMA.d_internal_organization dio 
on dio.row_key = frt.assignment_group_key
left join ( SELECT lov.row_key, lov.row_dn_key, lov.row_current_key, lov.source_id, lov.row_id, lov.dimension_class, COALESCE(lov.dimension_type, 'DEFAULT'::character varying) AS source_dimension_type, COALESCE(lov.dimension_subtype, 'DEFAULT'::character varying) AS source_dimension_subtype, lov.dimension_code AS source_dimension_code, lov.dimension_name AS source_dimension_name, wh_lov.row_id AS wh_row_id, COALESCE(wh_lov.dimension_type, 'DEFAULT'::character varying) AS wh_dimension_type, COALESCE(wh_lov.dimension_subtype, 'DEFAULT'::character varying) AS wh_dimension_subtype, wh_lov.dimension_code AS wh_dimension_code, wh_lov.dimension_name AS wh_dimension_name
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class::text = 'STATE~SC_TASK'::text 

UNION 
 SELECT lov.row_key, lov.row_dn_key, lov.row_current_key, lov.source_id, lov.row_id, lov.dimension_class, COALESCE(lov.dimension_type, 'DEFAULT'::character varying) AS source_dimension_type, COALESCE(lov.dimension_subtype, 'DEFAULT'::character varying) AS source_dimension_subtype, lov.dimension_code AS source_dimension_code, lov.dimension_name AS source_dimension_name, lov.row_id AS wh_row_id, COALESCE(lov.dimension_type, 'DEFAULT'::character varying) AS wh_dimension_type, COALESCE(lov.dimension_subtype, 'DEFAULT'::character varying) AS wh_dimension_subtype, lov.dimension_code AS wh_dimension_code, lov.dimension_name AS wh_dimension_name
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0)d_sc_task_state
 on d_sc_task_state.row_key = frt.state_src_key
 
 left join #DWH_TABLE_SCHEMA.d_calendar_date dcd 
 on dcd.row_key = frt.opened_on_key
 where dcd.lagging_count_of_month between 0 and 12 
 
group by dio.organization_name ,d_sc_task_state.source_dimension_name
order by lower (dio.organization_name), lower(d_sc_task_state.source_dimension_name)