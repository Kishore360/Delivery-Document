select d_task_approval.source_dimension_name ,'' metrics ,count(fri.row_key)as "Open request Items" from 
   #DWH_TABLE_SCHEMA.f_request_item fri join 
(SELECT lov.row_key, lov.row_dn_key, lov.row_current_key, lov.source_id, lov.row_id, lov.dimension_class, COALESCE(lov.dimension_type, 'DEFAULT'::character varying) AS source_dimension_type, COALESCE(lov.dimension_subtype, 'DEFAULT'::character varying) AS source_dimension_subtype, lov.dimension_code AS source_dimension_code, lov.dimension_name AS source_dimension_name, wh_lov.row_id AS wh_row_id, COALESCE(wh_lov.dimension_type, 'DEFAULT'::character varying) AS wh_dimension_type, COALESCE(wh_lov.dimension_subtype, 'DEFAULT'::character varying) AS wh_dimension_subtype, wh_lov.dimension_code AS wh_dimension_code, wh_lov.dimension_name AS wh_dimension_name
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class::text = 'APPROVAL~SC_REQ_ITEM'::text
UNION 
 SELECT lov.row_key, lov.row_dn_key, lov.row_current_key, lov.source_id, lov.row_id, lov.dimension_class, COALESCE(lov.dimension_type, 'DEFAULT'::character varying) AS source_dimension_type, COALESCE(lov.dimension_subtype, 'DEFAULT'::character varying) AS source_dimension_subtype, lov.dimension_code AS source_dimension_code, lov.dimension_name AS source_dimension_name, lov.row_id AS wh_row_id, COALESCE(lov.dimension_type, 'DEFAULT'::character varying) AS wh_dimension_type, COALESCE(lov.dimension_subtype, 'DEFAULT'::character varying) AS wh_dimension_subtype, lov.dimension_code AS wh_dimension_code, lov.dimension_name AS wh_dimension_name
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0) d_task_approval
  on fri.approval_state_src_key = d_task_approval.row_key
  left join #DWH_TABLE_SCHEMA.d_calendar_date dcd
   on fri.opened_on_key = dcd.row_key
   left join #DWH_TABLE_SCHEMA.d_calendar_date dcd1
   on fri.closed_on_key = dcd1.row_key
   where dcd.lagging_count_of_month between 0 and 12 
   or dcd1.lagging_count_of_month between 0 and 12
  group by fri.approval_state_src_code , d_task_approval.source_dimension_name
  order by lower(fri.approval_state_src_code), lower(d_task_approval.source_dimension_name) asc



