select dio.organization_name as "Assignment group",p_imp.source_dimension_name as "Impact", p_pri.source_dimension_name as "Priority",'' as metrics,
sum(fp.problem_tasks_count) as "All Problem task count"
from #DWH_TABLE_SCHEMA.f_problem fp
left join #DWH_TABLE_SCHEMA.d_problem dp
on fp.problem_key = dp.row_key
left join #DWH_TABLE_SCHEMA.d_configuration_item dci 
on fp.configuration_item_key = dci.row_key 
join #DWH_TABLE_SCHEMA.d_internal_contact con
on con.row_key = fp.opened_by_key
join(
SELECT d_internal_organization.department_flag, d_internal_organization.emp_count, d_internal_organization.organization_contact_id, d_internal_organization.city_code, d_internal_organization.row_id, d_internal_organization.fax_phone_number, d_internal_organization.legal_name, d_internal_organization.source_id, d_internal_organization.current_flag, d_internal_organization.effective_from, d_internal_organization.manager_key, d_internal_organization.organization_active_flag, d_internal_organization.business_unit_flag, d_internal_organization.parent_row_id, d_internal_organization.effective_to, d_internal_organization.dw_inserted_on, d_internal_organization.secondary2_changed_on, d_internal_organization.address, d_internal_organization.dw_updated_on, d_internal_organization.organization_name, d_internal_organization.group_flag, d_internal_organization.inventory_org_flag, d_internal_organization.created_on, d_internal_organization.soft_deleted_flag, d_internal_organization.state_code, d_internal_organization.secondary1_changed_on, d_internal_organization.continent_code, d_internal_organization.created_by, d_internal_organization.subsidary_currency_code, d_internal_organization.row_current_key, d_internal_organization.row_key, d_internal_organization.etl_run_number, d_internal_organization.group_lvl_flag, d_internal_organization.country_code, d_internal_organization.legal_entity_flag, d_internal_organization.organization_contact_name, d_internal_organization.manager_id, d_internal_organization.changed_by, d_internal_organization.row_dn_key, d_internal_organization.classification_flag, d_internal_organization.subsidiary_flag, d_internal_organization.postal_code, d_internal_organization.organization_url, d_internal_organization.changed_on, d_internal_organization.cdctype, d_internal_organization.subsidary_fiscal_calendar
   FROM #DWH_TABLE_SCHEMA.d_internal_organization
  WHERE d_internal_organization.department_flag = 'Y'::bpchar OR d_internal_organization.row_key = 0 OR d_internal_organization.row_key = -1) dep
  on dep.row_key = fp.opened_by_department_key
  left join #DWH_TABLE_SCHEMA.d_internal_organization dio
on fp.assignment_group_key = dio.row_key
left join #DWH_TABLE_SCHEMA.d_calendar_date dcd1
on  fp.opened_on_key = dcd1.row_key
left join(
  SELECT lov.row_key, lov.row_dn_key, lov.row_current_key, lov.source_id, lov.row_id, lov.dimension_class, COALESCE(lov.dimension_type, 'DEFAULT'::character varying) AS source_dimension_type, COALESCE(lov.dimension_subtype, 'DEFAULT'::character varying) AS source_dimension_subtype, lov.dimension_code AS source_dimension_code, lov.dimension_name AS source_dimension_name, wh_lov.row_id AS wh_row_id, COALESCE(wh_lov.dimension_type, 'DEFAULT'::character varying) AS wh_dimension_type, COALESCE(wh_lov.dimension_subtype, 'DEFAULT'::character varying) AS wh_dimension_subtype, wh_lov.dimension_code AS wh_dimension_code, wh_lov.dimension_name AS wh_dimension_name
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class::text = 'IMPACT~PROBLEM'::text
UNION 
 SELECT lov.row_key, lov.row_dn_key, lov.row_current_key, lov.source_id, lov.row_id, lov.dimension_class, COALESCE(lov.dimension_type, 'DEFAULT'::character varying) AS source_dimension_type, COALESCE(lov.dimension_subtype, 'DEFAULT'::character varying) AS source_dimension_subtype, lov.dimension_code AS source_dimension_code, lov.dimension_name AS source_dimension_name, lov.row_id AS wh_row_id, COALESCE(lov.dimension_type, 'DEFAULT'::character varying) AS wh_dimension_type, COALESCE(lov.dimension_subtype, 'DEFAULT'::character varying) AS wh_dimension_subtype, lov.dimension_code AS wh_dimension_code, lov.dimension_name AS wh_dimension_name
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0) p_imp
  on p_imp.row_key = fp.impact_src_key
   join (
  SELECT lov.row_key, lov.row_dn_key, lov.row_current_key, lov.source_id, lov.row_id, lov.dimension_class, COALESCE(lov.dimension_type, 'DEFAULT'::character varying) AS source_dimension_type, COALESCE(lov.dimension_subtype, 'DEFAULT'::character varying) AS source_dimension_subtype, lov.dimension_code AS source_dimension_code, lov.dimension_name AS source_dimension_name, wh_lov.row_id AS wh_row_id, COALESCE(wh_lov.dimension_type, 'DEFAULT'::character varying) AS wh_dimension_type, COALESCE(wh_lov.dimension_subtype, 'DEFAULT'::character varying) AS wh_dimension_subtype, wh_lov.dimension_code AS wh_dimension_code, wh_lov.dimension_name AS wh_dimension_name, lov.lower_range_value
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class::text = 'PRIORITY~PROBLEM'::text
UNION 
 SELECT lov.row_key, lov.row_dn_key, lov.row_current_key, lov.source_id, lov.row_id, lov.dimension_class, COALESCE(lov.dimension_type, 'DEFAULT'::character varying) AS source_dimension_type, COALESCE(lov.dimension_subtype, 'DEFAULT'::character varying) AS source_dimension_subtype, lov.dimension_code AS source_dimension_code, lov.dimension_name AS source_dimension_name, lov.row_id AS wh_row_id, COALESCE(lov.dimension_type, 'DEFAULT'::character varying) AS wh_dimension_type, COALESCE(lov.dimension_subtype, 'DEFAULT'::character varying) AS wh_dimension_subtype, lov.dimension_code AS wh_dimension_code, lov.dimension_name AS wh_dimension_name, 0 AS lower_range_value
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0)p_pri
  on p_pri.row_key = fp.priority_src_key
  join 
(
SELECT d_calendar_date.*
   FROM #DWH_TABLE_SCHEMA.d_calendar_date d_calendar_date
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_day ON d_calendar_date.previous_day_key = prev_day.row_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_week ON d_calendar_date.previous_week_key = prev_week.row_key AND prev_week.row_key = prev_week.week_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_month ON d_calendar_date.previous_month_key = prev_month.row_key AND prev_month.row_key = prev_month.month_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_quarter ON d_calendar_date.previous_quarter_key = prev_quarter.row_key AND prev_quarter.row_key = prev_quarter.quarter_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_year ON d_calendar_date.previous_year_key = prev_year.row_key AND prev_year.row_key = prev_year.year_start_date_key
) CAL
on fp.opened_on_key = CAL.row_key
join 
(
select d_calendar_date.*
FROM #DWH_TABLE_SCHEMA.d_calendar_date d_calendar_date
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_month ON d_calendar_date.previous_month_key = prev_month.row_key AND prev_month.row_key = prev_month.month_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_quarter ON d_calendar_date.previous_quarter_key = prev_quarter.row_key AND prev_quarter.row_key = prev_quarter.quarter_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_year ON d_calendar_date.previous_year_key = prev_year.row_key AND prev_year.row_key = prev_year.year_start_date_key
  WHERE d_calendar_date.month_start_date_key = d_calendar_date.row_key AND d_calendar_date.source_id = 0
) cal_mon
on cal.month_start_date_key = cal_mon.row_key
left join #DWH_TABLE_SCHEMA.d_lov dv3 
on fp.urgency_src_code = dv3.row_key
left join #DWH_TABLE_SCHEMA.d_lov dv4
on fp.location_key = dv4.row_key
left join #DWH_TABLE_SCHEMA.d_lov dv5
on fp.reported_type_src_key = dv5.row_key
group by dio.row_key,dio.organization_name ,p_imp.source_dimension_name,  p_pri.source_dimension_name ,p_pri.row_key,p_imp.row_key
order by dio.row_key asc,dio.organization_name ,p_imp.row_key asc,p_imp.source_dimension_name ,p_pri.row_key asc, p_pri.source_dimension_name 
