select
inc_cat.source_dimension_name as "Incident Category" ,di.caused_by_change_flag,di.is_caused_by_task_flag,di.problem_flag,di.knowledge_flag
,trim(to_char(count(fi.row_key),'999,999,990')) "Opened Incidents"
from  #DWH_TABLE_SCHEMA.f_incident fi 
join #DWH_TABLE_SCHEMA.d_incident di
on  fi.incident_key = di.row_key
join #DWH_TABLE_SCHEMA.d_internal_contact dc
on  fi.opened_by_key = dc.row_key
join(
SELECT lov.*, wh_lov.dimension_code AS state_code, wh_lov.dimension_name AS state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'STATE~INCIDENT'
UNION ALL 
 SELECT lov.*, lov.dimension_code AS state_code, lov.dimension_name AS state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0) inc_state
  on inc_state.row_key = fi.state_src_key
  join(
  SELECT lov.row_key, lov.row_dn_key, lov.row_current_key, lov.source_id, lov.row_id, lov.dimension_class, COALESCE(lov.dimension_type, 'DEFAULT'::character varying) AS source_dimension_type, COALESCE(lov.dimension_subtype, 'DEFAULT'::character varying) AS source_dimension_subtype, lov.dimension_code AS source_dimension_code, lov.dimension_name AS source_dimension_name, wh_lov.row_id AS wh_row_id, COALESCE(wh_lov.dimension_type, 'DEFAULT'::character varying) AS wh_dimension_type, COALESCE(wh_lov.dimension_subtype, 'DEFAULT'::character varying) AS wh_dimension_subtype, wh_lov.dimension_code AS wh_dimension_code, wh_lov.dimension_name AS wh_dimension_name
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class::text = 'IMPACT~INCIDENT'::text
UNION 
 SELECT lov.row_key, lov.row_dn_key, lov.row_current_key, lov.source_id, lov.row_id, lov.dimension_class, COALESCE(lov.dimension_type, 'DEFAULT'::character varying) AS source_dimension_type, COALESCE(lov.dimension_subtype, 'DEFAULT'::character varying) AS source_dimension_subtype, lov.dimension_code AS source_dimension_code, lov.dimension_name AS source_dimension_name, lov.row_id AS wh_row_id, COALESCE(lov.dimension_type, 'DEFAULT'::character varying) AS wh_dimension_type, COALESCE(lov.dimension_subtype, 'DEFAULT'::character varying) AS wh_dimension_subtype, lov.dimension_code AS wh_dimension_code, lov.dimension_name AS wh_dimension_name
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0) inc_imp
  on inc_imp.row_key = fi.impact_src_key
  join (
  SELECT lov.row_key, lov.row_dn_key, lov.row_current_key, lov.source_id, lov.row_id, lov.dimension_class, COALESCE(lov.dimension_type, 'DEFAULT'::character varying) AS source_dimension_type, COALESCE(lov.dimension_subtype, 'DEFAULT'::character varying) AS source_dimension_subtype, lov.dimension_code AS source_dimension_code, lov.dimension_name AS source_dimension_name, wh_lov.row_id AS wh_row_id, COALESCE(wh_lov.dimension_type, 'DEFAULT'::character varying) AS wh_dimension_type, COALESCE(wh_lov.dimension_subtype, 'DEFAULT'::character varying) AS wh_dimension_subtype, wh_lov.dimension_code AS wh_dimension_code, wh_lov.dimension_name AS wh_dimension_name, lov.lower_range_value
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class::text = 'PRIORITY~INCIDENT'::text
UNION 
 SELECT lov.row_key, lov.row_dn_key, lov.row_current_key, lov.source_id, lov.row_id, lov.dimension_class, COALESCE(lov.dimension_type, 'DEFAULT'::character varying) AS source_dimension_type, COALESCE(lov.dimension_subtype, 'DEFAULT'::character varying) AS source_dimension_subtype, lov.dimension_code AS source_dimension_code, lov.dimension_name AS source_dimension_name, lov.row_id AS wh_row_id, COALESCE(lov.dimension_type, 'DEFAULT'::character varying) AS wh_dimension_type, COALESCE(lov.dimension_subtype, 'DEFAULT'::character varying) AS wh_dimension_subtype, lov.dimension_code AS wh_dimension_code, lov.dimension_name AS wh_dimension_name, 0 AS lower_range_value
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0)inc_pri
  on inc_pri.row_key = fi.priority_src_key
  join (
  SELECT lov.row_key, lov.row_dn_key, lov.row_current_key, lov.source_id, lov.row_id, lov.dimension_class, COALESCE(lov.dimension_type, 'DEFAULT'::character varying) AS source_dimension_type, COALESCE(lov.dimension_subtype, 'DEFAULT'::character varying) AS source_dimension_subtype, lov.dimension_code AS source_dimension_code, lov.dimension_name AS source_dimension_name, wh_lov.row_id AS wh_row_id, COALESCE(wh_lov.dimension_type, 'DEFAULT'::character varying) AS wh_dimension_type, COALESCE(wh_lov.dimension_subtype, 'DEFAULT'::character varying) AS wh_dimension_subtype, wh_lov.dimension_code AS wh_dimension_code, wh_lov.dimension_name AS wh_dimension_name
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class::text = 'URGENCY~INCIDENT'::text
UNION 
 SELECT lov.row_key, lov.row_dn_key, lov.row_current_key, lov.source_id, lov.row_id, lov.dimension_class, COALESCE(lov.dimension_type, 'DEFAULT'::character varying) AS source_dimension_type, COALESCE(lov.dimension_subtype, 'DEFAULT'::character varying) AS source_dimension_subtype, lov.dimension_code AS source_dimension_code, lov.dimension_name AS source_dimension_name, lov.row_id AS wh_row_id, COALESCE(lov.dimension_type, 'DEFAULT'::character varying) AS wh_dimension_type, COALESCE(lov.dimension_subtype, 'DEFAULT'::character varying) AS wh_dimension_subtype, lov.dimension_code AS wh_dimension_code, lov.dimension_name AS wh_dimension_name
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0) inc_urg
  on inc_urg.row_key = fi.urgency_src_key
  join (
  SELECT lov.row_key, lov.row_dn_key, lov.row_current_key, lov.source_id, lov.row_id, lov.dimension_class, COALESCE(lov.dimension_type, 'DEFAULT'::character varying) AS source_dimension_type, COALESCE(lov.dimension_subtype, 'DEFAULT'::character varying) AS source_dimension_subtype, lov.dimension_code AS source_dimension_code, lov.dimension_name AS source_dimension_name
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.dimension_class::text = 'CATEGORY~INCIDENT'::text OR lov.row_key = -1 OR lov.row_key = 0) inc_cat
  on inc_cat.row_key= fi.category_src_key
join 
  (SELECT d_organization_customer.row_key, d_organization_customer.row_dn_key, d_organization_customer.row_current_key, 'ORG_CUST' AS "class", concat('ORG_CUST~'::text, d_organization_customer.row_id::text)::character varying AS row_id, d_organization_customer.source_id, d_organization_customer.etl_run_number, d_organization_customer.customer_number AS party_id, d_organization_customer.parent_row_id, NULL::"unknown" AS title, NULL::"unknown" AS first_name, NULL::"unknown" AS middle_name, NULL::"unknown" AS last_name, d_organization_customer.organization_name AS name, d_organization_customer.st_address1, d_organization_customer.st_address2, d_organization_customer.st_address3, d_organization_customer.st_address4, d_organization_customer.city_code, d_organization_customer.state_code, d_organization_customer.postal_code, d_organization_customer.country_code, d_organization_customer.email_address, NULL::"unknown" AS mobile_number, d_organization_customer.work_phone, d_organization_customer.fax_number, NULL::"unknown" AS pager_number, d_organization_customer.organization_active_flag AS active_flag, d_organization_customer.preferred_language, d_organization_customer.credit_score, d_organization_customer.customer_since_date, NULL::"unknown" AS professional_title, d_organization_customer.soft_deleted_flag, d_organization_customer.created_by, d_organization_customer.changed_by, d_organization_customer.created_on, d_organization_customer.changed_on, d_organization_customer.current_flag, d_organization_customer.effective_from, d_organization_customer.effective_to, d_organization_customer.dw_inserted_on, d_organization_customer.dw_updated_on, d_organization_customer.enduser_flag, d_organization_customer.reseller_flag, d_organization_customer.distributor_flag, d_organization_customer.customer_contact1_name, d_organization_customer.customer_contact2_name, d_organization_customer.customer_contact3_name, d_organization_customer.renewalstatus, wh.wh_dim_code AS renewalstatus_wh_code
   FROM #DWH_TABLE_SCHEMA.d_organization_customer d_organization_customer
   LEFT JOIN (
   SELECT lov.dimension_code AS src_dim_code, wh_lov.dimension_code AS wh_dim_code
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'CUSTOMER RENEWAL STATUS') wh ON d_organization_customer.renewalstatus::text = wh.src_dim_code::text
  WHERE d_organization_customer.row_key <> 0 AND d_organization_customer.row_key <> -1
UNION ALL 
 SELECT d_organization_customer.row_key, d_organization_customer.row_dn_key, d_organization_customer.row_current_key, 'ORG_CUST' AS "class", concat('ORG_CUST~'::text, d_organization_customer.row_id::text)::character varying AS row_id, d_organization_customer.source_id, d_organization_customer.etl_run_number, d_organization_customer.customer_number AS party_id, d_organization_customer.parent_row_id, NULL::"unknown" AS title, NULL::"unknown" AS first_name, NULL::"unknown" AS middle_name, NULL::"unknown" AS last_name, d_organization_customer.organization_name AS name, d_organization_customer.st_address1, d_organization_customer.st_address2, d_organization_customer.st_address3, d_organization_customer.st_address4, d_organization_customer.city_code, d_organization_customer.state_code, d_organization_customer.postal_code, d_organization_customer.country_code, d_organization_customer.email_address, NULL::"unknown" AS mobile_number, d_organization_customer.work_phone, d_organization_customer.fax_number, NULL::"unknown" AS pager_number, d_organization_customer.organization_active_flag AS active_flag, d_organization_customer.preferred_language, d_organization_customer.credit_score, d_organization_customer.customer_since_date, NULL::"unknown" AS professional_title, d_organization_customer.soft_deleted_flag, d_organization_customer.created_by, d_organization_customer.changed_by, d_organization_customer.created_on, d_organization_customer.changed_on, d_organization_customer.current_flag, d_organization_customer.effective_from, d_organization_customer.effective_to, d_organization_customer.dw_inserted_on, d_organization_customer.dw_updated_on, d_organization_customer.enduser_flag, d_organization_customer.reseller_flag, d_organization_customer.distributor_flag, d_organization_customer.customer_contact1_name, d_organization_customer.customer_contact2_name, d_organization_customer.customer_contact3_name, d_organization_customer.renewalstatus, d_organization_customer.renewalstatus AS renewalstatus_wh_code
   FROM #DWH_TABLE_SCHEMA.d_organization_customer d_organization_customer
  WHERE d_organization_customer.row_key = 0 OR d_organization_customer.row_key = -1) dcu
on fi.customer_key = dcu.row_key
 join (
 SELECT iog.department_flag, iog.emp_count, iog.organization_contact_id, iog.city_code, iog.row_id, iog.fax_phone_number, iog.legal_name, iog.source_id, iog.current_flag, iog.effective_from, iog.manager_key, iog.organization_active_flag, iog.business_unit_flag, iog.parent_row_id, iog.effective_to, iog.dw_inserted_on, iog.secondary2_changed_on, iog.address, iog.dw_updated_on, iog.organization_name, iog.group_flag, iog.inventory_org_flag, iog.created_on, iog.soft_deleted_flag, iog.state_code, iog.secondary1_changed_on, iog.continent_code, iog.created_by, iog.subsidary_currency_code, iog.row_current_key, iog.row_key, iog.etl_run_number, iog.group_lvl_flag, iog.country_code, iog.legal_entity_flag, iog.organization_contact_name, iog.manager_id, iog.changed_by, iog.row_dn_key, iog.classification_flag, iog.subsidiary_flag, iog.postal_code, iog.organization_url, iog.changed_on, iog.cdctype, iog.subsidary_fiscal_calendar, icm.full_name AS manager_name
   FROM #DWH_TABLE_SCHEMA.d_internal_organization iog
   LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact icm ON iog.manager_key = icm.row_key
  WHERE iog.group_flag = 'Y'::bpchar OR iog.row_key = 0 OR iog.row_key = -1) dio 
on fi.assignment_group_key = dio.row_key
join(
SELECT d_internal_organization.department_flag, d_internal_organization.emp_count, d_internal_organization.organization_contact_id, d_internal_organization.city_code, d_internal_organization.row_id, d_internal_organization.fax_phone_number, d_internal_organization.legal_name, d_internal_organization.source_id, d_internal_organization.current_flag, d_internal_organization.effective_from, d_internal_organization.manager_key, d_internal_organization.organization_active_flag, d_internal_organization.business_unit_flag, d_internal_organization.parent_row_id, d_internal_organization.effective_to, d_internal_organization.dw_inserted_on, d_internal_organization.secondary2_changed_on, d_internal_organization.address, d_internal_organization.dw_updated_on, d_internal_organization.organization_name, d_internal_organization.group_flag, d_internal_organization.inventory_org_flag, d_internal_organization.created_on, d_internal_organization.soft_deleted_flag, d_internal_organization.state_code, d_internal_organization.secondary1_changed_on, d_internal_organization.continent_code, d_internal_organization.created_by, d_internal_organization.subsidary_currency_code, d_internal_organization.row_current_key, d_internal_organization.row_key, d_internal_organization.etl_run_number, d_internal_organization.group_lvl_flag, d_internal_organization.country_code, d_internal_organization.legal_entity_flag, d_internal_organization.organization_contact_name, d_internal_organization.manager_id, d_internal_organization.changed_by, d_internal_organization.row_dn_key, d_internal_organization.classification_flag, d_internal_organization.subsidiary_flag, d_internal_organization.postal_code, d_internal_organization.organization_url, d_internal_organization.changed_on, d_internal_organization.cdctype, d_internal_organization.subsidary_fiscal_calendar
   FROM #DWH_TABLE_SCHEMA.d_internal_organization
  WHERE d_internal_organization.department_flag = 'Y'::bpchar OR d_internal_organization.row_key = 0 OR d_internal_organization.row_key = -1) dep
  on dep.row_key = fi.opened_by_department_key
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
on fi.opened_on_key = CAL.row_key
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
 join (
  SELECT ic.first_name, ic.row_dn_key, ic.dw_updated_on, ic.secondary1_changed_on, ic.parent_row_id, ic.city_code, ic.created_on, ic.manager_id, ic.vip_flag, ic.state_code, ic.gender_code, ic.effective_to, ic.service_rep_flag, ic.st_address2, ic.etl_run_number, ic.row_key, ic.time_zone, ic.work_phone, ic.st_address4, ic.cost_center, ic.title, ic.identification_number, ic.st_address3, ic.created_by, ic.country_code, ic.cost_center_key, ic.user_name, ic.department_key, ic.row_current_key, ic.cdctype, ic.employment_type, ic.st_address1, ic.secondary2_changed_on, ic.changed_by, ic.email_address, ic.manager_key, ic.last_name, ic.soft_deleted_flag, ic.row_id, ic.postal_code, ic.geo_key, ic.company_name, ic.sales_rep_flag, ic.business_hours_per_day, ic.expense_user, ic.changed_on, ic.role_id, ic.middle_name, ic.mobile_number, ic.contact_active_flag, ic.source_id, ic.location_key, ic.pivot_date, ic.full_name, ic.preferred_language, ic.mdm_id, ic.department_code, ic.effective_from, ic.dw_inserted_on, ic.current_flag, icm.full_name AS manager_name
   FROM #DWH_TABLE_SCHEMA.d_internal_contact ic
   LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact icm ON ic.manager_key = icm.row_key) con
  on con.row_key= fi.assigned_to_key
  join (
  SELECT d_configuration_item."location", d_configuration_item.subcategory, d_configuration_item.location_key, d_configuration_item.company, d_configuration_item.source_id, d_configuration_item.lease_contract, d_configuration_item.dw_updated_on, d_configuration_item.etl_run_number, d_configuration_item.owned_by, d_configuration_item.created_by, d_configuration_item.changed_on, d_configuration_item.name, d_configuration_item.ci_type, d_configuration_item.dw_inserted_on, d_configuration_item.ci_team, d_configuration_item.company_key, d_configuration_item.secondary1_changed_on, d_configuration_item.secondary2_changed_on, d_configuration_item.service_level, d_configuration_item.manufacturer, d_configuration_item.asset_tag, d_configuration_item.device_name, d_configuration_item.pivot_date, d_configuration_item."class", d_configuration_item.row_key, d_configuration_item.category, d_configuration_item.row_id, d_configuration_item.soft_deleted_flag, d_configuration_item.row_current_key, d_configuration_item.model_number, d_configuration_item.support_group, d_configuration_item.row_dn_key, d_configuration_item.managed_by, d_configuration_item.domain_key, d_configuration_item.created_on, d_configuration_item.vendor, d_configuration_item.assigned_to, d_configuration_item.department, d_configuration_item.cdctype, d_configuration_item.supported_by, d_configuration_item.changed_by
   FROM #DWH_TABLE_SCHEMA.d_configuration_item) ci_item
   on ci_item.row_key = fi.configuration_item_key
  where cal_mon.lagging_count_of_month between 0 and 12 and fi.soft_deleted_flag='N'
group by inc_cat.source_dimension_name  ,di.caused_by_change_flag,di.is_caused_by_task_flag,di.problem_flag,di.knowledge_flag
order by lower(inc_cat.source_dimension_name) ,di.caused_by_change_flag,di.is_caused_by_task_flag,di.problem_flag,di.knowledge_flag asc