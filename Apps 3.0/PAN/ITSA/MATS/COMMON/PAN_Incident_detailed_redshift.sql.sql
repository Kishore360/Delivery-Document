
select'ldb.f_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
union
select'ldb.d_customer' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_customer       a12
on (a11.customer_key=a12.row_key)
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_internal_contact       a13
on (a11.opened_by_key=a13.row_key)
union
select'ldb.d_calendar_time' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_calendar_time       a14
on (a11.opened_time_key=a14.row_key)
union
select'ldb.d_business_service' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_business_service       a15
on (a11.business_service_key=a15.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_calendar_date       a16
on (a11.opened_on_key=a16.row_key)
union
select'ldb.d_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_incident       a17
on (a11.incident_key=a17.row_key)
union
select'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_configuration_item       a18
on (a11.configuration_item_key=a18.row_key)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_internal_contact_assigned_to       a19
on (a11.assigned_to_key=a19.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_internal_organization_group       a110
on (a11.assignment_group_key=a110.row_key)
union
select'ldb.d_change_request_caused_by' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_change_request_caused_by       a111
on (a11.caused_by_change_key=a111.row_key)
union
select'ldb.d_change_request' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_change_request       a112
on (a11.change_request_key=a112.row_key)
union
select'ldb.d_internal_organization_legalentity' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_internal_organization_legalentity       a113
on (a11.company_key=a113.row_key)
union
select'ldb.d_customer_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_customer       a12
on (a11.customer_key=a12.row_key)
join ldb.d_customer_mdm       a114
on (a12.row_current_key=a114.row_current_key)
union
select'ldb.d_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_internal_organization_department       a115
on (a11.opened_by_department_key=a115.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11
 join ldb.d_internal_contact       a13
on (a11.opened_by_key=a13.row_key)
join ldb.d_internal_contact_mdm       a116
on (a13.row_current_key=a116.row_current_key)
union
select'ldb.d_calendar_time_hour' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_calendar_time       a14
on (a11.opened_time_key=a14.row_key)
join ldb.d_calendar_time_hour       a117
on (a14.hour_24_format_num=a117.hour_24_format_num)
union
select'ldb.d_incident_agebucket' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_incident_agebucket       a118
on (a11.age_key=a118.row_key)
union
select'ldb.d_lov_method_of_contact_view_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_lov_method_of_contact_view_c       a119
on (a11.method_of_contact_c_key=a119.row_key)
union
select'ldb.d_lov_service_type_view_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_lov_service_type_view_c       a120
on (a11.service_type_c_key=a120.row_key)
union
select'ldb.d_lov_resolver_department_view_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_lov_resolver_department_view_c       a121
on (a11.resolver_department_c_key=a121.row_key)
union
select'ldb.d_task_impact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_task_impact       a122
on (a11.impact_src_key=a122.row_key)
union
select'ldb.d_location' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_location       a123
on (a11.location_key=a123.row_key)
union
select'ldb.d_task_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_task_priority       a124
on (a11.priority_src_key=a124.row_key)
union
select'ldb.d_task_contacttype' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_task_contacttype       a125
on (a11.reported_type_src_key=a125.row_key)
union
select'ldb.d_task_urgency' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_task_urgency       a126
on (a11.urgency_src_key=a126.row_key)
union
select'ldb.d_lov_type_view_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_lov_type_view_c       a127
on (a11.type_c_key=a127.row_key)
union
select'ldb.d_lov_who_is_affected_view_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_lov_who_is_affected_view_c       a128
on (a11.who_is_affected_c_key=a128.row_key)
union
select'ldb.d_business_service_criticality' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_business_service       a15
on (a11.business_service_key=a15.row_key)
join ldb.d_business_service_criticality       a129
on (a15.criticality_key=a129.row_key)
union
select'ldb.d_business_service_used_for' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_business_service       a15
on (a11.business_service_key=a15.row_key)
join ldb.d_business_service_used_for       a130
on (a15.used_for_src_key=a130.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11
 join ldb.d_calendar_date       a16
on (a11.opened_on_key=a16.row_key)
join ldb.d_calendar_month       a136
on (a16.month_start_date_key=a136.row_key)
union
select'ldb.d_calendar_week' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_calendar_date       a16
on (a11.opened_on_key=a16.row_key)
join ldb.d_calendar_week       a137
on (a16.week_start_date_key=a137.row_key)
union
select'ldb.d_incident_category' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_incident       a17
on (a11.incident_key=a17.row_key)
join ldb.d_incident_category       a131
on (a17.category_src_key=a131.row_key)
union
select'ldb.d_incident_close_code' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_incident       a17
on (a11.incident_key=a17.row_key)
join ldb.d_incident_close_code       a132
on (a17.close_code_src_key=a132.row_key)
union
select'ldb.d_incident_severity' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11
 join ldb.d_incident       a17
on (a11.incident_key=a17.row_key)
join ldb.d_incident_severity       a133
on (a17.severity_src_key=a133.row_key)
union
select'ldb.d_incident_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_incident       a17
on (a11.incident_key=a17.row_key)
join ldb.d_incident_state       a134
on (a17.state_src_key=a134.row_key)
union
select'ldb.d_incident_subcategory' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_incident       a17
on (a11.incident_key=a17.row_key)
join ldb.d_incident_subcategory       a135
on (a17.sub_category_src_key=a135.row_key)




