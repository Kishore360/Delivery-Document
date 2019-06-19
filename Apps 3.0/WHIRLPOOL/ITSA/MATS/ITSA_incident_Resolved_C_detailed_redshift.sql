select 'ldb.f_incident_resolved a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
union
select 'ldb.d_customer a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_customer a12 
	on (a11.customer_key = a12.row_key)  
union
select 'ldb.d_internal_contact a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_internal_contact a13 
	on (a11.last_resolved_by_key = a13.row_key)  
union
select 'ldb.d_calendar_time a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_calendar_time a14 
	on (a11.opened_time_key = a14.row_key)  
union
select 'ldb.d_internal_organization_group a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_internal_organization_group a15 
	on (a11.assignment_group_key = a15.row_key)  
union
select 'ldb.d_internal_contact_queue_manager_c a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_internal_organization_group a15 
 on (a11.assignment_group_key = a15.row_key) 
	join ldb.d_internal_contact_queue_manager_c a16 
	on (a15.queue_manager_c_key = a16.row_key)  
union
select 'ldb.dh_queue_manager_hierarchy_c a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_internal_organization_group a15 
 on (a11.assignment_group_key = a15.row_key)join ldb.d_internal_contact_queue_manager_c a16 
 on (a15.queue_manager_c_key = a16.row_key) 
	join ldb.dh_queue_manager_hierarchy_c a17 
	on (a16.manager_c_key = a17.lev_0_key)  
union
select 'ldb.d_internal_contact_affected_user_c a18 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_internal_contact_affected_user_c a18 
	on (a11.affected_user_c_key = a18.row_key)  
union
select 'ldb.d_affected_user_location_c a19 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_internal_contact_affected_user_c a18 
 on (a11.affected_user_c_key = a18.row_key) 
	join ldb.d_affected_user_location_c a19 
	on (a18.country_c_key = a19.row_key)  
union
select 'ldb.d_incident a110 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_incident a110 
	on (a11.incident_key = a110.row_key)  
union
select 'ldb.d_business_service a111 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_business_service a111 
	on (a11.business_service_key = a111.row_key)  
union
select 'ldb.d_calendar_date a112 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_calendar_date a112 
	on (a11.last_resolved_on_key = a112.row_key)  
union
select 'ldb.d_configuration_item a113 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_configuration_item a113 
	on (a11.configuration_item_key = a113.row_key)  
union
select 'ldb.d_ci_autofill_c a114 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_ci_autofill_c a114 
	on (a11.ci_autofill_c_key = a114.row_key)  
union
select 'ldb.d_task_priority a115 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_task_priority a115 
	on (a11.priority_src_key = a115.row_key)  
union
select 'ldb.d_internal_contact_assigned_to a116 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_internal_contact_assigned_to a116 
	on (a11.assigned_to_key = a116.row_key)  
union
select 'ldb.d_internal_organization_assignment_group_type_c a117 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_internal_organization_assignment_group_type_c a117 
	on (a11.assignment_group_type_c_key = a117.row_key)  
union
select 'ldb.d_business_criticality_incident_c a118 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_business_criticality_incident_c a118 
	on (a11.business_service_criticality_src_c_key = a118.row_key)  
union
select 'ldb.d_change_request_caused_by a119 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_change_request_caused_by a119 
	on (a11.caused_by_change_key = a119.row_key)  
union
select 'ldb.d_change_request a120 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_change_request a120 
	on (a11.change_request_key = a120.row_key)  
union
select 'ldb.d_internal_organization_legalentity a121 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_internal_organization_legalentity a121 
	on (a11.company_key = a121.row_key)  
union
select 'ldb.d_customer_mdm a122 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_customer a12 
 on (a11.customer_key = a12.row_key) 
	join ldb.d_customer_mdm a122 
	on (a12.row_current_key = a122.row_current_key)  
union
select 'ldb.d_internal_organization_department a123 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_internal_organization_department a123 
	on (a11.opened_by_department_key = a123.row_key)  
union
select 'ldb.d_domain a124 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_domain a124 
	on (a11.domain_key = a124.row_key)  
union
select 'ldb.d_internal_contact_downgrade_authorized_person_c a125 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_internal_contact_downgrade_authorized_person_c a125 
	on (a11.downgrade_authorized_person_c_key = a125.row_key)  
union
select 'ldb.d_internal_contact_mdm a126 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_internal_contact a13 
 on (a11.last_resolved_by_key = a13.row_key) 
	join ldb.d_internal_contact_mdm a126 
	on (a13.row_current_key = a126.row_current_key)  
union
select 'ldb.d_calendar_time_hour a127 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_calendar_time a14 
 on (a11.opened_time_key = a14.row_key) 
	join ldb.d_calendar_time_hour a127 
	on (a14.hour_24_format_num = a127.hour_24_format_num)  
union
select 'ldb.d_impacted_location_c a128 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_impacted_location_c a128 
	on (a11.impacted_location_c_key = a128.row_key)  
union
select 'ldb.d_incident_agebucket a129 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_incident_agebucket a129 
	on (a11.age_key = a129.row_key)  
union
select 'ldb.d_internal_contact_opened_by_c a130 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_internal_contact_opened_by_c a130 
	on (a11.opened_by_key = a130.row_key)  
union
select 'ldb.d_region_c a131 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_region_c a131 
	on (a11.region_c_key = a131.row_key)  
union
select 'ldb.d_resolve_code_c a132 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_resolve_code_c a132 
	on (a11.resolve_code_src_c_key = a132.row_key)  
union
select 'ldb.d_incident_mttrbucket_c a133 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_incident_mttrbucket_c a133 
	on (a11.mttr_c_key = a133.row_key)  
union
select 'ldb.d_internal_contact_manager_c a134 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_internal_contact_manager_c a134 
	on (a11.manager_c_key = a134.row_key)  
union
select 'ldb.d_incident_on_hold_type_c a135 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_incident_on_hold_type_c a135 
	on (a11.on_hold_type_c_key = a135.row_key)  
union
select 'ldb.d_service_business_service_c a136 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_service_business_service_c a136 
	on (a11.business_service_c_key = a136.row_key)  
union
select 'ldb.d_problem a137 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_problem a137 
	on (a11.problem_key = a137.row_key)  
union
select 'ldb.d_internal_organization_support_group_c a138 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_internal_organization_support_group_c a138 
	on (a11.support_group_c_key = a138.row_key)  
union
select 'ldb.d_internal_organization_vendor_c a139 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_internal_organization_vendor_c a139 
	on (a11.vendor_c_key = a139.row_key)  
union
select 'ldb.d_task_impact a140 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_task_impact a140 
	on (a11.impact_src_key = a140.row_key)  
union
select 'ldb.d_location a141 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_location a141 
	on (a11.location_key = a141.row_key)  
union
select 'ldb.d_task_contacttype a142 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_task_contacttype a142 
	on (a11.reported_type_src_key = a142.row_key)  
union
select 'ldb.d_task_urgency a143 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_task_urgency a143 
	on (a11.urgency_src_key = a143.row_key)  
union
select 'ldb.d_business_service_used_for a144 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_business_service a111 
 on (a11.business_service_key = a111.row_key) 
	join ldb.d_business_service_used_for a144 
	on (a111.used_for_src_key = a144.row_key)  
union
select 'ldb.d_incident_category a145 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_incident a110 
 on (a11.incident_key = a110.row_key) 
	join ldb.d_incident_category a145 
	on (a110.category_src_key = a145.row_key)  
union
select 'ldb.d_incident_close_code a146 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_incident a110 
 on (a11.incident_key = a110.row_key) 
	join ldb.d_incident_close_code a146 
	on (a110.close_code_src_key = a146.row_key)  
union
select 'ldb.d_incident_state a147 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_incident a110 
 on (a11.incident_key = a110.row_key) 
	join ldb.d_incident_state a147 
	on (a110.state_src_key = a147.row_key)  
union
select 'ldb.d_incident_subcategory a148 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_incident a110 
 on (a11.incident_key = a110.row_key) 
	join ldb.d_incident_subcategory a148 
	on (a110.sub_category_src_key = a148.row_key)  
union
select 'ldb.d_calendar_week a149 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_calendar_date a112 
 on (a11.last_resolved_on_key = a112.row_key) 
	join ldb.d_calendar_week a149 
	on (a112.week_start_date_key = a149.row_key)  
union
select 'ldb.dh_queue_manager_level1_c a150 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_internal_organization_group a15 
 on (a11.assignment_group_key = a15.row_key)join ldb.d_internal_contact_queue_manager_c a16 
 on (a15.queue_manager_c_key = a16.row_key)join ldb.dh_queue_manager_hierarchy_c a17 
 on (a16.manager_c_key = a17.lev_0_key) 
	join ldb.dh_queue_manager_level1_c a150 
	on (a17.lev_1_key = a150.row_key)  
union
select 'ldb.dh_queue_manager_level2_c a151 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_internal_organization_group a15 
 on (a11.assignment_group_key = a15.row_key)join ldb.d_internal_contact_queue_manager_c a16 
 on (a15.queue_manager_c_key = a16.row_key)join ldb.dh_queue_manager_hierarchy_c a17 
 on (a16.manager_c_key = a17.lev_0_key) 
	join ldb.dh_queue_manager_level2_c a151 
	on (a17.lev_2_key = a151.row_key)  
union
select 'ldb.dh_queue_manager_level3_c a152 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_internal_organization_group a15 
 on (a11.assignment_group_key = a15.row_key)join ldb.d_internal_contact_queue_manager_c a16 
 on (a15.queue_manager_c_key = a16.row_key)join ldb.dh_queue_manager_hierarchy_c a17 
 on (a16.manager_c_key = a17.lev_0_key) 
	join ldb.dh_queue_manager_level3_c a152 
	on (a17.lev_3_key = a152.row_key)  
union
select 'ldb.dh_queue_manager_level4_c a153 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_internal_organization_group a15 
 on (a11.assignment_group_key = a15.row_key)join ldb.d_internal_contact_queue_manager_c a16 
 on (a15.queue_manager_c_key = a16.row_key)join ldb.dh_queue_manager_hierarchy_c a17 
 on (a16.manager_c_key = a17.lev_0_key) 
	join ldb.dh_queue_manager_level4_c a153 
	on (a17.lev_4_key = a153.row_key)  
union
select 'ldb.dh_queue_manager_level5_c a154 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_internal_organization_group a15 
 on (a11.assignment_group_key = a15.row_key)join ldb.d_internal_contact_queue_manager_c a16 
 on (a15.queue_manager_c_key = a16.row_key)join ldb.dh_queue_manager_hierarchy_c a17 
 on (a16.manager_c_key = a17.lev_0_key) 
	join ldb.dh_queue_manager_level5_c a154 
	on (a17.lev_5_key = a154.row_key)  
union
select 'ldb.dh_queue_manager_level6_c a155 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_internal_organization_group a15 
 on (a11.assignment_group_key = a15.row_key)join ldb.d_internal_contact_queue_manager_c a16 
 on (a15.queue_manager_c_key = a16.row_key)join ldb.dh_queue_manager_hierarchy_c a17 
 on (a16.manager_c_key = a17.lev_0_key) 
	join ldb.dh_queue_manager_level6_c a155 
	on (a17.lev_6_key = a155.row_key)  
union
select 'ldb.dh_queue_manager_level7_c a156 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_internal_organization_group a15 
 on (a11.assignment_group_key = a15.row_key)join ldb.d_internal_contact_queue_manager_c a16 
 on (a15.queue_manager_c_key = a16.row_key)join ldb.dh_queue_manager_hierarchy_c a17 
 on (a16.manager_c_key = a17.lev_0_key) 
	join ldb.dh_queue_manager_level7_c a156 
	on (a17.lev_7_key = a156.row_key)  
union
select 'ldb.d_calendar_month a157 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_calendar_date a112 
 on (a11.last_resolved_on_key = a112.row_key) 
	join ldb.d_calendar_month a157 
	on (a112.month_start_date_key = a157.row_key)  
union
select 'ldb.d_internal_contact_manager_queue_c a158 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_internal_organization_group a15 
 on (a11.assignment_group_key = a15.row_key)join ldb.d_internal_contact_queue_manager_c a16 
 on (a15.queue_manager_c_key = a16.row_key) 
	join ldb.d_internal_contact_manager_queue_c a158 
	on (a16.manager_c_key = a158.row_key)  
union
select 'ldb.d_calendar_quarter a159 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_calendar_date a112 
 on (a11.last_resolved_on_key = a112.row_key) 
	join ldb.d_calendar_quarter a159 
	on (a112.quarter_start_date_key = a159.row_key)  
union
select 'ldb.d_calendar_year a160 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_calendar_date a112 
 on (a11.last_resolved_on_key = a112.row_key) 
	join ldb.d_calendar_year a160 
	on (a112.year_start_date_key = a160.row_key)  

