select 'ldb.f_incident_resolved a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 union
select 'ldb.d_internal_organization_group a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_internal_organization_group a12 
	on (a11.assignment_group_key = a12.row_key)  
 union
select 'ldb.d_internal_contact_assigned_to a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_internal_contact_assigned_to a13 
	on (a11.assigned_to_key = a13.row_key)  
 union
select 'ldb.d_incident a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_incident a14 
	on (a11.incident_key = a14.row_key)  
 union
select 'ldb.d_business_service a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_business_service a15 
	on (a11.business_service_key = a15.row_key)  
 union
select 'ldb.d_calendar_date a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_calendar_date a16 
	on (a11.date_key = a16.row_key)  
 union
select 'ldb.d_calendar_month a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_calendar_date a16 
 on (a11.date_key = a16.row_key) 
	join ldb.d_calendar_month a17 
	on (a16.month_start_date_key = a17.row_key)  
 union
select 'ldb.d_calendar_quarter a18 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_calendar_date a16 
 on (a11.date_key = a16.row_key) join ldb.d_calendar_month a17 
 on (a16.month_start_date_key = a17.row_key) 
	join ldb.d_calendar_quarter a18 
	on (a17.quarter_start_date_key = a18.row_key)  
 union
select 'ldb.d_change_request_caused_by a19 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_change_request_caused_by a19 
	on (a11.caused_by_change_key = a19.row_key)  
 union
select 'ldb.d_change_request a110 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_change_request a110 
	on (a11.change_request_key = a110.row_key)  
 union
select 'ldb.d_configuration_item a111 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_configuration_item a111 
	on (a11.configuration_item_key = a111.row_key)  
 union
select 'ldb.d_configuration_item_mdm a112 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_configuration_item a111 
 on (a11.configuration_item_key = a111.row_key) 
	join ldb.d_configuration_item_mdm a112 
	on (a111.mdm_key = a112.row_key)  
 union
select 'ldb.d_internal_contact a113 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_internal_contact a113 
	on (a11.employee_key = a113.row_key)  
 union
select 'ldb.d_calendar_date_fiscal a114 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_calendar_date_fiscal a114 
	on (a11.fiscal_date_key = a114.row_key)  
 union
select 'ldb.d_calendar_time a115 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_calendar_time a115 
	on (a11.time_key = a115.row_key)  
 union
select 'ldb.d_internal_contact_incident_opened_for_c a116 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_incident a14 
 on (a11.incident_key = a14.row_key) 
	join ldb.d_internal_contact_incident_opened_for_c a116 
	on (a14.opened_for_key = a116.row_key)  
 union
select 'ldb.d_parent_incident a117 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_incident a14 
 on (a11.incident_key = a14.row_key) 
	join ldb.d_parent_incident a117 
	on (a14.parent_incident_key = a117.row_key)  
 union
select 'ldb.d_problem a118 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_problem a118 
	on (a11.problem_key = a118.row_key)  
 union
select 'ldb.d_location a119 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_location a119 
	on (a11.location_key = a119.row_key)  
 union
select 'ldb.d_incident_ext_c a120 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_incident a14 
 on (a11.incident_key = a14.row_key) 
	join ldb.d_incident_ext_c a120 
	on (a14.incident_ext_c_key = a120.row_key)  
 union
select 'ldb.d_ag_manager_role_vp_dir_ad_c a121 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_ag_manager_role_vp_dir_ad_c a121 
	on (a11.inc_assignment_group_key = a121.row_key)  
 union
select 'ldb.d_internal_contact_associate_director_c a122 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_ag_manager_role_vp_dir_ad_c a121 
 on (a11.inc_assignment_group_key = a121.row_key) 
	join ldb.d_internal_contact_associate_director_c a122 
	on (a121.associate_director_key = a122.row_key)  
 union
select 'ldb.d_internal_contact_vp_c a123 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_ag_manager_role_vp_dir_ad_c a121 
 on (a11.inc_assignment_group_key = a121.row_key) 
	join ldb.d_internal_contact_vp_c a123 
	on (a121.vp_key = a123.row_key)  
 union
select 'ldb.d_business_service_parent_c a124 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_business_service a15 
 on (a11.business_service_key = a15.row_key) 
	join ldb.d_business_service_parent_c a124 
	on (a15.parent_business_service_c_key = a124.row_key)  
 union
select 'ldb.d_internal_contact_director_c a125 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_ag_manager_role_vp_dir_ad_c a121 
 on (a11.inc_assignment_group_key = a121.row_key) 
	join ldb.d_internal_contact_director_c a125 
	on (a121.director_key = a125.row_key)  
 union
select 'ldb.d_application_incident_ci_app_c a126 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_application_incident_ci_app_c a126 
	on (a11.application_c_key = a126.row_key)  
 union
select 'ldb.d_incident_contacttype a127 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_incident_contacttype a127 
	on (a11.reported_type_src_key = a127.row_key)  
 union
select 'ldb.d_incident_impact a128 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_incident_impact a128 
	on (a11.impact_src_key = a128.row_key)  
 union
select 'ldb.d_incident_urgency a129 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_incident_urgency a129 
	on (a11.urgency_src_key = a129.row_key)  
 union
select 'ldb.d_configuration_item_incident_service_offering_c a130 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_configuration_item_incident_service_offering_c a130 
	on (a11.service_offering_c_key = a130.row_key)  
 union
select 'ldb.d_business_service_criticality a131 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_business_service a15 
 on (a11.business_service_key = a15.row_key) 
	join ldb.d_business_service_criticality a131 
	on (a15.criticality_key = a131.row_key)  
 union
select 'ldb.d_calendar_week a132 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_calendar_date a16 
 on (a11.date_key = a16.row_key) 
	join ldb.d_calendar_week a132 
	on (a16.week_start_date_key = a132.row_key)  
 union
select 'ldb.d_internal_organization_department a133 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_internal_contact a113 
 on (a11.employee_key = a113.row_key) 
	join ldb.d_internal_organization_department a133 
	on (a113.department_key = a133.row_key)  
 union
select 'ldb.d_calendar_fiscal_quarter a134 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_calendar_date_fiscal a114 
 on (a11.fiscal_date_key = a114.row_key) 
	join ldb.d_calendar_fiscal_quarter a134 
	on (a114.quarter_start_date_key = a134.row_key)  
 union
select 'ldb.d_calendar_time_hour a135 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_calendar_time a115 
 on (a11.time_key = a115.row_key) 
	join ldb.d_calendar_time_hour a135 
	on (a115.hour_key = a135.row_key)  
 union
select 'ldb.d_lov_incident_service_type_c a136 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_incident a14 
 on (a11.incident_key = a14.row_key) 
	join ldb.d_lov_incident_service_type_c a136 
	on (a14.service_type_src_c_key = a136.row_key)  
 union
select 'ldb.d_incident_category a137 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_incident a14 
 on (a11.incident_key = a14.row_key) 
	join ldb.d_incident_category a137 
	on (a14.category_src_key = a137.row_key)  
 union
select 'ldb.d_incident_close_code a138 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_incident a14 
 on (a11.incident_key = a14.row_key) 
	join ldb.d_incident_close_code a138 
	on (a14.close_code_src_key = a138.row_key)  
 union
select 'ldb.d_lov_incident_initial_priority_c a139 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_incident a14 
 on (a11.incident_key = a14.row_key) 
	join ldb.d_lov_incident_initial_priority_c a139 
	on (a14.incident_initial_priority_c_key = a139.row_key)  
 union
select 'ldb.d_incident_opened_by a140 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_incident a14 
 on (a11.incident_key = a14.row_key) 
	join ldb.d_incident_opened_by a140 
	on (a14.opened_by_key = a140.row_key)  
 union
select 'ldb.d_incident_priority a141 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_incident a14 
 on (a11.incident_key = a14.row_key) 
	join ldb.d_incident_priority a141 
	on (a14.priority_src_key = a141.row_key)  
 union
select 'ldb.d_incident_severity a142 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_incident a14 
 on (a11.incident_key = a14.row_key) 
	join ldb.d_incident_severity a142 
	on (a14.severity_src_key = a142.row_key)  
 union
select 'ldb.d_incident_state a143 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_incident a14 
 on (a11.incident_key = a14.row_key) 
	join ldb.d_incident_state a143 
	on (a14.state_src_key = a143.row_key)  
 union
select 'ldb.d_incident_subcategory a144 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_incident a14 
 on (a11.incident_key = a14.row_key) 
	join ldb.d_incident_subcategory a144 
	on (a14.sub_category_src_key = a144.row_key)  
 union
select 'ldb.d_lov_incident_incident_type_c a145 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_incident a14 
 on (a11.incident_key = a14.row_key) 
	join ldb.d_lov_incident_incident_type_c a145 
	on (a14.incident_type_src_c_key = a145.row_key)  
 union
select 'ldb.d_incident_unit_of_measure_c a146 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_incident a14 
 on (a11.incident_key = a14.row_key) 
	join ldb.d_incident_unit_of_measure_c a146 
	on (a14.incident_unit_of_measure_c_key = a146.row_key)  
 union
select 'ldb.d_lov_incremental_cost_c a147 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_incident a14 
 on (a11.incident_key = a14.row_key) 
	join ldb.d_lov_incremental_cost_c a147 
	on (a14.incremental_cost_src_c_key = a147.row_key)  
 union
select 'ldb.d_lov_incident_why_not_cwt_c a148 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_incident a14 
 on (a11.incident_key = a14.row_key) 
	join ldb.d_lov_incident_why_not_cwt_c a148 
	on (a14.why_now_cwt_src_c_key = a148.row_key)  
 union
select 'ldb.d_configuration_item_criticality_c a149 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_configuration_item a111 
 on (a11.configuration_item_key = a111.row_key) 
	join ldb.d_configuration_item_criticality_c a149 
	on (a111.business_critical_c_key = a149.row_key)  
 union
select 'ldb.d_calendar_fiscal_year a150 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_calendar_date_fiscal a114 
 on (a11.fiscal_date_key = a114.row_key) 
	join ldb.d_calendar_fiscal_year a150 
	on (a114.year_start_date_key = a150.row_key)  
 union
select 'ldb.d_business_service_grand_parent_c a151 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_business_service a15 
 on (a11.business_service_key = a15.row_key) join ldb.d_business_service_parent_c a124 
 on (a15.parent_business_service_c_key = a124.row_key) 
	join ldb.d_business_service_grand_parent_c a151 
	on (a124.parent_business_service_c_key = a151.row_key)  
 union
select 'ldb.d_calendar_year a152 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_calendar_date a16 
 on (a11.date_key = a16.row_key) join ldb.d_calendar_month a17 
 on (a16.month_start_date_key = a17.row_key) join ldb.d_calendar_quarter a18 
 on (a17.quarter_start_date_key = a18.row_key) 
	join ldb.d_calendar_year a152 
	on (a18.year_start_date_key = a152.row_key)  

