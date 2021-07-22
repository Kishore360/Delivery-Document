select 'ldb.f_request_item_closed a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item_closed a11 
 union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item_closed a11 
 join ldb.d_calendar_date a12 
	on (a11.date_key = a12.row_key)  
 union
select 'ldb.d_configuration_item a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item_closed a11 
 join ldb.d_configuration_item a13 
	on (a11.configuration_item_key = a13.row_key)  
 union
select 'ldb.d_internal_contact a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item_closed a11 
 join ldb.d_internal_contact a14 
	on (a11.employee_key = a14.row_key)  
 union
select 'ldb.d_ag_manager_role_vp_dir_ad_c a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item_closed a11 
 join ldb.d_ag_manager_role_vp_dir_ad_c a15 
	on (a11.ritm_assignment_group_key = a15.row_key)  
 union
select 'ldb.d_internal_organization_group a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item_closed a11 
 join ldb.d_internal_organization_group a16 
	on (a11.assignment_group_key = a16.row_key)  
 union
select 'ldb.d_calendar_month a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item_closed a11 
 join ldb.d_calendar_date a12 
 on (a11.date_key = a12.row_key) 
	join ldb.d_calendar_month a17 
	on (a12.month_start_date_key = a17.row_key)  
 union
select 'ldb.d_calendar_quarter a18 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item_closed a11 
 join ldb.d_calendar_date a12 
 on (a11.date_key = a12.row_key) join ldb.d_calendar_month a17 
 on (a12.month_start_date_key = a17.row_key) 
	join ldb.d_calendar_quarter a18 
	on (a17.quarter_start_date_key = a18.row_key)  
 union
select 'ldb.d_request_item a19 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item_closed a11 
 join ldb.d_request_item a19 
	on (a11.request_item_key = a19.row_key)  
 union
select 'ldb.d_calendar_date_fiscal a110 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item_closed a11 
 join ldb.d_calendar_date_fiscal a110 
	on (a11.fiscal_date_key = a110.row_key)  
 union
select 'ldb.d_sc_req_item_priority a111 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item_closed a11 
 join ldb.d_sc_req_item_priority a111 
	on (a11.priority_src_key = a111.row_key)  
 union
select 'ldb.d_req_item_opened_by a112 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item_closed a11 
 join ldb.d_request_item a19 
 on (a11.request_item_key = a19.row_key) 
	join ldb.d_req_item_opened_by a112 
	on (a19.opened_by_key = a112.row_key)  
 union
select 'ldb.d_request_item_requested_for a113 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item_closed a11 
 join ldb.d_request_item a19 
 on (a11.request_item_key = a19.row_key) 
	join ldb.d_request_item_requested_for a113 
	on (a19.requested_for_key = a113.row_key)  
 union
select 'ldb.d_request a114 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item_closed a11 
 join ldb.d_request a114 
	on (a11.request_key = a114.row_key)  
 union
select 'ldb.d_internal_contact_associate_director_c a115 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item_closed a11 
 join ldb.d_ag_manager_role_vp_dir_ad_c a15 
 on (a11.ritm_assignment_group_key = a15.row_key) 
	join ldb.d_internal_contact_associate_director_c a115 
	on (a15.associate_director_key = a115.row_key)  
 union
select 'ldb.d_internal_contact_vp_c a116 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item_closed a11 
 join ldb.d_ag_manager_role_vp_dir_ad_c a15 
 on (a11.ritm_assignment_group_key = a15.row_key) 
	join ldb.d_internal_contact_vp_c a116 
	on (a15.vp_key = a116.row_key)  
 union
select 'ldb.d_internal_contact_director_c a117 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item_closed a11 
 join ldb.d_ag_manager_role_vp_dir_ad_c a15 
 on (a11.ritm_assignment_group_key = a15.row_key) 
	join ldb.d_internal_contact_director_c a117 
	on (a15.director_key = a117.row_key)  
 union
select 'ldb.d_internal_contact_assigned_to a118 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item_closed a11 
 join ldb.d_internal_contact_assigned_to a118 
	on (a11.assigned_to_key = a118.row_key)  
 union
select 'ldb.d_business_service a119 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item_closed a11 
 join ldb.d_business_service a119 
	on (a11.business_service_key = a119.row_key)  
 union
select 'ldb.d_calendar_week a120 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item_closed a11 
 join ldb.d_calendar_date a12 
 on (a11.date_key = a12.row_key) 
	join ldb.d_calendar_week a120 
	on (a12.week_start_date_key = a120.row_key)  
 union
select 'ldb.d_configuration_item_mdm a121 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item_closed a11 
 join ldb.d_configuration_item a13 
 on (a11.configuration_item_key = a13.row_key) 
	join ldb.d_configuration_item_mdm a121 
	on (a13.mdm_key = a121.row_key)  
 union
select 'ldb.d_internal_contact_mdm a122 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item_closed a11 
 join ldb.d_internal_contact a14 
 on (a11.employee_key = a14.row_key) 
	join ldb.d_internal_contact_mdm a122 
	on (a14.employee_mdm_key = a122.row_key)  
 union
select 'ldb.d_master_item a123 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item_closed a11 
 join ldb.d_master_item a123 
	on (a11.catalog_item_key = a123.row_key)  
 union
select 'ldb.d_sc_req_item_approval a124 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item_closed a11 
 join ldb.d_sc_req_item_approval a124 
	on (a11.approval_state_src_key = a124.row_key)  
 union
select 'ldb.d_request_item_contacttype a125 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item_closed a11 
 join ldb.d_request_item_contacttype a125 
	on (a11.reported_type_src_key = a125.row_key)  
 union
select 'ldb.d_request_item_state a126 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item_closed a11 
 join ldb.d_request_item_state a126 
	on (a11.state_src_key = a126.row_key)  
 union
select 'ldb.d_internal_contact_requested_for a127 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item_closed a11 
 join ldb.d_internal_contact_requested_for a127 
	on (a11.requested_for_key = a127.row_key)  
 union
select 'ldb.d_ri_service_offering_c a128 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item_closed a11 
 join ldb.d_ri_service_offering_c a128 
	on (a11.service_offering_key = a128.row_key)  
 union
select 'ldb.d_calendar_fiscal_quarter a129 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item_closed a11 
 join ldb.d_calendar_date_fiscal a110 
 on (a11.fiscal_date_key = a110.row_key) 
	join ldb.d_calendar_fiscal_quarter a129 
	on (a110.quarter_start_date_key = a129.row_key)  
 union
select 'ldb.d_internal_contact_assignment_group_delegate_c a130 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item_closed a11 
 join ldb.d_internal_organization_group a16 
 on (a11.assignment_group_key = a16.row_key) 
	join ldb.d_internal_contact_assignment_group_delegate_c a130 
	on (a16.pg_delegate_c_key = a130.row_key)  
 union
select 'ldb.d_lov_ritm_cwt_c a131 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item_closed a11 
 join ldb.d_request_item a19 
 on (a11.request_item_key = a19.row_key) 
	join ldb.d_lov_ritm_cwt_c a131 
	on (a19.ritm_itsm_cwt_c_key = a131.row_key)  
 union
select 'ldb.d_lov_ritm_category_c a132 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item_closed a11 
 join ldb.d_request_item a19 
 on (a11.request_item_key = a19.row_key) 
	join ldb.d_lov_ritm_category_c a132 
	on (a19.ritm_category_c_key = a132.row_key)  
 union
select 'ldb.d_lov_ritm_closure_code_c a133 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item_closed a11 
 join ldb.d_request_item a19 
 on (a11.request_item_key = a19.row_key) 
	join ldb.d_lov_ritm_closure_code_c a133 
	on (a19.ritm_itsm_closure_code_c_key = a133.row_key)  
 union
select 'ldb.d_lov_ritm_servicetype_c a134 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item_closed a11 
 join ldb.d_request_item a19 
 on (a11.request_item_key = a19.row_key) 
	join ldb.d_lov_ritm_servicetype_c a134 
	on (a19.ritm_service_type_c_key = a134.row_key)  
 union
select 'ldb.d_lov_ritm_subcategory_c a135 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item_closed a11 
 join ldb.d_request_item a19 
 on (a11.request_item_key = a19.row_key) 
	join ldb.d_lov_ritm_subcategory_c a135 
	on (a19.ritm_sub_category_c_key = a135.row_key)  
 union
select 'ldb.d_lov_ritm_requesttype_c a136 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item_closed a11 
 join ldb.d_request_item a19 
 on (a11.request_item_key = a19.row_key) 
	join ldb.d_lov_ritm_requesttype_c a136 
	on (a19.ritm_request_type_c_key = a136.row_key)  
 union
select 'ldb.d_lov_request_item_component_c a137 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item_closed a11 
 join ldb.d_request_item a19 
 on (a11.request_item_key = a19.row_key) 
	join ldb.d_lov_request_item_component_c a137 
	on (a19.request_item_component_c_key = a137.row_key)  
 union
select 'ldb.d_req_item_req_for_loc a138 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item_closed a11 
 join ldb.d_request_item a19 
 on (a11.request_item_key = a19.row_key) join ldb.d_request_item_requested_for a113 
 on (a19.requested_for_key = a113.row_key) 
	join ldb.d_req_item_req_for_loc a138 
	on (a113.location_key = a138.row_key)  
 union
select 'ldb.d_calendar_year a139 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item_closed a11 
 join ldb.d_calendar_date a12 
 on (a11.date_key = a12.row_key) join ldb.d_calendar_month a17 
 on (a12.month_start_date_key = a17.row_key) join ldb.d_calendar_quarter a18 
 on (a17.quarter_start_date_key = a18.row_key) 
	join ldb.d_calendar_year a139 
	on (a18.year_start_date_key = a139.row_key)  
 union
select 'ldb.d_calendar_fiscal_year a140 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item_closed a11 
 join ldb.d_calendar_date_fiscal a110 
 on (a11.fiscal_date_key = a110.row_key) 
	join ldb.d_calendar_fiscal_year a140 
	on (a110.year_start_date_key = a140.row_key)  
 union
select 'ldb.d_req_item_open_by_loc a141 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item_closed a11 
 join ldb.d_request_item a19 
 on (a11.request_item_key = a19.row_key) join ldb.d_req_item_opened_by a112 
 on (a19.opened_by_key = a112.row_key) 
	join ldb.d_req_item_open_by_loc a141 
	on (a112.location_key = a141.row_key)  

