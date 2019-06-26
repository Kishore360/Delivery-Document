select 'ldb.f_case a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_case a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_case a11 
 join ldb.d_internal_contact a12 
	on (a11.assigned_to_key = a12.row_key)  
union
select 'ldb.d_case a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_case a11 
 join ldb.d_case a13 
	on (a11.case_key = a13.row_key)  
union
select 'ldb.d_business_service a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_case a11 
 join ldb.d_business_service a14 
	on (a11.business_service_key = a14.row_key)  
union
select 'ldb.d_calendar_date a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_case a11 
 join ldb.d_calendar_date a15 
	on (a11.opened_on_key = a15.row_key)  
union
select 'ldb.d_configuration_item a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_case a11 
 join ldb.d_configuration_item a16 
	on (a11.configuration_item_key = a16.row_key)  
union
select 'ldb.d_customer a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_case a11 
 join ldb.d_customer a17 
	on (a11.customer_account_key = a17.row_key)  
union
select 'ldb.d_calendar_time a18 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_case a11 
 join ldb.d_calendar_time a18 
	on (a11.opened_time_key = a18.row_key)  
union
select 'ldb.d_tribe_c a19 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_case a11 
 join ldb.d_tribe_c a19 
	on (a11.tribe_c_key = a19.row_key)  
union
select 'ldb.d_segment_c a110 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_case a11 
 join ldb.d_tribe_c a19 
 on (a11.tribe_c_key = a19.row_key) 
	join ldb.d_segment_c a110 
	on (a19.segment_c_key = a110.row_key)  
union
select 'ldb.d_asset a111 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_case a11 
 join ldb.d_asset a111 
	on (a11.asset_key = a111.row_key)  
union
select 'ldb.d_internal_organization_group a112 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_case a11 
 join ldb.d_internal_organization_group a112 
	on (a11.assignment_group_key = a112.row_key)  
union
select 'ldb.d_case_3rd_party_status_c a113 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_case a11 
 join ldb.d_case_3rd_party_status_c a113 
	on (a11.third_party_status_src_c_key = a113.row_key)  
union
select 'ldb.d_case_partner a114 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_case a11 
 join ldb.d_case_partner a114 
	on (a11.partner_key = a114.row_key)  
union
select 'ldb.d_case_cause_code_c a115 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_case a11 
 join ldb.d_case_cause_code_c a115 
	on (a11.case_cause_code_src_c_key = a115.row_key)  
union
select 'ldb.d_internal_organization_legalentity a116 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_case a11 
 join ldb.d_internal_organization_legalentity a116 
	on (a11.company_key = a116.row_key)  
union
select 'ldb.d_internal_contact_case_contact_c a117 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_case a11 
 join ldb.d_internal_contact_case_contact_c a117 
	on (a11.contact_c_key = a117.row_key)  
union
select 'ldb.d_service_contract a118 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_case a11 
 join ldb.d_service_contract a118 
	on (a11.service_contract_key = a118.row_key)  
union
select 'ldb.d_internal_contact_mdm a119 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_case a11 
 join ldb.d_internal_contact a12 
 on (a11.assigned_to_key = a12.row_key) 
	join ldb.d_internal_contact_mdm a119 
	on (a12.row_current_key = a119.row_current_key)  
union
select 'ldb.d_service_entitlement a120 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_case a11 
 join ldb.d_service_entitlement a120 
	on (a11.service_entitlement_key = a120.row_key)  
union
select 'ldb.d_case_escalated_reason_c a121 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_case a11 
 join ldb.d_case_escalated_reason_c a121 
	on (a11.escalated_reason_src_c_key = a121.row_key)  
union
select 'ldb.d_ibm_accounts_c a122 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_case a11 
 join ldb.d_ibm_accounts_c a122 
	on (a11.ibm_accounts_c_key = a122.row_key)  
union
select 'ldb.d_location a123 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_case a11 
 join ldb.d_location a123 
	on (a11.location_key = a123.row_key)  
union
select 'ldb.d_product_model a124 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_case a11 
 join ldb.d_product_model a124 
	on (a11.product_model_key = a124.row_key)  
union
select 'ldb.d_case_soft_layer_subject_c a125 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_case a11 
 join ldb.d_case_soft_layer_subject_c a125 
	on (a11.soft_layer_subject_src_c_key = a125.row_key)  
union
select 'ldb.d_case_support_tier_c a126 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_case a11 
 join ldb.d_case_support_tier_c a126 
	on (a11.support_tier_src_c_key = a126.row_key)  
union
select 'ldb.d_case_support_type_c a127 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_case a11 
 join ldb.d_case_support_type_c a127 
	on (a11.support_type_src_c_key = a127.row_key)  
union
select 'ldb.d_case_ticket_priority_c a128 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_case a11 
 join ldb.d_case_ticket_priority_c a128 
	on (a11.ticket_priority_src_c_key = a128.row_key)  
union
select 'ldb.d_business_service_criticality a129 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_case a11 
 join ldb.d_business_service a14 
 on (a11.business_service_key = a14.row_key) 
	join ldb.d_business_service_criticality a129 
	on (a14.criticality_key = a129.row_key)  
union
select 'ldb.d_business_service_used_for a130 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_case a11 
 join ldb.d_business_service a14 
 on (a11.business_service_key = a14.row_key) 
	join ldb.d_business_service_used_for a130 
	on (a14.used_for_src_key = a130.row_key)  
union
select 'ldb.d_calendar_month a131 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_case a11 
 join ldb.d_calendar_date a15 
 on (a11.opened_on_key = a15.row_key) 
	join ldb.d_calendar_month a131 
	on (a15.month_start_date_key = a131.row_key)  
union
select 'ldb.d_calendar_week a132 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_case a11 
 join ldb.d_calendar_date a15 
 on (a11.opened_on_key = a15.row_key) 
	join ldb.d_calendar_week a132 
	on (a15.week_start_date_key = a132.row_key)  
union
select 'ldb.d_case_approval a133 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_case a11 
 join ldb.d_case a13 
 on (a11.case_key = a13.row_key) 
	join ldb.d_case_approval a133 
	on (a13.approval_state_src_key = a133.row_key)  
union
select 'ldb.d_case_category a134 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_case a11 
 join ldb.d_case a13 
 on (a11.case_key = a13.row_key) 
	join ldb.d_case_category a134 
	on (a13.category_src_key = a134.row_key)  
union
select 'ldb.d_case_impact a135 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_case a11 
 join ldb.d_case a13 
 on (a11.case_key = a13.row_key) 
	join ldb.d_case_impact a135 
	on (a13.impact_src_key = a135.row_key)  
union
select 'ldb.d_case_overall_sla_flag a136 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_case a11 
 join ldb.d_case a13 
 on (a11.case_key = a13.row_key) 
	join ldb.d_case_overall_sla_flag a136 
	on (a13.overall_sla_outcome_flag_key = a136.row_key)  
union
select 'ldb.d_case_priority a137 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_case a11 
 join ldb.d_case a13 
 on (a11.case_key = a13.row_key) 
	join ldb.d_case_priority a137 
	on (a13.priority_src_key = a137.row_key)  
union
select 'ldb.d_case_sla_resolution_flag a138 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_case a11 
 join ldb.d_case a13 
 on (a11.case_key = a13.row_key) 
	join ldb.d_case_sla_resolution_flag a138 
	on (a13.met_resolution_sla_flag_key = a138.row_key)  
union
select 'ldb.d_case_sla_response_flag a139 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_case a11 
 join ldb.d_case a13 
 on (a11.case_key = a13.row_key) 
	join ldb.d_case_sla_response_flag a139 
	on (a13.met_response_sla_flag_key = a139.row_key)  
union
select 'ldb.d_case_state a140 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_case a11 
 join ldb.d_case a13 
 on (a11.case_key = a13.row_key) 
	join ldb.d_case_state a140 
	on (a13.state_src_key = a140.row_key)  
union
select 'ldb.d_case_subcategory a141 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_case a11 
 join ldb.d_case a13 
 on (a11.case_key = a13.row_key) 
	join ldb.d_case_subcategory a141 
	on (a13.sub_category_src_key = a141.row_key)  
union
select 'ldb.d_case_urgency a142 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_case a11 
 join ldb.d_case a13 
 on (a11.case_key = a13.row_key) 
	join ldb.d_case_urgency a142 
	on (a13.urgency_src_key = a142.row_key)  
union
select 'ldb.d_case_reported_type a143 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_case a11 
 join ldb.d_case a13 
 on (a11.case_key = a13.row_key) 
	join ldb.d_case_reported_type a143 
	on (a13.reported_type_src_key = a143.row_key)  
union
select 'ldb.d_customer_mdm a144 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_case a11 
 join ldb.d_customer a17 
 on (a11.customer_account_key = a17.row_key) 
	join ldb.d_customer_mdm a144 
	on (a17.row_current_key = a144.row_current_key)  
union
select 'ldb.d_calendar_time_hour a145 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_case a11 
 join ldb.d_calendar_time a18 
 on (a11.opened_time_key = a18.row_key) 
	join ldb.d_calendar_time_hour a145 
	on (a18.hour_24_format_num = a145.hour_24_format_num)  
union
select 'ldb.d_lov_case_first_severity_src_c a146 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_case a11 
 join ldb.d_case a13 
 on (a11.case_key = a13.row_key) 
	join ldb.d_lov_case_first_severity_src_c a146 
	on (a13.first_severity_src_c_key = a146.row_key)  
union
select 'ldb.d_lov_case_starting_ticket_priority_src_c a147 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_case a11 
 join ldb.d_case a13 
 on (a11.case_key = a13.row_key) 
	join ldb.d_lov_case_starting_ticket_priority_src_c a147 
	on (a13.starting_ticket_priority_src_c_key = a147.row_key)  
union
select 'ldb.d_lov_case_status_src_c a148 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_case a11 
 join ldb.d_case a13 
 on (a11.case_key = a13.row_key) 
	join ldb.d_lov_case_status_src_c a148 
	on (a13.status_src_c_key = a148.row_key)  
union
select 'ldb.d_calendar_quarter a149 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_case a11 
 join ldb.d_calendar_date a15 
 on (a11.opened_on_key = a15.row_key) 
	join ldb.d_calendar_quarter a149 
	on (a15.quarter_start_date_key = a149.row_key)  
union
select 'ldb.d_internal_contact_general_manager_c a150 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_case a11 
 join ldb.d_tribe_c a19 
 on (a11.tribe_c_key = a19.row_key)join ldb.d_segment_c a110 
 on (a19.segment_c_key = a110.row_key) 
	join ldb.d_internal_contact_general_manager_c a150 
	on (a110.general_manager_c_key = a150.row_key)  
union
select 'ldb.d_calendar_year a151 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_case a11 
 join ldb.d_calendar_date a15 
 on (a11.opened_on_key = a15.row_key) 
	join ldb.d_calendar_year a151 
	on (a15.year_start_date_key = a151.row_key)  

