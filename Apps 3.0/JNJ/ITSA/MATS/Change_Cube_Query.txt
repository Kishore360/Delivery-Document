select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_internal_contact         a12
on (a11.opened_by_key = a12.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_internal_organization_group         a13
on (a11.assignment_group_key = a13.row_key)
union
select'ldb.dh_user_group_hierarchy' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
 join ldb.d_internal_organization_group         a13
on (a11.assignment_group_key = a13.row_key)
join ldb.dh_user_group_hierarchy         a14
on (a13.row_dn_key = a14.lev_0_key)
union
select'ldb.d_change_request' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_change_request         a15
on (a11.change_request_key = a15.row_key)
union
select'ldb.d_business_service' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_business_service         a16
on (a11.business_service_key = a16.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_calendar_date         a17
on (a11.opened_on_key = a17.row_key)
union
select'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_configuration_item         a18
on (a11.configuration_item_key = a18.row_key)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_internal_contact_assigned_to         a19
on (a11.assigned_to_key = a19.row_key)
union
select'ldb.d_change_request_category' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_change_request_category         a110
on (a11.category_src_key = a110.row_key)
union
select'ldb.d_change_request_impact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_change_request_impact         a111
on (a11.impact_src_key = a111.row_key)
union
select'ldb.d_internal_contact_change_request_change_manager_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_internal_contact_change_request_change_manager_c         a112
on (a11.change_manager_c_key = a112.row_key)
union
select'ldb.d_change_request_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_change_request_priority         a113
on (a11.priority_src_key = a113.row_key)
union
select'ldb.d_change_request_reason' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_change_request_reason         a114
on (a11.reason_src_key = a114.row_key)
union
select'ldb.d_change_request_reported_type' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_change_request_reported_type         a115
on (a11.reported_type_src_key = a115.row_key)
union
select'ldb.d_change_request_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_change_request_state         a116
on (a11.state_src_key = a116.row_key)
union
select'ldb.d_change_request_review_status' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_change_request_review_status         a117
on (a11.review_status_src_key = a117.row_key)
union
select'ldb.d_change_request_risk' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_change_request_risk         a118
on (a11.risk_src_key = a118.row_key)
union
select'ldb.d_change_request_scope' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_change_request_scope         a119
on (a11.scope_src_key = a119.row_key)
union
select'ldb.d_change_request_type' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_change_request_type         a120
on (a11.type_src_key = a120.row_key)
union
select'ldb.d_change_request_urgency' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_change_request_urgency         a121
on (a11.urgency_src_key = a121.row_key)
union
select'ldb.d_internal_contact_change_request_customer_name_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_internal_contact_change_request_customer_name_c         a122
on (a11.customer_name_c_key = a122.row_key)
union
select'ldb.d_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_internal_organization_department         a123
on (a11.requested_by_department_key = a123.row_key)
union
select'ldb.d_domain' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_domain         a124
on (a11.domain_key = a124.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
 join ldb.d_internal_contact         a12
on (a11.opened_by_key = a12.row_key)
join ldb.d_internal_contact_mdm         a125
on (a12.row_current_key = a125.row_current_key)
union
select'ldb.d_location' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_location         a126
on (a11.location_key = a126.row_key)
union
select'ldb.dh_user_group_level1' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
  join ldb.d_internal_organization_group         a13
on (a11.assignment_group_key = a13.row_key)
join ldb.dh_user_group_hierarchy         a14
on (a13.row_dn_key = a14.lev_0_key)
join ldb.dh_user_group_level1         a127
on (a14.lev_1_key = a127.row_key)
union
select'ldb.d_lov_change_request_business_impact_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
 join ldb.d_change_request         a15
on (a11.change_request_key = a15.row_key)
join ldb.d_lov_change_request_business_impact_c         a128
on (a15.change_request_business_impact_c_key = a128.row_key)
union
select'ldb.d_business_service_criticality' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11
join ldb.d_business_service         a16
on (a11.business_service_key = a16.row_key) 
join ldb.d_business_service_criticality         a129
on (a16.criticality_key = a129.row_key)
union
select'ldb.d_business_service_used_for' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
 join ldb.d_business_service         a16
on (a11.business_service_key = a16.row_key)
join ldb.d_business_service_used_for         a130
on (a16.used_for_src_key = a130.row_key)
union
select'ldb.d_lov_change_request_emergency_type_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11
join ldb.d_change_request         a15
on (a11.change_request_key = a15.row_key) 
join ldb.d_lov_change_request_emergency_type_c         a131
on (a15.change_request_emergency_type_c_key = a131.row_key)
union
select'ldb.d_lov_change_request_status_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11
join ldb.d_change_request         a15
on (a11.change_request_key = a15.row_key) 
join ldb.d_lov_change_request_status_c         a132
on (a15.change_request_status_c_key = a132.row_key)
union
select'ldb.d_lov_change_request_reason_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11
join ldb.d_change_request         a15
on (a11.change_request_key = a15.row_key) 
join ldb.d_lov_change_request_reason_c         a133
on (a15.change_request_reason_c_key = a133.row_key)
union
select'ldb.dh_user_group_level2' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11
 join ldb.d_internal_organization_group         a13
on (a11.assignment_group_key = a13.row_key)
join ldb.dh_user_group_hierarchy         a14
on (a13.row_dn_key = a14.lev_0_key) 
join ldb.dh_user_group_level2         a134
on (a14.lev_2_key = a134.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11
join ldb.d_calendar_date         a17
on (a11.opened_on_key = a17.row_key) 
join ldb.d_calendar_month         a135
on (a17.month_start_date_key = a135.row_key)
union
select'ldb.d_calendar_week' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11
join ldb.d_calendar_date         a17
on (a11.opened_on_key = a17.row_key) 
join ldb.d_calendar_week         a136
on (a17.week_start_date_key = a136.row_key)
union
select'ldb.dh_user_group_level3' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11
 join ldb.d_internal_organization_group         a13
on (a11.assignment_group_key = a13.row_key)
join ldb.dh_user_group_hierarchy         a14
on (a13.row_dn_key = a14.lev_0_key) 
join ldb.dh_user_group_level3         a137
on (a14.lev_3_key = a137.row_key)
union
select'ldb.d_calendar_quarter' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11
join ldb.d_calendar_date         a17
on (a11.opened_on_key = a17.row_key) 
join ldb.d_calendar_quarter         a138
on (a17.quarter_start_date_key = a138.row_key)
union
select'ldb.d_calendar_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11
join ldb.d_calendar_date         a17
on (a11.opened_on_key = a17.row_key) 
join ldb.d_calendar_year         a139
on (a17.year_start_date_key = a139.row_key)
