select dv1.dimension_name as "Impact", dv2.dimension_name as "Priority"  ,dv3.source_dimension_name as "Urgency" ,
'' as metric,trim(to_char (count(fi.row_key),'999,999,990')) as "opened_incidents"
from #DWH_TABLE_SCHEMA.f_incident fi
left join #DWH_TABLE_SCHEMA.d_problem di
on fi.incident_key = di.row_key
left join #DWH_TABLE_SCHEMA.d_lov dv1
on fi.impact_src_key = dv1.row_key
left join #DWH_TABLE_SCHEMA.d_lov dv2
on fi.priority_src_key = dv2.row_key
left join (SELECT lov.row_key, lov.row_dn_key, lov.row_current_key, lov.source_id, lov.row_id, lov.dimension_class, COALESCE(lov.dimension_type, 'DEFAULT'::character varying) AS source_dimension_type, COALESCE(lov.dimension_subtype, 'DEFAULT'::character varying) AS source_dimension_subtype, lov.dimension_code AS source_dimension_code, lov.dimension_name AS source_dimension_name, wh_lov.row_id AS wh_row_id, COALESCE(wh_lov.dimension_type, 'DEFAULT'::character varying) AS wh_dimension_type, COALESCE(wh_lov.dimension_subtype, 'DEFAULT'::character varying) AS wh_dimension_subtype, wh_lov.dimension_code AS wh_dimension_code, wh_lov.dimension_name AS wh_dimension_name
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class::text = 'URGENCY~TASK'::text
UNION 
 SELECT lov.row_key, lov.row_dn_key, lov.row_current_key, lov.source_id, lov.row_id, lov.dimension_class, COALESCE(lov.dimension_type, 'DEFAULT'::character varying) AS source_dimension_type, COALESCE(lov.dimension_subtype, 'DEFAULT'::character varying) AS source_dimension_subtype, lov.dimension_code AS source_dimension_code, lov.dimension_name AS source_dimension_name, lov.row_id AS wh_row_id, COALESCE(lov.dimension_type, 'DEFAULT'::character varying) AS wh_dimension_type, COALESCE(lov.dimension_subtype, 'DEFAULT'::character varying) AS wh_dimension_subtype, lov.dimension_code AS wh_dimension_code, lov.dimension_name AS wh_dimension_name
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0)dv3
on dv3.row_key = fi.urgency_src_key

left join #DWH_TABLE_SCHEMA.d_calendar_date dcd1
on  fi.opened_on_key = dcd1.row_key
 where dcd1.lagging_count_of_month between 0 and 12
and fi.soft_deleted_flag ='N'
group by dv1.dimension_name ,dv2.dimension_name , dv3.source_dimension_name 
order by lower(dv1.dimension_name) ,lower(dv2.dimension_name),lower(dv3.source_dimension_name) asc
