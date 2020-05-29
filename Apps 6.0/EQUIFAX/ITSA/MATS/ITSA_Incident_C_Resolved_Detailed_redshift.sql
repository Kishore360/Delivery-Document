select 'ldb.f_incident_resolved a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
union
select 'ldb.d_internal_organization_group a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_internal_organization_group a12 
 on (a11.assignment_group_key = a12.row_key)  
union
select 'ldb.d_customer a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_customer a13 
 on (a11.customer_key = a13.row_key)  
union
select 'ldb.d_internal_contact a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_internal_contact a14 
 on (a11.employee_key = a14.row_key)  
union
select 'ldb.d_calendar_time a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_calendar_time a15 
 on (a11.time_key = a15.row_key)  
union
select 'ldb.d_internal_contact_assigned_to a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_internal_contact_assigned_to a16 
 on (a11.assigned_to_key = a16.row_key)  
union
select 'ldb.d_business_service a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_business_service a17 
 on (a11.business_service_key = a17.row_key)  
union
select 'ldb.d_calendar_date a18 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_calendar_date a18 
 on (a11.date_key = a18.row_key)  
union
select 'ldb.d_calendar_month a19 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_calendar_date a18 
 on (a11.date_key = a18.row_key) 
 join ldb.d_calendar_month a19 
 on (a18.month_start_date_key = a19.row_key)  
union
select 'ldb.d_calendar_quarter a110 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_calendar_date a18 
 on (a11.date_key = a18.row_key)join ldb.d_calendar_month a19 
 on (a18.month_start_date_key = a19.row_key) 
 join ldb.d_calendar_quarter a110 
 on (a19.quarter_start_date_key = a110.row_key)  
union
select 'ldb.d_change_request a111 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_change_request a111 
 on (a11.change_request_key = a111.row_key)  
union
select 'ldb.d_configuration_item a112 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_configuration_item a112 
 on (a11.configuration_item_key = a112.row_key)  
union
select 'ldb.d_incident a113 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_incident a113 
 on (a11.incident_key = a113.row_key)  
union
select 'ldb.d_parent_incident a114 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_incident a113 
 on (a11.incident_key = a113.row_key) 
 join ldb.d_parent_incident a114 
 on (a113.parent_incident_key = a114.row_key)  
union
select 'ldb.d_group_bu_c a115 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_internal_organization_group a12 
 on (a11.assignment_group_key = a12.row_key) 
 join ldb.d_group_bu_c a115 
 on (a12.group_bu_c_key = a115.row_key)  
union
select 'ldb.d_change_request_caused_by a116 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_change_request_caused_by a116 
 on (a11.caused_by_change_key = a116.row_key)  
union
select 'ldb.d_internal_organization_legalentity a117 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_internal_organization_legalentity a117 
 on (a11.company_key = a117.row_key)  
union
select 'ldb.d_customer_mdm a118 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_customer a13 
 on (a11.customer_key = a13.row_key) 
 join ldb.d_customer_mdm a118 
 on (a13.customer_mdm_key = a118.row_key)  
union
select 'ldb.d_internal_organization_department a119 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_internal_contact a14 
 on (a11.employee_key = a14.row_key) 
 join ldb.d_internal_organization_department a119 
 on (a14.department_key = a119.row_key)  
union
select 'ldb.d_domain a120 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_domain a120 
 on (a11.domain_key = a120.row_key)  
union
select 'ldb.d_internal_contact_mdm a121 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_internal_contact a14 
 on (a11.employee_key = a14.row_key) 
 join ldb.d_internal_contact_mdm a121 
 on (a14.employee_mdm_key = a121.row_key)  
union
select 'ldb.d_calendar_time_hour a122 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_calendar_time a15 
 on (a11.time_key = a15.row_key) 
 join ldb.d_calendar_time_hour a122 
 on (a15.hour_key = a122.row_key)  
union
select 'ldb.d_incident_caller_group_c a123 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_incident_caller_group_c a123 
 on (a11.caller_group_c_key = a123.row_key)  
union
select 'ldb.d_incident_contacttype a124 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_incident_contacttype a124 
 on (a11.reported_type_src_key = a124.row_key)  
union
select 'ldb.d_incident_ext_customer_c a125 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_incident_ext_customer_c a125 
 on (a11.ext_customer_c_key = a125.row_key)  
union
select 'ldb.d_incident_impact a126 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_incident_impact a126 
 on (a11.impact_src_key = a126.row_key)  
union
select 'ldb.d_incident_urgency a127 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_incident_urgency a127 
 on (a11.urgency_src_key = a127.row_key)  
union
select 'ldb.d_location a128 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_location a128 
 on (a11.location_key = a128.row_key)  
union
select 'ldb.d_business_service_criticality a129 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_business_service a17 
 on (a11.business_service_key = a17.row_key) 
 join ldb.d_business_service_criticality a129 
 on (a17.criticality_key = a129.row_key)  
union
select 'ldb.d_business_service_used_for a130 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_business_service a17 
 on (a11.business_service_key = a17.row_key) 
 join ldb.d_business_service_used_for a130 
 on (a17.used_for_src_key = a130.row_key)  
union
select 'ldb.d_calendar_week a131 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_calendar_date a18 
 on (a11.date_key = a18.row_key) 
 join ldb.d_calendar_week a131 
 on (a18.week_start_date_key = a131.row_key)  
union
select 'ldb.d_incident_category a132 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_incident a113 
 on (a11.incident_key = a113.row_key) 
 join ldb.d_incident_category a132 
 on (a113.category_src_key = a132.row_key)  
union
select 'ldb.d_incident_close_code a133 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_incident a113 
 on (a11.incident_key = a113.row_key) 
 join ldb.d_incident_close_code a133 
 on (a113.close_code_src_key = a133.row_key)  
union
select 'ldb.d_incident_detection_method_c a134 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_incident a113 
 on (a11.incident_key = a113.row_key) 
 join ldb.d_incident_detection_method_c a134 
 on (a113.incident_detection_method_c_key = a134.row_key)  
union
select 'ldb.d_incident_owner_group_c a135 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_incident a113 
 on (a11.incident_key = a113.row_key) 
 join ldb.d_incident_owner_group_c a135 
 on (a113.incident_owner_group_c_key = a135.row_key)  
union
select 'ldb.d_incident_priority a136 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_incident a113 
 on (a11.incident_key = a113.row_key) 
 join ldb.d_incident_priority a136 
 on (a113.priority_src_key = a136.row_key)  
union
select 'ldb.d_task_sla_resolution_flag a137 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_incident a113 
 on (a11.incident_key = a113.row_key) 
 join ldb.d_task_sla_resolution_flag a137 
 on (a113.met_resolution_sla_flag_key = a137.row_key)  
union
select 'ldb.d_task_sla_response_flag a138 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_incident a113 
 on (a11.incident_key = a113.row_key) 
 join ldb.d_task_sla_response_flag a138 
 on (a113.met_response_sla_flag_key = a138.row_key)  
union
select 'ldb.d_incident_severity a139 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_incident a113 
 on (a11.incident_key = a113.row_key) 
 join ldb.d_incident_severity a139 
 on (a113.severity_src_key = a139.row_key)  
union
select 'ldb.d_incident_state a140 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_incident a113 
 on (a11.incident_key = a113.row_key) 
 join ldb.d_incident_state a140 
 on (a113.state_src_key = a140.row_key)  
union
select 'ldb.d_incident_subcategory a141 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_incident a113 
 on (a11.incident_key = a113.row_key) 
 join ldb.d_incident_subcategory a141 
 on (a113.sub_category_src_key = a141.row_key)  
union
select 'ldb.d_calendar_year a142 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_resolved a11 
 join ldb.d_calendar_date a18 
 on (a11.date_key = a18.row_key)join ldb.d_calendar_month a19 
 on (a18.month_start_date_key = a19.row_key)join ldb.d_calendar_quarter a110 
 on (a19.quarter_start_date_key = a110.row_key) 
 join ldb.d_calendar_year a142 
 on (a110.year_start_date_key = a142.row_key)  

