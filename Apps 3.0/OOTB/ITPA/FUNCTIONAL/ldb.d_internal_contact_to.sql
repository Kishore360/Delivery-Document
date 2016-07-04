 SELECT d_internal_contact.last_name, 
 d_internal_contact.work_phone, d_internal_contact.row_current_key,
 d_internal_contact.department_code, d_internal_contact.city_code,
 d_internal_contact.sales_rep_flag, d_internal_contact.identification_number, 
 d_internal_contact.first_name, d_internal_contact.dw_inserted_on,
 d_internal_contact.dw_updated_on, d_internal_contact.changed_on,
 d_internal_contact.row_dn_key, d_internal_contact.row_id, d_internal_contact.effective_from,
 d_internal_contact.time_zone, d_internal_contact.employment_type, d_internal_contact.mobile_number, 
 d_internal_contact.cdctype, d_internal_contact.full_name, d_internal_contact.state_code, d_internal_contact.row_key, d_internal_contact.created_by, d_internal_contact.user_name, d_internal_contact.st_address1, d_internal_contact.cost_center, d_internal_contact.email_address, d_internal_contact.st_address4, d_internal_contact.business_hours_per_day, d_internal_contact.pivot_date, d_internal_contact.service_rep_flag, d_internal_contact.vip_flag, d_internal_contact.middle_name, d_internal_contact.gender_code, d_internal_contact.source_id, d_internal_contact.created_on, d_internal_contact.st_address2, d_internal_contact.role_id, d_internal_contact.effective_to, d_internal_contact.etl_run_number, d_internal_contact.location_key, d_internal_contact.parent_row_id, d_internal_contact.st_address3, d_internal_contact.secondary1_changed_on, d_internal_contact.current_flag, d_internal_contact.postal_code, d_internal_contact.soft_deleted_flag, d_internal_contact.country_code, d_internal_contact.title, d_internal_contact.company_name, d_internal_contact.changed_by, d_internal_contact.expense_user, d_internal_contact.geo_key, d_internal_contact.preferred_language, d_internal_contact.contact_active_flag, d_internal_contact.secondary2_changed_on
   FROM <<tenant>>_mdwdb.d_internal_contact order by row_key;
