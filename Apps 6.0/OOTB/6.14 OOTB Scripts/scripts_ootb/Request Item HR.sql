Select  dic.full_name as "Assignee" , d_hr_change_category.source_dimension_name as "hr_change_category", dh.hr_change_number ,'' as metric, count(fri.request_item_key )as  "Opened_request_items" from #DWH_TABLE_SCHEMA.f_request_item fri 
left join #DWH_TABLE_SCHEMA.d_internal_contact dic 
on dic.row_key = fri.assigned_to_key
left join(
 SELECT lov.row_key, lov.row_dn_key, lov.row_current_key, lov.source_id, lov.row_id, lov.dimension_class, COALESCE(lov.dimension_type, 'DEFAULT'::character varying) AS source_dimension_type, COALESCE(lov.dimension_subtype, 'DEFAULT'::character varying) AS source_dimension_subtype, lov.dimension_code AS source_dimension_code, lov.dimension_name AS source_dimension_name, wh_lov.row_id AS wh_row_id, COALESCE(wh_lov.dimension_type, 'DEFAULT'::character varying) AS wh_dimension_type, COALESCE(wh_lov.dimension_subtype, 'DEFAULT'::character varying) AS wh_dimension_subtype, wh_lov.dimension_code AS wh_dimension_code, wh_lov.dimension_name AS wh_dimension_name
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class::text = 'CATEGORY~HR_CHANGE'::text
UNION ALL 
 SELECT lov.row_key, lov.row_dn_key, lov.row_current_key, lov.source_id, lov.row_id, lov.dimension_class, COALESCE(lov.dimension_type, 'DEFAULT'::character varying) AS source_dimension_type, COALESCE(lov.dimension_subtype, 'DEFAULT'::character varying) AS source_dimension_subtype, lov.dimension_code AS source_dimension_code, lov.dimension_name AS source_dimension_name, lov.row_id AS wh_row_id, COALESCE(lov.dimension_type, 'DEFAULT'::character varying) AS wh_dimension_type, COALESCE(lov.dimension_subtype, 'DEFAULT'::character varying) AS wh_dimension_subtype, lov.dimension_code AS wh_dimension_code, lov.dimension_name AS wh_dimension_name
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0) d_hr_change_category
  on d_hr_change_category.row_key = fri.hr_category_src_key
  left join #DWH_TABLE_SCHEMA.d_hr_change dh
on dh.row_key = fri.hr_change_key
left join #DWH_TABLE_SCHEMA.d_calendar_date dcd
on dcd.row_key = fri.opened_on_key
left join #DWH_TABLE_SCHEMA.d_calendar_date dcd1
on dcd1.row_key = fri.closed_on_key 
where dcd.lagging_count_of_month between 0 and 12
or dcd1.lagging_count_of_month between 0 and 12
and fri.soft_deleted_flag = 'N'
group by  dic.full_name  , d_hr_change_category.source_dimension_name , dh.hr_change_number
order by  lower(dic.full_name), lower(d_hr_change_category.source_dimension_name),lower(dh.hr_change_number)  asc

