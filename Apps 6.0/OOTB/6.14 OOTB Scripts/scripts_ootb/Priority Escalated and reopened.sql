select inc_pri.source_dimension_name as "Priority",
sum(case when di.priority_escalated_flag='Y' then 1 else 0 end) "Priority Escalated Incidents",
sum(case when di.reopened_flag='Y' then 1 else 0 end) as "Reopened Incidents",
sum(case when di.over_due_flag='Y' and inc_state.state='OPEN' then 1 else 0 end) "Overdue Backlog Incidents",
sum(case when di.priority_escalated_flag= 'Y' and inc_state.state='OPEN' then 1 else 0 end) "Escalated Incident Backlog"
from #DWH_TABLE_SCHEMA.f_incident fi
 JOIN
 (SELECT lov.row_key, lov.row_dn_key, lov.row_current_key, lov.source_id, lov.row_id, lov.dimension_class, COALESCE(lov.dimension_type, 'DEFAULT'::character varying) AS source_dimension_type, COALESCE(lov.dimension_subtype, 'DEFAULT'::character varying) AS source_dimension_subtype, lov.dimension_code AS source_dimension_code, lov.dimension_name AS source_dimension_name, wh_lov.row_id AS wh_row_id, COALESCE(wh_lov.dimension_type, 'DEFAULT'::character varying) AS wh_dimension_type, COALESCE(wh_lov.dimension_subtype, 'DEFAULT'::character varying) AS wh_dimension_subtype, wh_lov.dimension_code AS wh_dimension_code, wh_lov.dimension_name AS wh_dimension_name, lov.lower_range_value
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class::text = 'PRIORITY~INCIDENT'::text
UNION 
 SELECT lov.row_key, lov.row_dn_key, lov.row_current_key, lov.source_id, lov.row_id, lov.dimension_class, COALESCE(lov.dimension_type, 'DEFAULT'::character varying) AS source_dimension_type, COALESCE(lov.dimension_subtype, 'DEFAULT'::character varying) AS source_dimension_subtype, lov.dimension_code AS source_dimension_code, lov.dimension_name AS source_dimension_name, lov.row_id AS wh_row_id, COALESCE(lov.dimension_type, 'DEFAULT'::character varying) AS wh_dimension_type, COALESCE(lov.dimension_subtype, 'DEFAULT'::character varying) AS wh_dimension_subtype, lov.dimension_code AS wh_dimension_code, lov.dimension_name AS wh_dimension_name, 0 AS lower_range_value
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0) inc_pri
 on inc_pri.row_key = fi.priority_src_key
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
on  CAL.row_key= fi.opened_on_key
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
 join #DWH_TABLE_SCHEMA.d_incident di
on fi.incident_key = di.row_key
join 
(SELECT iog.emp_count, iog.cdctype, iog.row_dn_key, iog.parent_row_id, iog.soft_deleted_flag, iog.organization_active_flag, iog.legal_entity_flag, iog.subsidiary_flag, iog.current_flag, iog.state_code, iog.row_id, iog.organization_url, iog.business_unit_flag, iog.postal_code, iog.secondary1_changed_on, iog.effective_from, iog.group_flag, iog.organization_name, iog.organization_contact_id, iog.secondary2_changed_on, iog.fax_phone_number, iog.manager_key, iog.etl_run_number, iog.row_current_key, iog.country_code, iog.dw_updated_on, iog.subsidary_currency_code, iog.source_id, iog.address, iog.subsidary_fiscal_calendar, iog.organization_contact_name, iog.created_by, iog.group_lvl_flag, iog.department_flag, iog.classification_flag, iog.changed_on, iog.effective_to, iog.legal_name, iog.changed_by, iog.city_code, iog.manager_id, iog.inventory_org_flag, iog.created_on, iog.row_key, iog.continent_code, iog.dw_inserted_on, icm.full_name AS manager_name
   FROM #DWH_TABLE_SCHEMA.d_internal_organization iog
   LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact icm ON iog.manager_key = icm.row_key
  WHERE iog.group_flag = 'Y'::bpchar OR iog.row_key = 0 OR iog.row_key = -1) dio
on dio.row_key= fi.assignment_group_key

/*left join (
SELECT d_h_all_hierarchies.lev_20_key, d_h_all_hierarchies.lev_11_id, d_h_all_hierarchies.soft_deleted_flag, d_h_all_hierarchies.lev_1_id, d_h_all_hierarchies.lev_0_key, d_h_all_hierarchies.lev_9_id, d_h_all_hierarchies.lev_14_key, d_h_all_hierarchies.row_id, d_h_all_hierarchies.changed_on, d_h_all_hierarchies.lev_18_id, d_h_all_hierarchies.secondary2_changed_on, d_h_all_hierarchies.lev_17_key, d_h_all_hierarchies.row_current_key, d_h_all_hierarchies.lev_3_id, d_h_all_hierarchies.lev_10_id, d_h_all_hierarchies.lev_8_key, d_h_all_hierarchies.lev_13_id, d_h_all_hierarchies.etl_run_number, d_h_all_hierarchies.lev_20_id, d_h_all_hierarchies.source_id, d_h_all_hierarchies.created_by, d_h_all_hierarchies.hierarchy_class, d_h_all_hierarchies.lev_6_id, d_h_all_hierarchies.lev_13_key, d_h_all_hierarchies.lev_16_key, d_h_all_hierarchies.row_key, d_h_all_hierarchies.current_flag, d_h_all_hierarchies.lev_1_key, d_h_all_hierarchies.cdctype, d_h_all_hierarchies.changed_by, d_h_all_hierarchies.secondary1_changed_on, d_h_all_hierarchies.effective_from, d_h_all_hierarchies.lev_5_key, d_h_all_hierarchies.lev_2_id, d_h_all_hierarchies.lev_11_key, d_h_all_hierarchies.lev_0_id, d_h_all_hierarchies.lev_2_key, d_h_all_hierarchies.lev_5_id, d_h_all_hierarchies.lev_19_key, d_h_all_hierarchies.lev_19_id, d_h_all_hierarchies.dw_inserted_on, d_h_all_hierarchies.created_on, d_h_all_hierarchies.top_level, d_h_all_hierarchies.lev_15_id, d_h_all_hierarchies.lev_17_id, d_h_all_hierarchies.lev_6_key, d_h_all_hierarchies.effective_to, d_h_all_hierarchies.lev_4_key, d_h_all_hierarchies.lev_14_id, d_h_all_hierarchies.lev_12_id, d_h_all_hierarchies.lev_12_key, d_h_all_hierarchies.lev_7_id, d_h_all_hierarchies.lev_16_id, d_h_all_hierarchies.lev_4_id, d_h_all_hierarchies.lev_18_key, d_h_all_hierarchies.dw_updated_on, d_h_all_hierarchies.lev_9_key, d_h_all_hierarchies.lev_10_key, d_h_all_hierarchies.lev_7_key, d_h_all_hierarchies.lev_8_id, d_h_all_hierarchies.lev_3_key, d_h_all_hierarchies.row_dn_key, d_h_all_hierarchies.lev_15_key
   FROM #DWH_TABLE_SCHEMA.d_h_all_hierarchies d_h_all_hierarchies
  WHERE (d_h_all_hierarchies.hierarchy_class::text = 'USER GROUP'::text OR d_h_all_hierarchies.hierarchy_class::text = 'UNSPECIFIED'::text OR
  d_h_all_hierarchies.hierarchy_class::text = 'UNKNOWN'::text) AND d_h_all_hierarchies.current_flag = 'Y'::bpchar) d_hr
  on d_hr.row_key= fi.assignment_group_key
join
  (SELECT d_internal_organization.emp_count, d_internal_organization.cdctype, d_internal_organization.row_dn_key, d_internal_organization.parent_row_id, d_internal_organization.soft_deleted_flag, d_internal_organization.organization_active_flag, d_internal_organization.legal_entity_flag, d_internal_organization.subsidiary_flag, d_internal_organization.current_flag, d_internal_organization.state_code, d_internal_organization.row_id, d_internal_organization.organization_url, d_internal_organization.business_unit_flag, d_internal_organization.postal_code, d_internal_organization.secondary1_changed_on, d_internal_organization.effective_from, d_internal_organization.group_flag, d_internal_organization.organization_name, d_internal_organization.organization_contact_id, d_internal_organization.secondary2_changed_on, d_internal_organization.fax_phone_number, d_internal_organization.manager_key, d_internal_organization.etl_run_number, d_internal_organization.row_current_key, d_internal_organization.country_code, d_internal_organization.dw_updated_on, d_internal_organization.subsidary_currency_code, d_internal_organization.source_id, d_internal_organization.address, d_internal_organization.subsidary_fiscal_calendar, d_internal_organization.organization_contact_name, d_internal_organization.created_by, d_internal_organization.group_lvl_flag, d_internal_organization.department_flag, d_internal_organization.classification_flag, d_internal_organization.changed_on, d_internal_organization.effective_to, d_internal_organization.legal_name, d_internal_organization.changed_by, d_internal_organization.city_code, d_internal_organization.manager_id, d_internal_organization.inventory_org_flag, d_internal_organization.created_on, d_internal_organization.row_key, d_internal_organization.continent_code, d_internal_organization.dw_inserted_on
   FROM #DWH_TABLE_SCHEMA.d_internal_organization d_internal_organization
  WHERE d_internal_organization.group_flag = 'Y'::bpchar AND d_internal_organization.current_flag = 'Y'::bpchar) d_hr_l1
  on d_hr_l1.row_key= d_hr.lev_1_key
 join
  (SELECT d_internal_organization.emp_count, d_internal_organization.cdctype, d_internal_organization.row_dn_key, d_internal_organization.parent_row_id, d_internal_organization.soft_deleted_flag, d_internal_organization.organization_active_flag, d_internal_organization.legal_entity_flag, d_internal_organization.subsidiary_flag, d_internal_organization.current_flag, d_internal_organization.state_code, d_internal_organization.row_id, d_internal_organization.organization_url, d_internal_organization.business_unit_flag, d_internal_organization.postal_code, d_internal_organization.secondary1_changed_on, d_internal_organization.effective_from, d_internal_organization.group_flag, d_internal_organization.organization_name, d_internal_organization.organization_contact_id, d_internal_organization.secondary2_changed_on, d_internal_organization.fax_phone_number, d_internal_organization.manager_key, d_internal_organization.etl_run_number, d_internal_organization.row_current_key, d_internal_organization.country_code, d_internal_organization.dw_updated_on, d_internal_organization.subsidary_currency_code, d_internal_organization.source_id, d_internal_organization.address, d_internal_organization.subsidary_fiscal_calendar, d_internal_organization.organization_contact_name, d_internal_organization.created_by, d_internal_organization.group_lvl_flag, d_internal_organization.department_flag, d_internal_organization.classification_flag, d_internal_organization.changed_on, d_internal_organization.effective_to, d_internal_organization.legal_name, d_internal_organization.changed_by, d_internal_organization.city_code, d_internal_organization.manager_id, d_internal_organization.inventory_org_flag, d_internal_organization.created_on, d_internal_organization.row_key, d_internal_organization.continent_code, d_internal_organization.dw_inserted_on
   FROM #DWH_TABLE_SCHEMA.d_internal_organization d_internal_organization
  WHERE d_internal_organization.group_flag = 'Y'::bpchar AND d_internal_organization.current_flag = 'Y'::bpchar)d_hr_l2
  on d_hr_l2.row_key = d_hr.lev_2_key
join
(SELECT d_internal_organization.emp_count, d_internal_organization.cdctype, d_internal_organization.row_dn_key, d_internal_organization.parent_row_id, d_internal_organization.soft_deleted_flag, d_internal_organization.organization_active_flag, d_internal_organization.legal_entity_flag, d_internal_organization.subsidiary_flag, d_internal_organization.current_flag, d_internal_organization.state_code, d_internal_organization.row_id, d_internal_organization.organization_url, d_internal_organization.business_unit_flag, d_internal_organization.postal_code, d_internal_organization.secondary1_changed_on, d_internal_organization.effective_from, d_internal_organization.group_flag, d_internal_organization.organization_name, d_internal_organization.organization_contact_id, d_internal_organization.secondary2_changed_on, d_internal_organization.fax_phone_number, d_internal_organization.manager_key, d_internal_organization.etl_run_number, d_internal_organization.row_current_key, d_internal_organization.country_code, d_internal_organization.dw_updated_on, d_internal_organization.subsidary_currency_code, d_internal_organization.source_id, d_internal_organization.address, d_internal_organization.subsidary_fiscal_calendar, d_internal_organization.organization_contact_name, d_internal_organization.created_by, d_internal_organization.group_lvl_flag, d_internal_organization.department_flag, d_internal_organization.classification_flag, d_internal_organization.changed_on, d_internal_organization.effective_to, d_internal_organization.legal_name, d_internal_organization.changed_by, d_internal_organization.city_code, d_internal_organization.manager_id, d_internal_organization.inventory_org_flag, d_internal_organization.created_on, d_internal_organization.row_key, d_internal_organization.continent_code, d_internal_organization.dw_inserted_on
   FROM #DWH_TABLE_SCHEMA.d_internal_organization d_internal_organization
  WHERE d_internal_organization.group_flag = 'Y'::bpchar AND d_internal_organization.current_flag = 'Y'::bpchar) d_hr_l3
  on d_hr_l3.row_key= d_hr.lev_3_key*/
/*join
(SELECT d_internal_organization.emp_count, d_internal_organization.cdctype, d_internal_organization.row_dn_key, d_internal_organization.parent_row_id, d_internal_organization.soft_deleted_flag, d_internal_organization.organization_active_flag, d_internal_organization.legal_entity_flag, d_internal_organization.subsidiary_flag, d_internal_organization.current_flag, d_internal_organization.state_code, d_internal_organization.row_id, d_internal_organization.organization_url, d_internal_organization.business_unit_flag, d_internal_organization.postal_code, d_internal_organization.secondary1_changed_on, d_internal_organization.effective_from, d_internal_organization.group_flag, d_internal_organization.organization_name, d_internal_organization.organization_contact_id, d_internal_organization.secondary2_changed_on, d_internal_organization.fax_phone_number, d_internal_organization.manager_key, d_internal_organization.etl_run_number, d_internal_organization.row_current_key, d_internal_organization.country_code, d_internal_organization.dw_updated_on, d_internal_organization.subsidary_currency_code, d_internal_organization.source_id, d_internal_organization.address, d_internal_organization.subsidary_fiscal_calendar, d_internal_organization.organization_contact_name, d_internal_organization.created_by, d_internal_organization.group_lvl_flag, d_internal_organization.department_flag, d_internal_organization.classification_flag, d_internal_organization.changed_on, d_internal_organization.effective_to, d_internal_organization.legal_name, d_internal_organization.changed_by, d_internal_organization.city_code, d_internal_organization.manager_id, d_internal_organization.inventory_org_flag, d_internal_organization.created_on, d_internal_organization.row_key, d_internal_organization.continent_code, d_internal_organization.dw_inserted_on
   FROM #DWH_TABLE_SCHEMA.d_internal_organization d_internal_organization
  WHERE d_internal_organization.group_flag = 'Y'::bpchar AND d_internal_organization.current_flag = 'Y'::bpchar) d_hr_l4
  on d_hr_l4.row_key= d_hr.lev_4_key*/
  left JOIN
  (SELECT d_lov.row_key, d_lov.row_dn_key, d_lov.row_current_key, d_lov.row_id, d_lov.source_id, d_lov.etl_run_number, d_lov.src_rowid, d_lov.dimension_class, d_lov.dimension_type, d_lov.dimension_subtype, d_lov.dimension_code, d_lov.dimension_name, d_lov.lower_range_value, d_lov.upper_range_value, d_lov.soft_deleted_flag, d_lov.created_by, d_lov.changed_by, d_lov.created_on, d_lov.changed_on, d_lov.current_flag, d_lov.effective_from, d_lov.effective_to, d_lov.dw_inserted_on, d_lov.dw_updated_on
   FROM #DWH_TABLE_SCHEMA.d_lov
  WHERE d_lov.dimension_class::text = 'WH_SLA_FLAG~TASK_SLA'::text OR d_lov.row_key = -1 OR d_lov.row_key = 0)inc_resol
  on inc_resol.row_key = di.met_resolution_sla_flag_key
 left JOIN
 (SELECT d_lov.row_key, d_lov.row_dn_key, d_lov.row_current_key, d_lov.row_id, d_lov.source_id, d_lov.etl_run_number, d_lov.src_rowid, d_lov.dimension_class, d_lov.dimension_type, d_lov.dimension_subtype, d_lov.dimension_code, d_lov.dimension_name, d_lov.lower_range_value, d_lov.upper_range_value, d_lov.soft_deleted_flag, d_lov.created_by, d_lov.changed_by, d_lov.created_on, d_lov.changed_on, d_lov.current_flag, d_lov.effective_from, d_lov.effective_to, d_lov.dw_inserted_on, d_lov.dw_updated_on
   FROM #DWH_TABLE_SCHEMA.d_lov
  WHERE d_lov.dimension_class::text = 'WH_SLA_FLAG~TASK_SLA'::text OR d_lov.row_key = -1 OR d_lov.row_key = 0) inc_resp
 on inc_resp.row_key = di.met_response_sla_flag_key
join
  (SELECT lov.row_key, lov.row_dn_key, lov.row_current_key, lov.source_id, lov.row_id, lov.dimension_class, COALESCE(lov.dimension_type, 'DEFAULT'::character varying) AS source_dimension_type, COALESCE(lov.dimension_subtype, 'DEFAULT'::character varying) AS source_dimension_subtype, lov.dimension_code AS source_dimension_code, lov.dimension_name AS source_dimension_name
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.dimension_class::text = 'CATEGORY~INCIDENT'::text OR lov.row_key = -1 OR lov.row_key = 0) inc_cat
  on inc_cat.row_key = fi.category_src_key

 JOIN
 (SELECT d_configuration_item.supported_by, d_configuration_item.row_current_key, d_configuration_item.asset_tag, d_configuration_item.location_key, d_configuration_item.assigned_to, d_configuration_item.domain_key, d_configuration_item.cdctype, d_configuration_item.subcategory, d_configuration_item.managed_by, d_configuration_item.row_id, d_configuration_item.source_id, d_configuration_item.changed_on, d_configuration_item.service_level, d_configuration_item."class", d_configuration_item.support_group, d_configuration_item.name, d_configuration_item.device_name, d_configuration_item.company, d_configuration_item.secondary2_changed_on, d_configuration_item.vendor, d_configuration_item.pivot_date, d_configuration_item.etl_run_number, d_configuration_item.category, d_configuration_item.company_key, d_configuration_item.ci_type, d_configuration_item.created_by, d_configuration_item.soft_deleted_flag, d_configuration_item.manufacturer, d_configuration_item.department, d_configuration_item.changed_by, d_configuration_item.row_key, d_configuration_item.created_on, d_configuration_item."location", d_configuration_item.owned_by, d_configuration_item.secondary1_changed_on, d_configuration_item.model_number, d_configuration_item.dw_inserted_on, d_configuration_item.dw_updated_on, d_configuration_item.lease_contract, d_configuration_item.ci_team, d_configuration_item.row_dn_key
   FROM #DWH_TABLE_SCHEMA.d_configuration_item) ci
   on ci.row_key = fi.configuration_item_key
 JOIN
 (SELECT d_organization_customer.row_key, d_organization_customer.row_dn_key, d_organization_customer.row_current_key, 'ORG_CUST' AS "class", concat('ORG_CUST~'::text, d_organization_customer.row_id::text)::character varying AS row_id, d_organization_customer.source_id, d_organization_customer.etl_run_number, d_organization_customer.customer_number AS party_id, d_organization_customer.parent_row_id, NULL::"unknown" AS title, NULL::"unknown" AS first_name, NULL::"unknown" AS middle_name, NULL::"unknown" AS last_name, d_organization_customer.organization_name AS name, d_organization_customer.st_address1, d_organization_customer.st_address2, d_organization_customer.st_address3, d_organization_customer.st_address4, d_organization_customer.city_code, d_organization_customer.state_code, d_organization_customer.postal_code, d_organization_customer.country_code, d_organization_customer.email_address, NULL::"unknown" AS mobile_number, d_organization_customer.work_phone, d_organization_customer.fax_number, NULL::"unknown" AS pager_number, d_organization_customer.organization_active_flag AS active_flag, d_organization_customer.preferred_language, d_organization_customer.credit_score, d_organization_customer.customer_since_date, NULL::"unknown" AS professional_title, d_organization_customer.soft_deleted_flag, d_organization_customer.created_by, d_organization_customer.changed_by, d_organization_customer.created_on, d_organization_customer.changed_on, d_organization_customer.current_flag, d_organization_customer.effective_from, d_organization_customer.effective_to, d_organization_customer.dw_inserted_on, d_organization_customer.dw_updated_on, d_organization_customer.enduser_flag, d_organization_customer.reseller_flag, d_organization_customer.distributor_flag, d_organization_customer.customer_contact1_name, d_organization_customer.customer_contact2_name, d_organization_customer.customer_contact3_name, d_organization_customer.renewalstatus, wh.wh_dim_code AS renewalstatus_wh_code
   FROM #DWH_TABLE_SCHEMA.d_organization_customer d_organization_customer
   LEFT JOIN (
   SELECT lov.dimension_code AS src_dim_code, wh_lov.dimension_code AS wh_dim_code
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'CUSTOMER RENEWAL STATUS'
   ) wh ON d_organization_customer.renewalstatus::text = wh.src_dim_code::text
  WHERE d_organization_customer.row_key <> 0 AND d_organization_customer.row_key <> -1
UNION ALL 
 SELECT d_organization_customer.row_key, d_organization_customer.row_dn_key, d_organization_customer.row_current_key, 'ORG_CUST' AS "class", concat('ORG_CUST~'::text, d_organization_customer.row_id::text)::character varying AS row_id, d_organization_customer.source_id, d_organization_customer.etl_run_number, d_organization_customer.customer_number AS party_id, d_organization_customer.parent_row_id, NULL::"unknown" AS title, NULL::"unknown" AS first_name, NULL::"unknown" AS middle_name, NULL::"unknown" AS last_name, d_organization_customer.organization_name AS name, d_organization_customer.st_address1, d_organization_customer.st_address2, d_organization_customer.st_address3, d_organization_customer.st_address4, d_organization_customer.city_code, d_organization_customer.state_code, d_organization_customer.postal_code, d_organization_customer.country_code, d_organization_customer.email_address, NULL::"unknown" AS mobile_number, d_organization_customer.work_phone, d_organization_customer.fax_number, NULL::"unknown" AS pager_number, d_organization_customer.organization_active_flag AS active_flag, d_organization_customer.preferred_language, d_organization_customer.credit_score, d_organization_customer.customer_since_date, NULL::"unknown" AS professional_title, d_organization_customer.soft_deleted_flag, d_organization_customer.created_by, d_organization_customer.changed_by, d_organization_customer.created_on, d_organization_customer.changed_on, d_organization_customer.current_flag, d_organization_customer.effective_from, d_organization_customer.effective_to, d_organization_customer.dw_inserted_on, d_organization_customer.dw_updated_on, d_organization_customer.enduser_flag, d_organization_customer.reseller_flag, d_organization_customer.distributor_flag, d_organization_customer.customer_contact1_name, d_organization_customer.customer_contact2_name, d_organization_customer.customer_contact3_name, d_organization_customer.renewalstatus, d_organization_customer.renewalstatus AS renewalstatus_wh_code
   FROM #DWH_TABLE_SCHEMA.d_organization_customer d_organization_customer
  WHERE d_organization_customer.row_key = 0 OR d_organization_customer.row_key = -1) cust
  on cust.row_key = fi.customer_key
 JOIN 
 (SELECT d_organization_customer.row_key, d_organization_customer.row_dn_key, d_organization_customer.row_current_key, 'ORG_CUST' AS "class", concat('ORG_CUST~'::text, d_organization_customer.row_id::text)::character varying AS row_id, d_organization_customer.source_id, d_organization_customer.etl_run_number, d_organization_customer.customer_number AS party_id, d_organization_customer.parent_row_id, NULL::"unknown" AS title, NULL::"unknown" AS first_name, NULL::"unknown" AS middle_name, NULL::"unknown" AS last_name, d_organization_customer.organization_name AS name, d_organization_customer.st_address1, d_organization_customer.st_address2, d_organization_customer.st_address3, d_organization_customer.st_address4, d_organization_customer.city_code, d_organization_customer.state_code, d_organization_customer.postal_code, d_organization_customer.country_code, d_organization_customer.email_address, NULL::"unknown" AS mobile_number, d_organization_customer.work_phone, d_organization_customer.fax_number, NULL::"unknown" AS pager_number, d_organization_customer.organization_active_flag AS active_flag, d_organization_customer.preferred_language, d_organization_customer.credit_score, d_organization_customer.customer_since_date, NULL::"unknown" AS professional_title, d_organization_customer.soft_deleted_flag, d_organization_customer.created_by, d_organization_customer.changed_by, d_organization_customer.created_on, d_organization_customer.changed_on, d_organization_customer.current_flag, d_organization_customer.effective_from, d_organization_customer.effective_to, d_organization_customer.dw_inserted_on, d_organization_customer.dw_updated_on, d_organization_customer.enduser_flag, d_organization_customer.distributor_flag, d_organization_customer.reseller_flag, d_organization_customer.customer_category_code, d_organization_customer.customer_type_code, d_organization_customer.customer_class_code, b.row_key AS customer_segment_key, d_organization_customer.customer_contact1_name, d_organization_customer.customer_contact2_name, d_organization_customer.customer_contact3_name, d_organization_customer.renewalstatus, wh.wh_dim_code AS renewalstatus_wh_code
   FROM #DWH_TABLE_SCHEMA.d_organization_customer d_organization_customer
   LEFT JOIN ldb.d_customer_segment b ON d_organization_customer.customer_segment >= b.lower_range_value AND d_organization_customer.customer_segment <= b.upper_range_value
   LEFT JOIN (
   SELECT lov.dimension_code AS src_dim_code, wh_lov.dimension_code AS wh_dim_code
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'CUSTOMER RENEWAL STATUS') wh ON d_organization_customer.renewalstatus::text = wh.src_dim_code::text
  WHERE d_organization_customer.row_key <> 0 AND d_organization_customer.row_key <> -1 AND d_organization_customer.current_flag = 'Y'::bpchar
UNION ALL 
 SELECT d_organization_customer.row_key, d_organization_customer.row_dn_key, d_organization_customer.row_current_key, 'ORG_CUST' AS "class", concat('ORG_CUST~'::text, d_organization_customer.row_id::text)::character varying AS row_id, d_organization_customer.source_id, d_organization_customer.etl_run_number, d_organization_customer.customer_number AS party_id, d_organization_customer.parent_row_id, NULL::"unknown" AS title, NULL::"unknown" AS first_name, NULL::"unknown" AS middle_name, NULL::"unknown" AS last_name, d_organization_customer.organization_name AS name, d_organization_customer.st_address1, d_organization_customer.st_address2, d_organization_customer.st_address3, d_organization_customer.st_address4, d_organization_customer.city_code, d_organization_customer.state_code, d_organization_customer.postal_code, d_organization_customer.country_code, d_organization_customer.email_address, NULL::"unknown" AS mobile_number, d_organization_customer.work_phone, d_organization_customer.fax_number, NULL::"unknown" AS pager_number, d_organization_customer.organization_active_flag AS active_flag, d_organization_customer.preferred_language, d_organization_customer.credit_score, d_organization_customer.customer_since_date, NULL::"unknown" AS professional_title, d_organization_customer.soft_deleted_flag, d_organization_customer.created_by, d_organization_customer.changed_by, d_organization_customer.created_on, d_organization_customer.changed_on, d_organization_customer.current_flag, d_organization_customer.effective_from, d_organization_customer.effective_to, d_organization_customer.dw_inserted_on, d_organization_customer.dw_updated_on, d_organization_customer.enduser_flag, d_organization_customer.distributor_flag, d_organization_customer.reseller_flag, d_organization_customer.customer_category_code, d_organization_customer.customer_type_code, d_organization_customer.customer_class_code, 0 AS customer_segment_key, d_organization_customer.customer_contact1_name, d_organization_customer.customer_contact2_name, NULL::"unknown" AS customer_contact3_name, d_organization_customer.renewalstatus, d_organization_customer.renewalstatus AS renewalstatus_wh_code
   FROM #DWH_TABLE_SCHEMA.d_organization_customer d_organization_customer
  WHERE d_organization_customer.row_key = 0 OR d_organization_customer.row_key = -1) cust_mdm
  on cust_mdm.row_key = cust.row_current_key
  JOIN
  (SELECT d_domain.domain_value, d_domain.created_on, d_domain.source_id, d_domain.soft_deleted_flag, d_domain.secondary2_changed_on, d_domain.changed_by, d_domain.row_current_key, d_domain.etl_run_number, d_domain.domain_name, d_domain.secondary1_changed_on, d_domain.domain_type, d_domain.created_by, d_domain.changed_on, d_domain.dw_inserted_on, d_domain.row_key, d_domain.row_id, d_domain.dw_updated_on, d_domain.active_flag, d_domain.cdctype, d_domain.row_dn_key
   FROM #DWH_TABLE_SCHEMA.d_domain) dom
  on dom.row_key = fi.domain_key
  where cal_mon.lagging_count_of_month between 0 and 12
  and fi.soft_deleted_flag='N' -- and 
 -- (( inc_resol.dimension_name='BREACHED' or inc_resol.dimension_name ='ACHIEVED') or (inc_resp.dimension_name='BREACHED' or inc_resp.dimension_name='ACHIEVED'))
group by inc_pri.source_dimension_name,inc_pri.row_key
  --cal_mon.month_name_abbreviated,cal_mon.year_name,cal_mon.row_key
  --dio.organization_name,dio.row_key
  order by --cal_mon.row_key asc ,cal_mon.month_name_abbreviated,cal_mon.year_name
  inc_pri.row_key asc,inc_pri.source_dimension_name
  --dio.row_key asc, dio.organization_name