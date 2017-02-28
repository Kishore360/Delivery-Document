
select'ldb.f_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
union
select'ldb.d_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_incident       a12
on (a11.incident_key=a12.row_key)
union
select'ldb.d_lov_situation_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_incident       a12
on (a11.incident_key=a12.row_key)
join ldb.d_lov_situation_c       a13
on (a12.situation_c_key=a13.row_key)
union
select'ldb.d_lov_u_subcategory_incident_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_incident       a12
on (a11.incident_key=a12.row_key)
join ldb.d_lov_u_subcategory_incident_c       a14
on (a12.sub_category_src_key=a14.row_key)
union
select'ldb.d_service_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_service_c       a15
on (a11.business_service_key=a15.row_key)
union
select'ldb.d_customer' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_customer       a16
on (a11.customer_key=a16.row_key)
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_internal_contact       a17
on (a11.opened_by_key=a17.row_key)
union
select'ldb.d_calendar_time' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_calendar_time       a18
on (a11.opened_time_key=a18.row_key)
union
select'ldb.d_business_service' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_business_service       a19
on (a11.business_service_key=a19.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_calendar_date       a110
on (a11.opened_on_key=a110.row_key)
union
select'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_configuration_item       a111
on (a11.configuration_item_key=a111.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_internal_organization_group       a112
on (a11.assignment_group_key=a112.row_key)
union
select'ldb.d_task_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_task_priority       a113
on (a11.priority_src_key=a113.row_key)
union
select'ldb.d_access_lov_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_service_c       a15
on (a11.business_service_key=a15.row_key)
join ldb.d_access_lov_c       a114
on (a15.access_c_key=a114.row_key)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_internal_contact_assigned_to       a115
on (a11.assigned_to_key=a115.row_key)
union
select'ldb.d_lov_business_critical_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_service_c       a15
on (a11.business_service_key=a15.row_key)
join ldb.d_lov_business_critical_c       a116
on (a15.busines_criticality_c_key=a116.row_key)
union
select'ldb.d_change_request_caused_by' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_change_request_caused_by       a117
on (a11.caused_by_change_key=a117.row_key)
union
select'ldb.d_change_request' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_change_request       a118
on (a11.change_request_key=a118.row_key)
union
select'ldb.d_internal_organization_legalentity' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_internal_organization_legalentity       a119
on (a11.company_key=a119.row_key)
union
select'ldb.d_customer_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11
 join ldb.d_customer       a16
on (a11.customer_key=a16.row_key)
join ldb.d_customer_mdm       a120
on (a16.row_current_key=a120.row_current_key)
union
select'ldb.d_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_internal_organization_department       a121
on (a11.opened_by_department_key=a121.row_key)
union
select'ldb.d_domain' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_domain       a122
on (a11.domain_key=a122.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_internal_contact       a17
on (a11.opened_by_key=a17.row_key)
join ldb.d_internal_contact_mdm       a123
on (a17.row_current_key=a123.row_current_key)
union
select'ldb.d_calendar_time_hour' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_calendar_time       a18
on (a11.opened_time_key=a18.row_key)
join ldb.d_calendar_time_hour       a124
on (a18.hour_24_format_num=a124.hour_24_format_num)
union
select'ldb.d_request_item_original_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_request_item_original_c       a125
on (a11.original_request_item_c_key=a125.row_key)
union
select'ldb.d_task_impact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_task_impact       a126
on (a11.impact_src_key=a126.row_key)
union
select'ldb.d_location' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_location       a127
on (a11.location_key=a127.row_key)
union
select'ldb.d_task_contacttype' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_task_contacttype       a128
on (a11.reported_type_src_key=a128.row_key)
union
select'ldb.d_task_urgency' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_task_urgency       a129
on (a11.urgency_src_key=a129.row_key)
union
select'ldb.d_incident_category' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_incident       a12
on (a11.incident_key=a12.row_key)
join ldb.d_incident_category       a132
on (a12.category_src_key=a132.row_key)
union
select'ldb.d_incident_close_code' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_incident       a12
on (a11.incident_key=a12.row_key)
join ldb.d_incident_close_code       a133
on (a12.close_code_src_key=a133.row_key)
union
select'ldb.d_incident_severity' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_incident       a12
on (a11.incident_key=a12.row_key)
join ldb.d_incident_severity       a134
on (a12.severity_src_key=a134.row_key)
union
select'ldb.d_incident_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_incident       a12
on (a11.incident_key=a12.row_key)
join ldb.d_incident_state       a135
on (a12.state_src_key=a135.row_key)
union
select'ldb.d_incident_type_lov_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_incident       a12
on (a11.incident_key=a12.row_key)
join ldb.d_incident_type_lov_c       a137
on (a12.incident_type_c_key=a137.row_key)
union
select'ldb.d_lov_pending_reason_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
  join ldb.d_incident       a12
on (a11.incident_key=a12.row_key)
join ldb.d_lov_pending_reason_c       a140
on (a12.pending_reason_c_key=a140.row_key)
union
select'ldb.d_business_service_criticality' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_business_service       a19
on (a11.business_service_key=a19.row_key)
join ldb.d_business_service_criticality       a130
on (a19.criticality_key=a130.row_key)
union
select'ldb.d_business_service_used_for' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_business_service       a19
on (a11.business_service_key=a19.row_key)
join ldb.d_business_service_used_for       a131
on (a19.used_for_src_key=a131.row_key)
union
select'ldb.d_internal_contact_manager_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_internal_organization_group       a112
on (a11.assignment_group_key=a112.row_key)
join ldb.d_internal_contact_assignment_group_manager_c       a138
on (a112.manager_c_key=a138.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_calendar_date       a110
on (a11.opened_on_key=a110.row_key)
join ldb.d_calendar_month       a139
on (a110.month_start_date_key=a139.row_key)
union
select'ldb.d_calendar_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_calendar_date       a110
on (a11.opened_on_key=a110.row_key)
join ldb.d_calendar_year       a141
on (a110.year_start_date_key=a141.row_key)






