select'ldb.f_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
union
select'ldb.d_internal_organization_legalentity' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_internal_organization_legalentity       a12
on (a11.company_key=a12.row_key)
union
select'ldb.d_customer' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_customer       a13
on (a11.customer_key=a13.row_key)
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_internal_contact       a14
on (a11.opened_by_key=a14.row_key)
union
select'ldb.d_calendar_time' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_calendar_time       a15
on (a11.opened_time_key=a15.row_key)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_internal_contact_assigned_to       a16
on (a11.assigned_to_key=a16.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_internal_organization_group       a17
on (a11.assignment_group_key=a17.row_key)
union
select'ldb.d_business_service' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_business_service       a18
on (a11.business_service_key=a18.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_calendar_date       a19
on (a11.opened_on_key=a19.row_key)
union
select'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_configuration_item       a110
on (a11.configuration_item_key=a110.row_key)
union
select'ldb.d_internal_contact_requested_for_incident_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_internal_contact_requested_for_incident_c       a111
on (a11.requested_for_key=a111.row_key)
union
select'ldb.d_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_incident       a112
on (a11.incident_key=a112.row_key)
union
select'ldb.d_lov_area_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_lov_area_c       a113
on (a11.area_c_key=a113.row_key)
union
select'ldb.d_lov_category_selector_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_lov_category_selector_c       a114
on (a11.category_selector_c_key=a114.row_key)
union
select'ldb.d_change_request_caused_by' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_change_request_caused_by       a115
on (a11.caused_by_change_key=a115.row_key)
union
select'ldb.d_change_request' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_change_request       a116
on (a11.change_request_key=a116.row_key)
union
select'ldb.d_customer_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_customer       a13
on (a11.customer_key=a13.row_key)
join ldb.d_customer_mdm       a117
on (a13.row_current_key=a117.row_current_key)
union
select'ldb.d_lov_data_center_ops_locations_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_lov_data_center_ops_locations_c       a118
on (a11.data_center_ops_locations_c_key=a118.row_key)
union
select'ldb.d_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_internal_organization_department       a119
on (a11.opened_by_department_key=a119.row_key)
union
select'ldb.d_domain' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_domain       a120
on (a11.domain_key=a120.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_internal_contact       a14
on (a11.opened_by_key=a14.row_key)
join ldb.d_internal_contact_mdm       a121
on (a14.row_current_key=a121.row_current_key)
union
select'ldb.d_lov_tier_4_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_lov_tier_4_c       a122
on (a11.tier_4_c_key=a122.row_key)
union
select'ldb.d_calendar_time_hour' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_calendar_time       a15
on (a11.opened_time_key=a15.row_key)
join ldb.d_calendar_time_hour       a123
on (a15.hour_24_format_num=a123.hour_24_format_num)
union
select'ldb.d_lov_problem_category_incident_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_lov_problem_category_incident_c       a124
on (a11.problem_category_c_key=a124.row_key)
union
select'ldb.d_lov_region_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_lov_region_c       a125
on (a11.region_c_key=a125.row_key)
union
select'ldb.d_lov_resolved_via_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_lov_resolved_via_c       a126
on (a11.resolved_via_c_key=a126.row_key)
union
select'ldb.d_lov_u_reason_for_l1_resolveable_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_lov_u_reason_for_l1_resolveable_c       a127
on (a11.reason_for_l1_resolveable_c_reason_for_l1_resolveable_key=a127.row_key)
union
select'ldb.d_task_impact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_task_impact       a128
on (a11.impact_src_key=a128.row_key)
union
select'ldb.d_location' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_location       a129
on (a11.location_key=a129.row_key)
union
select'ldb.d_task_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_task_priority       a130
on (a11.priority_src_key=a130.row_key)
union
select'ldb.d_task_contacttype' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_task_contacttype       a131
on (a11.reported_type_src_key=a131.row_key)
union
select'ldb.d_task_urgency' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_task_urgency       a132
on (a11.urgency_src_key=a132.row_key)
union
select'ldb.d_internal_contact_assigned_to_manager_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_internal_contact_assigned_to       a16
on (a11.assigned_to_key=a16.row_key)
join ldb.d_internal_contact_assigned_to_manager_c       a133
on (a16.manager_c_key=a133.row_key)
union
select'ldb.d_internal_contact_group_manager_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_internal_organization_group       a17
on (a11.assignment_group_key=a17.row_key)
join ldb.d_internal_contact_group_manager_c       a134
on (a17.org_manager_c_key=a134.row_key)
union
select'ldb.d_internal_organization_group_parent_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_internal_organization_group       a17
on (a11.assignment_group_key=a17.row_key)
join ldb.d_internal_organization_group_parent_c       a135
on (a17.parent_c_key=a135.row_key)
union
select'ldb.d_business_service_criticality' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11
 join ldb.d_business_service       a18
on (a11.business_service_key=a18.row_key)
join ldb.d_business_service_criticality       a136
on (a18.criticality_key=a136.row_key)
union
select'ldb.d_business_service_used_for' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_business_service       a18
on (a11.business_service_key=a18.row_key)
join ldb.d_business_service_used_for       a137
on (a18.used_for_src_key=a137.row_key)
union
select'ldb.d_incident_category' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_incident       a112
on (a11.incident_key=a112.row_key)
join ldb.d_incident_category       a138
on (a112.category_src_key=a138.row_key)
union
select'ldb.d_incident_close_code' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11
 join ldb.d_incident       a112
on (a11.incident_key=a112.row_key)
join ldb.d_incident_close_code       a139
on (a112.close_code_src_key=a139.row_key)
union
select'ldb.d_incident_severity' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_incident       a112
on (a11.incident_key=a112.row_key)
join ldb.d_incident_severity       a140
on (a112.severity_src_key=a140.row_key)
union
select'ldb.d_incident_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11
 join ldb.d_incident       a112
on (a11.incident_key=a112.row_key)
join ldb.d_incident_state       a141
on (a112.state_src_key=a141.row_key)
union
select'ldb.d_incident_subcategory' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_incident       a112
on (a11.incident_key=a112.row_key)
join ldb.d_incident_subcategory       a142
on (a112.sub_category_src_key=a142.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_calendar_date       a19
on (a11.opened_on_key=a19.row_key)
join ldb.d_calendar_month       a143
on (a19.month_start_date_key=a143.row_key)
union
select'ldb.d_calendar_week' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_calendar_date       a19
on (a11.opened_on_key=a19.row_key)
join ldb.d_calendar_week       a144
on (a19.week_start_date_key=a144.row_key)
union
select'ldb.d_calendar_quarter' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_calendar_date       a19
on (a11.opened_on_key=a19.row_key)
join ldb.d_calendar_quarter       a145
on (a19.quarter_start_date_key=a145.row_key)
union
select'ldb.d_calendar_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_calendar_date       a19
on (a11.opened_on_key=a19.row_key)
join ldb.d_calendar_year       a146
on (a19.year_start_date_key=a146.row_key)



