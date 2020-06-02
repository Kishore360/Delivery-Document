select dom.domain_name as "domain" ,--dv.source_dimension_name as"Incident state source"
dv.dimension_name, dcd.year_name as "calendar year",
'' as metric ,
(coalesce (sum(di.reassignment_count ),0))::decimal(10,2),
trim(to_char(coalesce (sum(fi.reopened_count),0),'999,999,999,990'))as "Incident reopened count",
sum(case when di.priority_escalated_flag = 'Y' and  dvm.dimension_wh_code = 'OPEN' then 1 else 0 end) as "Open incidents escalated",
sum(case when di.reopened_flag = 'Y'  then 1 else 0 end) as "reopened incidents"
from  #DWH_TABLE_SCHEMA.f_incident fi 
left join #DWH_TABLE_SCHEMA.d_internal_contact dc
on  fi.opened_by_key = dc.row_key
left join #DWH_TABLE_SCHEMA.d_incident di
on  fi.incident_key = di.row_key
left join #DWH_TABLE_SCHEMA.d_domain dom
on dom.row_key = fi.domain_key
left join #DWH_TABLE_SCHEMA.d_calendar_date dcd
on  fi.opened_on_key = dcd.row_key
left join  #DWH_TABLE_SCHEMA.d_lov  dv 
on fi.state_src_key  = dv.row_key
left join  #DWH_TABLE_SCHEMA.d_lov_map dvm
on dvm.dimension_code  = dv.dimension_code
and dvm.dimension_class=dv.dimension_class
--left join (
-- SELECT lov.*, COALESCE(lov.dimension_type, 'DEFAULT'::character varying) AS source_dimension_type, COALESCE(lov.dimension_subtype, 'DEFAULT'::character varying) AS source_dimension_subtype, lov.dimension_code AS source_dimension_code, lov.dimension_name AS source_dimension_name, wh_lov.row_id AS wh_row_id, COALESCE(wh_lov.dimension_type, 'DEFAULT'::character varying) AS wh_dimension_type, COALESCE(wh_lov.dimension_subtype, 'DEFAULT'::character varying) AS wh_dimension_subtype, wh_lov.dimension_code AS wh_dimension_code, wh_lov.dimension_name AS wh_dimension_name
--   FROM #DWH_TABLE_SCHEMA.d_lov lov
--   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
--   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class::text = 'STATE~INCIDENT'::text
--UNION ALL 
-- SELECT lov.*, COALESCE(lov.dimension_type, 'DEFAULT'::character varying) AS source_dimension_type, COALESCE(lov.dimension_subtype, 'DEFAULT'::character varying) AS source_dimension_subtype, lov.dimension_code AS source_dimension_code, lov.dimension_name AS source_dimension_name, lov.row_id AS wh_row_id, COALESCE(lov.dimension_type, 'DEFAULT'::character varying) AS wh_dimension_type, COALESCE(lov.dimension_subtype, 'DEFAULT'::character varying) AS wh_dimension_subtype, lov.dimension_code AS wh_dimension_code, lov.dimension_name AS wh_dimension_name
--   FROM #DWH_TABLE_SCHEMA.d_lov lov
--  WHERE lov.row_key = -1 OR lov.row_key = 0
--
--)dv
--on fi.state_src_key  = dv.row_key

where dcd.lagging_count_of_month between 0 and 12 
and fi.soft_deleted_flag = 'N'
group by dom.domain_name , dv.dimension_name ,dcd.year_name 
order by lower(dom.domain_name) ,lower(dv.dimension_name) ,dcd.year_name asc
