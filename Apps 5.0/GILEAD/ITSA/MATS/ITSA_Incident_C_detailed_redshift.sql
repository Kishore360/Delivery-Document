select 'ldb.f_incident a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
union
select 'ldb.d_customer a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_customer a12 
 on (a11.customer_key = a12.row_key)  
union
select 'ldb.d_internal_contact a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_internal_contact a13 
 on (a11.opened_by_key = a13.row_key)  
union
select 'ldb.d_calendar_time a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_calendar_time a14 
 on (a11.opened_time_key = a14.row_key)  
union
select 'ldb.d_internal_organization_group a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_internal_organization_group a15 
 on (a11.assignment_group_key = a15.row_key)  
union
select 'ldb.dh_assignment_group_tier_hierarchy a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.dh_assignment_group_tier_hierarchy a16 
 on (a11.assignment_group_key = a16.user_group_tier_key)  
union
select 'ldb.dh_assignment_group_type_hierarchy a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.dh_assignment_group_type_hierarchy a17 
 on (a11.assignment_group_key = a17.user_group_type_key)  
union
select 'ldb.d_calendar_date a18 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_calendar_date a18 
 on (a11.opened_on_key = a18.row_key)  
union
select 'ldb.d_configuration_item a19 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_configuration_item a19 
 on (a11.configuration_item_key = a19.row_key)  
union
select 'ldb.d_location a110 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_location a110 
 on (a11.location_key = a110.row_key)  
union
select 'ldb.d_incident a111 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_incident a111 
 on (a11.incident_key = a111.row_key)  
union
select 'ldb.d_calendar_week a112 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_calendar_date a18 
 on (a11.opened_on_key = a18.row_key) 
 join ldb.d_calendar_week a112 
 on (a18.week_start_date_key = a112.row_key)  
union
select 'ldb.d_calendar_year a113 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_calendar_date a18 
 on (a11.opened_on_key = a18.row_key) 
 join ldb.d_calendar_year a113 
 on (a18.year_start_date_key = a113.row_key)  
union
select 'ldb.d_internal_contact_assigned_to a114 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_internal_contact_assigned_to a114 
 on (a11.assigned_to_key = a114.row_key)  
union
select 'ldb.d_internal_organization_legalentity a115 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_internal_organization_legalentity a115 
 on (a11.company_key = a115.row_key)  
union
select 'ldb.d_internal_organization_department a116 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_internal_organization_department a116 
 on (a11.opened_by_department_key = a116.row_key)  
union
select 'ldb.d_domain a117 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_domain a117 
 on (a11.domain_key = a117.row_key)  
union
select 'ldb.d_internal_contact_mdm a118 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_internal_contact a13 
 on (a11.opened_by_key = a13.row_key) 
 join ldb.d_internal_contact_mdm a118 
 on (a13.row_current_key = a118.row_current_key)  
union
select 'ldb.d_calendar_time_hour a119 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_calendar_time a14 
 on (a11.opened_time_key = a14.row_key) 
 join ldb.d_calendar_time_hour a119 
 on (a14.hour_24_format_num = a119.hour_24_format_num)  
union
select 'ldb.d_application_c a120 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_application_c a120 
 on (a11.application_c_key = a120.row_key)  
union
select 'ldb.d_business_service_c a121 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_business_service_c a121 
 on (a11.business_service_c_key = a121.row_key)  
union
select 'ldb.d_configuration_item_causing_ci_c a122 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_configuration_item_causing_ci_c a122 
 on (a11.causing_ci_c_key = a122.row_key)  
union
select 'ldb.d_incident_contacttype a123 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_incident_contacttype a123 
 on (a11.reported_type_src_key = a123.row_key)  
union
select 'ldb.d_internal_contact_incident_customer_c a124 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_internal_contact_incident_customer_c a124 
 on (a11.incident_customer_c_key = a124.row_key)  
union
select 'ldb.d_task_hold_type_c a125 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_task_hold_type_c a125 
 on (a11.hold_type_src_c_key = a125.row_key)  
union
select 'ldb.d_incident_impact a126 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_incident_impact a126 
 on (a11.impact_src_key = a126.row_key)  
union
select 'ldb.d_internal_contact_opened_by_c a127 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_internal_contact_opened_by_c a127 
 on (a11.opened_by_c_key = a127.row_key)  
union
select 'ldb.d_incident_urgency a128 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_incident_urgency a128 
 on (a11.urgency_src_key = a128.row_key)  
union
select 'ldb.d_problem a129 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_problem a129 
 on (a11.problem_key = a129.row_key)  
union
select 'ldb.d_technical_service_c a130 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_technical_service_c a130 
 on (a11.technical_service_c_key = a130.row_key)  
union
select 'ldb.d_internal_contact_manager_c a131 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_internal_organization_group a15 
 on (a11.assignment_group_key = a15.row_key) 
 join ldb.d_internal_contact_manager_c a131 
 on (a15.manager_c_key = a131.row_key)  
union
select 'ldb.d_internal_organization_escalation_gp_c a132 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_internal_organization_group a15 
 on (a11.assignment_group_key = a15.row_key) 
 join ldb.d_internal_organization_escalation_gp_c a132 
 on (a15.escalation_group_c_key = a132.row_key)  
union
select 'ldb.d_internal_organization_vendor_c a133 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_internal_organization_group a15 
 on (a11.assignment_group_key = a15.row_key) 
 join ldb.d_internal_organization_vendor_c a133 
 on (a15.vendor_c_key = a133.row_key)  
union
select 'ldb.d_incident_category a134 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_incident a111 
 on (a11.incident_key = a111.row_key) 
 join ldb.d_incident_category a134 
 on (a111.category_src_key = a134.row_key)  
union
select 'ldb.d_incident_close_code a135 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_incident a111 
 on (a11.incident_key = a111.row_key) 
 join ldb.d_incident_close_code a135 
 on (a111.close_code_src_key = a135.row_key)  
union
select 'ldb.d_incident_priority a136 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_incident a111 
 on (a11.incident_key = a111.row_key) 
 join ldb.d_incident_priority a136 
 on (a111.priority_src_key = a136.row_key)  
union
select 'ldb.d_incident_severity a137 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_incident a111 
 on (a11.incident_key = a111.row_key) 
 join ldb.d_incident_severity a137 
 on (a111.severity_src_key = a137.row_key)  
union
select 'ldb.d_incident_state a138 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_incident a111 
 on (a11.incident_key = a111.row_key) 
 join ldb.d_incident_state a138 
 on (a111.state_src_key = a138.row_key)  
union
select 'ldb.d_incident_subcategory a139 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_incident a111 
 on (a11.incident_key = a111.row_key) 
 join ldb.d_incident_subcategory a139 
 on (a111.sub_category_src_key = a139.row_key)  
union
select 'ldb.d_internal_contact_owner_c a140 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_internal_organization_group a15 
 on (a11.assignment_group_key = a15.row_key) 
 join ldb.d_internal_contact_owner_c a140 
 on (a15.owner_c_key = a140.row_key)  
union
select 'ldb.d_location_site_c a141 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_location a110 
 on (a11.location_key = a110.row_key) 
 join ldb.d_location_site_c a141 
 on (a110.site_c_key = a141.row_key)  
union
select 'ldb.d_calendar_month a142 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_calendar_date a18 
 on (a11.opened_on_key = a18.row_key) 
 join ldb.d_calendar_month a142 
 on (a18.month_start_date_key = a142.row_key)  
union
select 'ldb.d_calendar_quarter a143 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_calendar_date a18 
 on (a11.opened_on_key = a18.row_key) 
 join ldb.d_calendar_quarter a143 
 on (a18.quarter_start_date_key = a143.row_key)  

