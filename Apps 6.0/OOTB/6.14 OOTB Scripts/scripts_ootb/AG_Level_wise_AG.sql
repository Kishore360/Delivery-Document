select dio1.organization_name as Assignment_Group_Level_1,dio2.organization_name as Assignment_Group_Level_2,
dio3.organization_name as Assignement_Group_Level_3, dio4.organization_name as Assignment_Group_Level_4,
count(1) as AG_Level_1_Excl_Unknown_Unspecified,count(dah.lev_2_id) as AG_Level_2_Excl_Unknown_Unspecified,
count(dah.lev_3_id) as AG_Level_3_Excl_Unknown_Unspecified,count(dah.lev_4_id) as AG_Level_4_Excl_Unknown_Unspecified
from #DWH_TABLE_SCHEMA.f_incident f
join #DWH_TABLE_SCHEMA.d_incident d
on f.incident_key=d.row_key
join (SELECT d_h_all_hierarchies.lev_3_id, d_h_all_hierarchies.lev_16_id, d_h_all_hierarchies.lev_0_key,
d_h_all_hierarchies.row_id, d_h_all_hierarchies.lev_14_id, d_h_all_hierarchies.lev_5_id,
d_h_all_hierarchies.soft_deleted_flag, d_h_all_hierarchies.lev_12_id, d_h_all_hierarchies.row_dn_key, 
d_h_all_hierarchies.changed_by, d_h_all_hierarchies.lev_7_key, d_h_all_hierarchies.lev_6_key,
d_h_all_hierarchies.effective_from, d_h_all_hierarchies.etl_run_number, d_h_all_hierarchies.hierarchy_class,
d_h_all_hierarchies.lev_14_key, d_h_all_hierarchies.secondary1_changed_on, d_h_all_hierarchies.lev_0_id, 
d_h_all_hierarchies.lev_6_id, d_h_all_hierarchies.cdctype, d_h_all_hierarchies.lev_10_key, 
d_h_all_hierarchies.lev_5_key, d_h_all_hierarchies.lev_16_key, d_h_all_hierarchies.lev_4_id, 
d_h_all_hierarchies.dw_updated_on, d_h_all_hierarchies.lev_8_key, d_h_all_hierarchies.lev_9_id, 
d_h_all_hierarchies.secondary2_changed_on, d_h_all_hierarchies.source_id, d_h_all_hierarchies.lev_13_id,
d_h_all_hierarchies.lev_11_key, d_h_all_hierarchies.lev_18_key, d_h_all_hierarchies.created_by, 
d_h_all_hierarchies.created_on, d_h_all_hierarchies.lev_20_key, d_h_all_hierarchies.changed_on, 
d_h_all_hierarchies.lev_9_key, d_h_all_hierarchies.lev_11_id, d_h_all_hierarchies.lev_13_key, 
d_h_all_hierarchies.lev_20_id, d_h_all_hierarchies.lev_2_id, d_h_all_hierarchies.lev_8_id, 
d_h_all_hierarchies.row_current_key, d_h_all_hierarchies.lev_1_id, d_h_all_hierarchies.lev_18_id,
d_h_all_hierarchies.lev_12_key, d_h_all_hierarchies.lev_17_id, d_h_all_hierarchies.lev_7_id, 
d_h_all_hierarchies.row_key, d_h_all_hierarchies.lev_19_key, d_h_all_hierarchies.lev_4_key, 
d_h_all_hierarchies.lev_3_key, d_h_all_hierarchies.lev_15_id, d_h_all_hierarchies.lev_15_key,
d_h_all_hierarchies.current_flag, d_h_all_hierarchies.dw_inserted_on, d_h_all_hierarchies.lev_2_key,
d_h_all_hierarchies.effective_to, d_h_all_hierarchies.lev_10_id, d_h_all_hierarchies.lev_19_id,
d_h_all_hierarchies.top_level, d_h_all_hierarchies.lev_1_key, d_h_all_hierarchies.lev_17_key
   FROM #DWH_TABLE_SCHEMA.d_h_all_hierarchies d_h_all_hierarchies
  WHERE (d_h_all_hierarchies.hierarchy_class::text = 'USER GROUP'::text OR d_h_all_hierarchies.hierarchy_class::text = 'UNSPECIFIED'::text OR d_h_all_hierarchies.hierarchy_class::text = 'UNKNOWN'::text) AND d_h_all_hierarchies.current_flag = 'Y'::bpchar
) dah
on d.row_key=dah.lev_0_key
  join 
 (SELECT d_internal_organization.department_flag, d_internal_organization.emp_count, d_internal_organization.organization_contact_id, d_internal_organization.city_code, d_internal_organization.row_id, d_internal_organization.fax_phone_number, d_internal_organization.legal_name,
 d_internal_organization.source_id, d_internal_organization.current_flag, d_internal_organization.effective_from, d_internal_organization.manager_key, d_internal_organization.organization_active_flag, d_internal_organization.business_unit_flag, d_internal_organization.parent_row_id, d_internal_organization.effective_to, d_internal_organization.dw_inserted_on,
 d_internal_organization.secondary2_changed_on, d_internal_organization.address, d_internal_organization.dw_updated_on, d_internal_organization.organization_name,
 d_internal_organization.group_flag, d_internal_organization.inventory_org_flag, d_internal_organization.created_on,
 d_internal_organization.soft_deleted_flag, d_internal_organization.state_code, d_internal_organization.secondary1_changed_on, 
 d_internal_organization.continent_code, d_internal_organization.created_by, d_internal_organization.subsidary_currency_code,
 d_internal_organization.row_current_key, d_internal_organization.row_key, d_internal_organization.etl_run_number,
 d_internal_organization.group_lvl_flag, d_internal_organization.country_code, d_internal_organization.legal_entity_flag,
 d_internal_organization.organization_contact_name, d_internal_organization.manager_id, d_internal_organization.changed_by, d_internal_organization.row_dn_key,
 d_internal_organization.classification_flag, d_internal_organization.subsidiary_flag, d_internal_organization.postal_code, d_internal_organization.organization_url, 
 d_internal_organization.changed_on, d_internal_organization.cdctype, d_internal_organization.subsidary_fiscal_calendar
   FROM #DWH_TABLE_SCHEMA.d_internal_organization d_internal_organization
  WHERE d_internal_organization.group_flag = 'Y'::bpchar AND d_internal_organization.current_flag = 'Y'::bpchar AND d_internal_organization.organization_name not in ('UNSPECIFIED','UNKNOWN')	) dio1
ON dio1.row_key=dah.lev_1_key
join 
 (SELECT d_internal_organization.department_flag, d_internal_organization.emp_count, d_internal_organization.organization_contact_id, d_internal_organization.city_code, d_internal_organization.row_id, d_internal_organization.fax_phone_number, d_internal_organization.legal_name, d_internal_organization.source_id, d_internal_organization.current_flag, d_internal_organization.effective_from, d_internal_organization.manager_key, d_internal_organization.organization_active_flag, d_internal_organization.business_unit_flag, d_internal_organization.parent_row_id, d_internal_organization.effective_to, d_internal_organization.dw_inserted_on, d_internal_organization.secondary2_changed_on, d_internal_organization.address, d_internal_organization.dw_updated_on, d_internal_organization.organization_name, d_internal_organization.group_flag, d_internal_organization.inventory_org_flag, d_internal_organization.created_on, d_internal_organization.soft_deleted_flag, d_internal_organization.state_code, d_internal_organization.secondary1_changed_on, d_internal_organization.continent_code, d_internal_organization.created_by, d_internal_organization.subsidary_currency_code, d_internal_organization.row_current_key, d_internal_organization.row_key, d_internal_organization.etl_run_number, d_internal_organization.group_lvl_flag, d_internal_organization.country_code, d_internal_organization.legal_entity_flag, d_internal_organization.organization_contact_name, d_internal_organization.manager_id, d_internal_organization.changed_by, d_internal_organization.row_dn_key, d_internal_organization.classification_flag, d_internal_organization.subsidiary_flag, d_internal_organization.postal_code, d_internal_organization.organization_url, d_internal_organization.changed_on, d_internal_organization.cdctype, d_internal_organization.subsidary_fiscal_calendar
   FROM #DWH_TABLE_SCHEMA.d_internal_organization d_internal_organization
  WHERE d_internal_organization.group_flag = 'Y'::bpchar AND d_internal_organization.current_flag = 'Y'::bpchar) dio2
ON dio2.row_key=dah.lev_2_key
join 
 (SELECT d_internal_organization.department_flag, d_internal_organization.emp_count, d_internal_organization.organization_contact_id, d_internal_organization.city_code, d_internal_organization.row_id, d_internal_organization.fax_phone_number, d_internal_organization.legal_name, d_internal_organization.source_id, d_internal_organization.current_flag, d_internal_organization.effective_from, d_internal_organization.manager_key, d_internal_organization.organization_active_flag, d_internal_organization.business_unit_flag, d_internal_organization.parent_row_id, d_internal_organization.effective_to, d_internal_organization.dw_inserted_on, d_internal_organization.secondary2_changed_on, d_internal_organization.address, d_internal_organization.dw_updated_on, d_internal_organization.organization_name, d_internal_organization.group_flag, d_internal_organization.inventory_org_flag, d_internal_organization.created_on, d_internal_organization.soft_deleted_flag, d_internal_organization.state_code, d_internal_organization.secondary1_changed_on, d_internal_organization.continent_code, d_internal_organization.created_by, d_internal_organization.subsidary_currency_code, d_internal_organization.row_current_key, d_internal_organization.row_key, d_internal_organization.etl_run_number, d_internal_organization.group_lvl_flag, d_internal_organization.country_code, d_internal_organization.legal_entity_flag, d_internal_organization.organization_contact_name, d_internal_organization.manager_id, d_internal_organization.changed_by, d_internal_organization.row_dn_key, d_internal_organization.classification_flag, d_internal_organization.subsidiary_flag, d_internal_organization.postal_code, d_internal_organization.organization_url, d_internal_organization.changed_on, d_internal_organization.cdctype, d_internal_organization.subsidary_fiscal_calendar
   FROM #DWH_TABLE_SCHEMA.d_internal_organization d_internal_organization
  WHERE d_internal_organization.group_flag = 'Y'::bpchar AND d_internal_organization.current_flag = 'Y'::bpchar) dio3
ON dio3.row_key=dah.lev_3_key
join 
 (SELECT d_internal_organization.department_flag, d_internal_organization.emp_count, d_internal_organization.organization_contact_id, d_internal_organization.city_code, d_internal_organization.row_id, d_internal_organization.fax_phone_number, d_internal_organization.legal_name, d_internal_organization.source_id, d_internal_organization.current_flag, d_internal_organization.effective_from, d_internal_organization.manager_key, d_internal_organization.organization_active_flag, d_internal_organization.business_unit_flag, d_internal_organization.parent_row_id, d_internal_organization.effective_to, d_internal_organization.dw_inserted_on, d_internal_organization.secondary2_changed_on, d_internal_organization.address, d_internal_organization.dw_updated_on, d_internal_organization.organization_name, d_internal_organization.group_flag, d_internal_organization.inventory_org_flag, d_internal_organization.created_on, d_internal_organization.soft_deleted_flag, d_internal_organization.state_code, d_internal_organization.secondary1_changed_on, d_internal_organization.continent_code, d_internal_organization.created_by, d_internal_organization.subsidary_currency_code, d_internal_organization.row_current_key, d_internal_organization.row_key, d_internal_organization.etl_run_number, d_internal_organization.group_lvl_flag, d_internal_organization.country_code, d_internal_organization.legal_entity_flag, d_internal_organization.organization_contact_name, d_internal_organization.manager_id, d_internal_organization.changed_by, d_internal_organization.row_dn_key, d_internal_organization.classification_flag, d_internal_organization.subsidiary_flag, d_internal_organization.postal_code, d_internal_organization.organization_url, d_internal_organization.changed_on, d_internal_organization.cdctype, d_internal_organization.subsidary_fiscal_calendar
   FROM #DWH_TABLE_SCHEMA.d_internal_organization d_internal_organization
  WHERE d_internal_organization.group_flag = 'Y'::bpchar AND d_internal_organization.current_flag = 'Y'::bpchar) dio4
ON dio4.row_key=dah.lev_4_key
group by dio1.organization_name,dio2.organization_name,dio3.organization_name,dio4.organization_name
order by dio1.organization_name,dio2.organization_name,dio3.organization_name,dio4.organization_name
