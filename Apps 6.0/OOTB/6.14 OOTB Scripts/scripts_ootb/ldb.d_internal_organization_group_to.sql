 SELECT d_internal_organization.group_flag, d_internal_organization.cdctype, d_internal_organization.city_code, d_internal_organization.parent_row_id, d_internal_organization.created_by, d_internal_organization.subsidary_fiscal_calendar, d_internal_organization.dw_updated_on, d_internal_organization.current_flag, d_internal_organization.country_code, d_internal_organization.soft_deleted_flag, d_internal_organization.changed_by, d_internal_organization.business_unit_flag, d_internal_organization.secondary2_changed_on, d_internal_organization.dw_inserted_on, d_internal_organization.fax_phone_number, d_internal_organization.secondary1_changed_on, d_internal_organization.address, d_internal_organization.source_id, d_internal_organization.etl_run_number, d_internal_organization.organization_url, d_internal_organization.inventory_org_flag, d_internal_organization.row_dn_key, d_internal_organization.row_key, d_internal_organization.continent_code, d_internal_organization.postal_code, d_internal_organization.effective_to, d_internal_organization.state_code, d_internal_organization.legal_name, d_internal_organization.row_current_key, d_internal_organization.legal_entity_flag, d_internal_organization.created_on, d_internal_organization.row_id, d_internal_organization.organization_contact_name, d_internal_organization.subsidiary_flag, d_internal_organization.changed_on, d_internal_organization.effective_from, d_internal_organization.organization_contact_id, d_internal_organization.subsidary_currency_code, d_internal_organization.organization_name, d_internal_organization.organization_active_flag, d_internal_organization.classification_flag, d_internal_organization.department_flag
   FROM #DWH_TABLE_SCHEMA.d_internal_organization
  WHERE d_internal_organization.group_flag = 'Y'::bpchar 
  OR d_internal_organization.row_key = 0 OR d_internal_organization.row_key = -1;
