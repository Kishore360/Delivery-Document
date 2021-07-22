select 'ldb.f_problem a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_internal_contact a12 
	on (a11.employee_key = a12.row_key)  
 union
select 'ldb.d_problem_priority a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_problem_priority a13 
	on (a11.priority_src_key = a13.row_key)  
 union
select 'ldb.d_calendar_date_fiscal a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_calendar_date_fiscal a14 
	on (a11.fiscal_date_key = a14.row_key)  
 union
select 'ldb.d_calendar_time a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_calendar_time a15 
	on (a11.time_key = a15.row_key)  
 union
select 'ldb.d_ag_manager_role_vp_dir_ad_c a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_ag_manager_role_vp_dir_ad_c a16 
	on (a11.problem_assignment_group_key = a16.row_key)  
 union
select 'ldb.d_internal_organization_group a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_internal_organization_group a17 
	on (a11.assignment_group_key = a17.row_key)  
 union
select 'ldb.d_internal_contact_assigned_to a18 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_internal_contact_assigned_to a18 
	on (a11.assigned_to_key = a18.row_key)  
 union
select 'ldb.d_business_service a19 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_business_service a19 
	on (a11.business_service_key = a19.row_key)  
 union
select 'ldb.d_problem a110 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_problem a110 
	on (a11.problem_key = a110.row_key)  
 union
select 'ldb.d_calendar_date a111 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_calendar_date a111 
	on (a11.date_key = a111.row_key)  
 union
select 'ldb.d_calendar_month a112 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_calendar_date a111 
 on (a11.date_key = a111.row_key) 
	join ldb.d_calendar_month a112 
	on (a111.month_start_date_key = a112.row_key)  
 union
select 'ldb.d_calendar_quarter a113 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_calendar_date a111 
 on (a11.date_key = a111.row_key) join ldb.d_calendar_month a112 
 on (a111.month_start_date_key = a112.row_key) 
	join ldb.d_calendar_quarter a113 
	on (a112.quarter_start_date_key = a113.row_key)  
 union
select 'ldb.d_change_request a114 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_change_request a114 
	on (a11.change_request_key = a114.row_key)  
 union
select 'ldb.d_configuration_item a115 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_configuration_item a115 
	on (a11.configuration_item_key = a115.row_key)  
 union
select 'ldb.d_configuration_item_mdm a116 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_configuration_item a115 
 on (a11.configuration_item_key = a115.row_key) 
	join ldb.d_configuration_item_mdm a116 
	on (a115.mdm_key = a116.row_key)  
 union
select 'ldb.d_calendar_week a117 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_calendar_date a111 
 on (a11.date_key = a111.row_key) 
	join ldb.d_calendar_week a117 
	on (a111.week_start_date_key = a117.row_key)  
 union
select 'ldb.d_calendar_year a118 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_calendar_date a111 
 on (a11.date_key = a111.row_key) join ldb.d_calendar_month a112 
 on (a111.month_start_date_key = a112.row_key) join ldb.d_calendar_quarter a113 
 on (a112.quarter_start_date_key = a113.row_key) 
	join ldb.d_calendar_year a118 
	on (a113.year_start_date_key = a118.row_key)  
 union
select 'ldb.d_location a119 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_location a119 
	on (a11.location_key = a119.row_key)  
 union
select 'ldb.d_business_service_parent_c a120 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_business_service a19 
 on (a11.business_service_key = a19.row_key) 
	join ldb.d_business_service_parent_c a120 
	on (a19.parent_business_service_c_key = a120.row_key)  
 union
select 'ldb.d_internal_contact_director_c a121 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_ag_manager_role_vp_dir_ad_c a16 
 on (a11.problem_assignment_group_key = a16.row_key) 
	join ldb.d_internal_contact_director_c a121 
	on (a16.director_key = a121.row_key)  
 union
select 'ldb.d_calendar_fiscal_quarter a122 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_calendar_date_fiscal a14 
 on (a11.fiscal_date_key = a14.row_key) 
	join ldb.d_calendar_fiscal_quarter a122 
	on (a14.quarter_start_date_key = a122.row_key)  
 union
select 'ldb.d_calendar_time_hour a123 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_calendar_time a15 
 on (a11.time_key = a15.row_key) 
	join ldb.d_calendar_time_hour a123 
	on (a15.hour_key = a123.row_key)  
 union
select 'ldb.d_internal_contact_pg_opened_for_c a124 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_internal_contact_pg_opened_for_c a124 
	on (a11.pg_opened_for_c_key = a124.row_key)  
 union
select 'ldb.d_lov_problem_category_c a125 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_lov_problem_category_c a125 
	on (a11.category_src_key = a125.row_key)  
 union
select 'ldb.d_problem_reported_type a126 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_problem_reported_type a126 
	on (a11.reported_type_src_key = a126.row_key)  
 union
select 'ldb.d_problem_impact a127 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_problem_impact a127 
	on (a11.impact_src_key = a127.row_key)  
 union
select 'ldb.d_configuration_item_problem_service_offering_c a128 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_configuration_item_problem_service_offering_c a128 
	on (a11.service_offering_c_key = a128.row_key)  
 union
select 'ldb.d_problem_urgency a129 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_problem_urgency a129 
	on (a11.urgency_src_key = a129.row_key)  
 union
select 'ldb.d_internal_contact_pg_root_cause_analyst_c a130 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_internal_contact_pg_root_cause_analyst_c a130 
	on (a11.pg_root_cause_analyst_c_key = a130.row_key)  
 union
select 'ldb.d_internal_contact_pf_sfa_owner_c a131 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_internal_contact_pf_sfa_owner_c a131 
	on (a11.pf_sfa_owner_c_key = a131.row_key)  
 union
select 'ldb.d_internal_contact_associate_director_c a132 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_ag_manager_role_vp_dir_ad_c a16 
 on (a11.problem_assignment_group_key = a16.row_key) 
	join ldb.d_internal_contact_associate_director_c a132 
	on (a16.associate_director_key = a132.row_key)  
 union
select 'ldb.d_internal_contact_vp_c a133 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_ag_manager_role_vp_dir_ad_c a16 
 on (a11.problem_assignment_group_key = a16.row_key) 
	join ldb.d_internal_contact_vp_c a133 
	on (a16.vp_key = a133.row_key)  
 union
select 'ldb.d_location_assigned_to a134 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_internal_contact_assigned_to a18 
 on (a11.assigned_to_key = a18.row_key) 
	join ldb.d_location_assigned_to a134 
	on (a18.location_key = a134.row_key)  
 union
select 'ldb.d_business_service_criticality a135 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_business_service a19 
 on (a11.business_service_key = a19.row_key) 
	join ldb.d_business_service_criticality a135 
	on (a19.criticality_key = a135.row_key)  
 union
select 'ldb.d_business_service_used_for a136 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_business_service a19 
 on (a11.business_service_key = a19.row_key) 
	join ldb.d_business_service_used_for a136 
	on (a19.used_for_src_key = a136.row_key)  
 union
select 'ldb.d_internal_organization_department a137 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_internal_contact a12 
 on (a11.employee_key = a12.row_key) 
	join ldb.d_internal_organization_department a137 
	on (a12.department_key = a137.row_key)  
 union
select 'ldb.d_internal_contact_mdm a138 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_internal_contact a12 
 on (a11.employee_key = a12.row_key) 
	join ldb.d_internal_contact_mdm a138 
	on (a12.employee_mdm_key = a138.row_key)  
 union
select 'ldb.d_calendar_fiscal_year a139 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_calendar_date_fiscal a14 
 on (a11.fiscal_date_key = a14.row_key) 
	join ldb.d_calendar_fiscal_year a139 
	on (a14.year_start_date_key = a139.row_key)  
 union
select 'ldb.d_lov_pg_other_impact_c a140 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_problem a110 
 on (a11.problem_key = a110.row_key) 
	join ldb.d_lov_pg_other_impact_c a140 
	on (a110.pg_other_impact_src_c_key = a140.row_key)  
 union
select 'ldb.d_lov_pg_problem_identification_c a141 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_problem a110 
 on (a11.problem_key = a110.row_key) 
	join ldb.d_lov_pg_problem_identification_c a141 
	on (a110.pg_problem_identification_src_c_key = a141.row_key)  
 union
select 'ldb.d_lov_problem_root_cause_code_c a142 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_problem a110 
 on (a11.problem_key = a110.row_key) 
	join ldb.d_lov_problem_root_cause_code_c a142 
	on (a110.root_cause_code_src_c_key = a142.row_key)  
 union
select 'ldb.d_problem_state a143 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_problem a110 
 on (a11.problem_key = a110.row_key) 
	join ldb.d_problem_state a143 
	on (a110.state_src_key = a143.row_key)  
 union
select 'ldb.d_lov_problem_rca_status_c a144 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_problem a110 
 on (a11.problem_key = a110.row_key) 
	join ldb.d_lov_problem_rca_status_c a144 
	on (a110.rca_status_c_key = a144.row_key)  
 union
select 'ldb.d_lov_problem_root_cause_sub_code_c a145 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_problem a110 
 on (a11.problem_key = a110.row_key) 
	join ldb.d_lov_problem_root_cause_sub_code_c a145 
	on (a110.root_cause_sub_code_src_c_key = a145.row_key)  
 union
select 'ldb.d_lov_problem_sfa_status_c a146 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_problem a110 
 on (a11.problem_key = a110.row_key) 
	join ldb.d_lov_problem_sfa_status_c a146 
	on (a110.sfa_status_c_key = a146.row_key)  
 union
select 'ldb.d_lov_problem_sufficient_impact_to_proceed_c a147 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_problem a110 
 on (a11.problem_key = a110.row_key) 
	join ldb.d_lov_problem_sufficient_impact_to_proceed_c a147 
	on (a110.sufficient_impact_to_proceed_c_key = a147.row_key)  
 union
select 'ldb.d_configuration_item_criticality_c a148 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_configuration_item a115 
 on (a11.configuration_item_key = a115.row_key) 
	join ldb.d_configuration_item_criticality_c a148 
	on (a115.business_critical_c_key = a148.row_key)  
 union
select 'ldb.d_business_service_grand_parent_c a149 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_business_service a19 
 on (a11.business_service_key = a19.row_key) join ldb.d_business_service_parent_c a120 
 on (a19.parent_business_service_c_key = a120.row_key) 
	join ldb.d_business_service_grand_parent_c a149 
	on (a120.parent_business_service_c_key = a149.row_key)  

