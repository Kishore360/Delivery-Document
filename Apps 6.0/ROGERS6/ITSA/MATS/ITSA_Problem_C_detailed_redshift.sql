select 'ldb.f_problem a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_internal_contact a12 
 on (a11.employee_key = a12.row_key)  
 union
select 'ldb.d_calendar_time a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_calendar_time a13 
 on (a11.time_key = a13.row_key)  
 union
select 'ldb.d_problem a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_problem a14 
 on (a11.problem_key = a14.row_key)  
 union
select 'ldb.d_lov_problem_subcategory_c a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_lov_problem_subcategory_c a15 
 on (a11.problem_subcategory_src_c_key = a15.row_key)  
 union
select 'ldb.d_internal_contact_assigned_to a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_internal_contact_assigned_to a16 
 on (a11.assigned_to_key = a16.row_key)  
 union
select 'ldb.d_internal_organization_group a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_internal_organization_group a17 
 on (a11.assignment_group_key = a17.row_key)  
 union
select 'ldb.d_business_service a18 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_business_service a18 
 on (a11.business_service_key = a18.row_key)  
 union
select 'ldb.d_internal_organization_pit_lead_c a19 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_internal_organization_pit_lead_c a19 
 on (a11.assignment_group_for_pit_lead_c_key = a19.row_key)  
 union
select 'ldb.d_pit_lead_support_group_business_unit_c a110 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_internal_organization_pit_lead_c a19 
 on (a11.assignment_group_for_pit_lead_c_key = a19.row_key) 
 join ldb.d_pit_lead_support_group_business_unit_c a110 
 on (a19.org_business_unit_c_key = a110.row_key)  
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
select 'ldb.d_configuration_item a114 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_configuration_item a114 
 on (a11.configuration_item_key = a114.row_key)  
 union
select 'ldb.d_incident a115 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_incident a115 
 on (a11.problem_incident_c_key = a115.row_key)  
 union
select 'ldb.d_calendar_week a116 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_calendar_date a111 
 on (a11.date_key = a111.row_key) 
 join ldb.d_calendar_week a116 
 on (a111.week_start_date_key = a116.row_key)  
 union
select 'ldb.d_calendar_year a117 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_calendar_date a111 
 on (a11.date_key = a111.row_key) join ldb.d_calendar_month a112 
 on (a111.month_start_date_key = a112.row_key) join ldb.d_calendar_quarter a113 
 on (a112.quarter_start_date_key = a113.row_key) 
 join ldb.d_calendar_year a117 
 on (a113.year_start_date_key = a117.row_key)  
 union
select 'ldb.d_change_request a118 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_change_request a118 
 on (a11.change_request_key = a118.row_key)  
 union
select 'ldb.d_internal_organization_department a119 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_internal_contact a12 
 on (a11.employee_key = a12.row_key) 
 join ldb.d_internal_organization_department a119 
 on (a12.department_key = a119.row_key)  
 union
select 'ldb.d_domain a120 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_domain a120 
 on (a11.domain_key = a120.row_key)  
 union
select 'ldb.d_internal_contact_mdm a121 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_internal_contact a12 
 on (a11.employee_key = a12.row_key) 
 join ldb.d_internal_contact_mdm a121 
 on (a12.employee_mdm_key = a121.row_key)  
 union
select 'ldb.d_lov_fact_source_c a122 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_lov_fact_source_c a122 
 on (a11.fact_source_c_key = a122.row_key)  
 union
select 'ldb.d_calendar_time_hour a123 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_calendar_time a13 
 on (a11.time_key = a13.row_key) 
 join ldb.d_calendar_time_hour a123 
 on (a13.hour_key = a123.row_key)  
 union
select 'ldb.d_internal_contact_investigation_lead_c a124 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_internal_contact_investigation_lead_c a124 
 on (a11.investigation_lead_c_key = a124.row_key)  
 union
select 'ldb.d_location a125 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_location a125 
 on (a11.location_key = a125.row_key)  
 union
select 'ldb.d_lov_problem_category_c a126 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_lov_problem_category_c a126 
 on (a11.problem_category_c_key = a126.row_key)  
 union
select 'ldb.d_problem_reported_type a127 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_problem_reported_type a127 
 on (a11.reported_type_src_key = a127.row_key)  
 union
select 'ldb.d_problem_impact a128 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_problem_impact a128 
 on (a11.impact_src_key = a128.row_key)  
 union
select 'ldb.d_problem_priority a129 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_problem_priority a129 
 on (a11.priority_src_key = a129.row_key)  
 union
select 'ldb.d_lov_problem_contact_type_c a130 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_lov_problem_contact_type_c a130 
 on (a11.problem_reported_type_src_c_key = a130.row_key)  
 union
select 'ldb.d_problem_urgency a131 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_problem_urgency a131 
 on (a11.urgency_src_key = a131.row_key)  
 union
select 'ldb.d_lov_problem_rca_agebucket_c a132 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_lov_problem_rca_agebucket_c a132 
 on (a11.rca_age_c_key = a132.row_key)  
 union
select 'ldb.d_kb_knowledge_c a133 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_kb_knowledge_c a133 
 on (a11.kb_knowledge_c_key = a133.row_key)  
 union
select 'ldb.d_problem_related_problem_c a134 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_problem_related_problem_c a134 
 on (a11.related_problem_c_key = a134.row_key)  
 union
select 'ldb.d_request_item a135 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_request_item a135 
 on (a11.request_item_c_key = a135.row_key)  
 union
select 'ldb.d_location_assigned_to a136 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_internal_contact_assigned_to a16 
 on (a11.assigned_to_key = a16.row_key) 
 join ldb.d_location_assigned_to a136 
 on (a16.location_key = a136.row_key)  
 union
select 'ldb.d_business_service_criticality a137 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_business_service a18 
 on (a11.business_service_key = a18.row_key) 
 join ldb.d_business_service_criticality a137 
 on (a18.criticality_key = a137.row_key)  
 union
select 'ldb.d_business_service_used_for a138 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_business_service a18 
 on (a11.business_service_key = a18.row_key) 
 join ldb.d_business_service_used_for a138 
 on (a18.used_for_src_key = a138.row_key)  
 union
select 'ldb.d_incident_priority a139 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_incident a115 
 on (a11.problem_incident_c_key = a115.row_key) 
 join ldb.d_incident_priority a139 
 on (a115.priority_src_key = a139.row_key)  
 union
select 'ldb.d_assignment_group_vendor_for_pit_lead_problem_c a140 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_internal_organization_pit_lead_c a19 
 on (a11.assignment_group_for_pit_lead_c_key = a19.row_key) 
 join ldb.d_assignment_group_vendor_for_pit_lead_problem_c a140 
 on (a19.group_vendor_c_key = a140.row_key)  
 union
select 'ldb.d_lov_problem_primary_closure_code_c a141 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_problem a14 
 on (a11.problem_key = a14.row_key) 
 join ldb.d_lov_problem_primary_closure_code_c a141 
 on (a14.primary_closure_code_src_c_key = a141.row_key)  
 union
select 'ldb.d_problem_investigation_lead_2_c a142 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_problem a14 
 on (a11.problem_key = a14.row_key) 
 join ldb.d_problem_investigation_lead_2_c a142 
 on (a14.problem_investigation_lead_2_c_key = a142.row_key)  
 union
select 'ldb.d_problem_pit_lead_assignment_group_2_c a143 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_problem a14 
 on (a11.problem_key = a14.row_key) 
 join ldb.d_problem_pit_lead_assignment_group_2_c a143 
 on (a14.problem_pit_lead_assignment_group_2_c_key = a143.row_key)  
 union
select 'ldb.d_problem_state a144 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_problem a14 
 on (a11.problem_key = a14.row_key) 
 join ldb.d_problem_state a144 
 on (a14.state_src_key = a144.row_key)  
 union
select 'ldb.d_lov_problem_substatus_c a145 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_problem a14 
 on (a11.problem_key = a14.row_key) 
 join ldb.d_lov_problem_substatus_c a145 
 on (a14.substatus_src_c_key = a145.row_key)  
 union
select 'ldb.d_lov_problem_reason_for_disqualification_c a146 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_problem a14 
 on (a11.problem_key = a14.row_key) 
 join ldb.d_lov_problem_reason_for_disqualification_c a146 
 on (a14.reason_for_disqualification_src_c_key = a146.row_key)  
 union
select 'ldb.d_lov_problem_reason_for_non_implementation_c a147 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_problem a14 
 on (a11.problem_key = a14.row_key) 
 join ldb.d_lov_problem_reason_for_non_implementation_c a147 
 on (a14.reason_for_non_implementation_src_c_key = a147.row_key)  
 union
select 'ldb.d_lov_problem_swat_code_c a148 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_problem a14 
 on (a11.problem_key = a14.row_key) 
 join ldb.d_lov_problem_swat_code_c a148 
 on (a14.swat_code_src_c_key = a148.row_key)  
 union
select 'ldb.d_lov_problem_secondary_closure_code_c a149 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_problem a14 
 on (a11.problem_key = a14.row_key) 
 join ldb.d_lov_problem_secondary_closure_code_c a149 
 on (a14.secondary_closure_code_src_c_key = a149.row_key)  
 union
select 'ldb.d_lov_problem_sub_status_c a150 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_problem a14 
 on (a11.problem_key = a14.row_key) 
 join ldb.d_lov_problem_sub_status_c a150 
 on (a14.sub_status_src_c_key = a150.row_key) 

