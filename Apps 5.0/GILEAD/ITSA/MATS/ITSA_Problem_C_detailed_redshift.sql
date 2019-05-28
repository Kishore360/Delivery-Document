select 'ldb.f_problem a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_internal_contact a12 
 on (a11.opened_by_key = a12.row_key)  
union
select 'ldb.d_calendar_time a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_calendar_time a13 
 on (a11.opened_time_key = a13.row_key)  
union
select 'ldb.d_internal_contact_assigned_to a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_internal_contact_assigned_to a14 
 on (a11.assigned_to_key = a14.row_key)  
union
select 'ldb.d_internal_organization_group a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_internal_organization_group a15 
 on (a11.assignment_group_key = a15.row_key)  
union
select 'ldb.dh_user_group_hierarchy a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_internal_organization_group a15 
 on (a11.assignment_group_key = a15.row_key) 
 join ldb.dh_user_group_hierarchy a16 
 on (a15.row_dn_key = a16.lev_0_key)  
union
select 'ldb.d_business_service a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_business_service a17 
 on (a11.business_service_key = a17.row_key)  
union
select 'ldb.d_calendar_date a18 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_calendar_date a18 
 on (a11.opened_on_key = a18.row_key)  
union
select 'ldb.d_problem a19 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_problem a19 
 on (a11.problem_key = a19.row_key)  
union
select 'ldb.d_configuration_item a110 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_configuration_item a110 
 on (a11.configuration_item_key = a110.row_key)  
union
select 'ldb.d_change_request a111 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_change_request a111 
 on (a11.change_request_key = a111.row_key)  
union
select 'ldb.d_change_request_change_induced_problem_c a112 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_change_request_change_induced_problem_c a112 
 on (a11.change_induced_problem_c_key = a112.row_key)  
union
select 'ldb.d_configuration_item_confirmed_causing_ci_c a113 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_configuration_item_confirmed_causing_ci_c a113 
 on (a11.confirmed_causing_ci_c_key = a113.row_key)  
union
select 'ldb.d_internal_contact_created_by_c a114 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_internal_contact_created_by_c a114 
 on (a11.created_by_c_key = a114.row_key)  
union
select 'ldb.d_internal_conatct_cust_c a115 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_internal_conatct_cust_c a115 
 on (a11.cust_c_key = a115.row_key)  
union
select 'ldb.d_internal_organization_department a116 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_internal_contact a12 
 on (a11.opened_by_key = a12.row_key) 
 join ldb.d_internal_organization_department a116 
 on (a12.department_key = a116.row_key)  
union
select 'ldb.d_internal_contact_mdm a117 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_internal_contact a12 
 on (a11.opened_by_key = a12.row_key) 
 join ldb.d_internal_contact_mdm a117 
 on (a12.row_current_key = a117.row_current_key)  
union
select 'ldb.d_calendar_time_hour a118 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_calendar_time a13 
 on (a11.opened_time_key = a13.row_key) 
 join ldb.d_calendar_time_hour a118 
 on (a13.hour_24_format_num = a118.hour_24_format_num)  
union
select 'ldb.d_kb_knowledge_c a119 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_kb_knowledge_c a119 
 on (a11.known_error_c_key = a119.row_key)  
union
select 'ldb.d_location a120 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_location a120 
 on (a11.location_key = a120.row_key)  
union
select 'ldb.d_internal_contact_opened_by_c a121 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_internal_contact_opened_by_c a121 
 on (a11.opened_by_key = a121.row_key)  
union
select 'ldb.d_problem_reported_type a122 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_problem_reported_type a122 
 on (a11.reported_type_src_key = a122.row_key)  
union
select 'ldb.d_problem_impact a123 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_problem_impact a123 
 on (a11.impact_src_key = a123.row_key)  
union
select 'ldb.d_problem_priority a124 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_problem_priority a124 
 on (a11.priority_src_key = a124.row_key)  
union
select 'ldb.d_problem_urgency a125 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_problem_urgency a125 
 on (a11.urgency_src_key = a125.row_key)  
union
select 'ldb.d_internal_organization_problem_management_group_c a126 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_internal_organization_problem_management_group_c a126 
 on (a11.problem_management_group_c_key = a126.row_key)  
union
select 'ldb.d_internal_contact_problem_manager_c a127 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_internal_contact_problem_manager_c a127 
 on (a11.problem_manager_c_key = a127.row_key)  
union
select 'ldb.d_internal_contact_reported_by_c a128 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_internal_contact_reported_by_c a128 
 on (a11.reported_by_c_key = a128.row_key)  
union
select 'ldb.d_location_assigned_to a129 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_internal_contact_assigned_to a14 
 on (a11.assigned_to_key = a14.row_key) 
 join ldb.d_location_assigned_to a129 
 on (a14.location_key = a129.row_key)  
union
select 'ldb.dh_user_group_level1 a130 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_internal_organization_group a15 
 on (a11.assignment_group_key = a15.row_key)join ldb.dh_user_group_hierarchy a16 
 on (a15.row_dn_key = a16.lev_0_key) 
 join ldb.dh_user_group_level1 a130 
 on (a16.lev_1_key = a130.row_key)  
union
select 'ldb.d_business_service_criticality a131 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_business_service a17 
 on (a11.business_service_key = a17.row_key) 
 join ldb.d_business_service_criticality a131 
 on (a17.criticality_key = a131.row_key)  
union
select 'ldb.d_business_service_used_for a132 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_business_service a17 
 on (a11.business_service_key = a17.row_key) 
 join ldb.d_business_service_used_for a132 
 on (a17.used_for_src_key = a132.row_key)  
union
select 'ldb.d_calendar_month a133 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_calendar_date a18 
 on (a11.opened_on_key = a18.row_key) 
 join ldb.d_calendar_month a133 
 on (a18.month_start_date_key = a133.row_key)  
union
select 'ldb.d_calendar_week a134 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_calendar_date a18 
 on (a11.opened_on_key = a18.row_key) 
 join ldb.d_calendar_week a134 
 on (a18.week_start_date_key = a134.row_key)  
union
select 'ldb.d_lov_problem_closure_code_c a135 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_problem a19 
 on (a11.problem_key = a19.row_key) 
 join ldb.d_lov_problem_closure_code_c a135 
 on (a19.closure_code_src_c_key = a135.row_key)  
union
select 'ldb.d_lov_problem_deferred_reason_c a136 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_problem a19 
 on (a11.problem_key = a19.row_key) 
 join ldb.d_lov_problem_deferred_reason_c a136 
 on (a19.deferred_reason_src_c_key = a136.row_key)  
union
select 'ldb.d_lov_problem_deviation_identified_c a137 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_problem a19 
 on (a11.problem_key = a19.row_key) 
 join ldb.d_lov_problem_deviation_identified_c a137 
 on (a19.deviation_identified_src_c_key = a137.row_key)  
union
select 'ldb.d_lov_problem_caused_by_vendor_c a138 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_problem a19 
 on (a11.problem_key = a19.row_key) 
 join ldb.d_lov_problem_caused_by_vendor_c a138 
 on (a19.caused_by_vendor_src_c_key = a138.row_key)  
union
select 'ldb.d_internal_organization_vendor_c a139 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_internal_organization_group a15 
 on (a11.assignment_group_key = a15.row_key) 
 join ldb.d_internal_organization_vendor_c a139 
 on (a15.vendor_c_key = a139.row_key)  
union
select 'ldb.d_lov_problem_permanent_fix_c a140 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_problem a19 
 on (a11.problem_key = a19.row_key) 
 join ldb.d_lov_problem_permanent_fix_c a140 
 on (a19.permanent_fix_src_c_key = a140.row_key)  
union
select 'ldb.d_lov_problem_sparc_stage_src_c a141 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_problem a19 
 on (a11.problem_key = a19.row_key) 
 join ldb.d_lov_problem_sparc_stage_src_c a141 
 on (a19.problem_sparc_stage_src_c_key = a141.row_key)  
union
select 'ldb.d_problem_state a142 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_problem a19 
 on (a11.problem_key = a19.row_key) 
 join ldb.d_problem_state a142 
 on (a19.state_src_key = a142.row_key)  
union
select 'ldb.d_lov_problem_type_c a143 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_problem a19 
 on (a11.problem_key = a19.row_key) 
 join ldb.d_lov_problem_type_c a143 
 on (a19.type_src_c_key = a143.row_key)  
union
select 'ldb.d_lov_problem_rca_priority_c a144 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_problem a19 
 on (a11.problem_key = a19.row_key) 
 join ldb.d_lov_problem_rca_priority_c a144 
 on (a19.rca_priority_src_c_key = a144.row_key)  
union
select 'ldb.d_lov_problem_root_cause_area_c a145 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_problem a19 
 on (a11.problem_key = a19.row_key) 
 join ldb.d_lov_problem_root_cause_area_c a145 
 on (a19.root_cause_area_src_c_key = a145.row_key)  
union
select 'ldb.d_lov_problem_root_cause_category_c a146 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_problem a19 
 on (a11.problem_key = a19.row_key) 
 join ldb.d_lov_problem_root_cause_category_c a146 
 on (a19.root_cause_category_src_c_key = a146.row_key)  
union
select 'ldb.d_lov_problem_root_cause_sub_category_c a147 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_problem a19 
 on (a11.problem_key = a19.row_key) 
 join ldb.d_lov_problem_root_cause_sub_category_c a147 
 on (a19.root_cause_sub_category_src_c_key = a147.row_key)  
union
select 'ldb.dh_user_group_level2 a148 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_internal_organization_group a15 
 on (a11.assignment_group_key = a15.row_key)join ldb.dh_user_group_hierarchy a16 
 on (a15.row_dn_key = a16.lev_0_key) 
 join ldb.dh_user_group_level2 a148 
 on (a16.lev_2_key = a148.row_key)  
union
select 'ldb.d_calendar_quarter a149 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_calendar_date a18 
 on (a11.opened_on_key = a18.row_key) 
 join ldb.d_calendar_quarter a149 
 on (a18.quarter_start_date_key = a149.row_key)  
union
select 'ldb.dh_user_group_level3 a150 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_internal_organization_group a15 
 on (a11.assignment_group_key = a15.row_key)join ldb.dh_user_group_hierarchy a16 
 on (a15.row_dn_key = a16.lev_0_key) 
 join ldb.dh_user_group_level3 a150 
 on (a16.lev_3_key = a150.row_key)  
union
select 'ldb.d_calendar_year a151 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_calendar_date a18 
 on (a11.opened_on_key = a18.row_key) 
 join ldb.d_calendar_year a151 
 on (a18.year_start_date_key = a151.row_key)  
union
select 'ldb.dh_user_group_level4 a152 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_internal_organization_group a15 
 on (a11.assignment_group_key = a15.row_key)join ldb.dh_user_group_hierarchy a16 
 on (a15.row_dn_key = a16.lev_0_key) 
 join ldb.dh_user_group_level4 a152 
 on (a16.lev_4_key = a152.row_key)  

