select 'ldb.f_incident_resolved' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
union
select'ldb.d_customer' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
join ldb.d_customer       a12
on (a11.customer_key=a12.row_key)
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
join ldb.d_internal_contact       a13
on (a11.last_resolved_by_key=a13.row_key)
union
select'ldb.d_calendar_time' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
join ldb.d_calendar_time       a14
on (a11.opened_time_key=a14.row_key)
union
select'ldb.d_business_service' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
join ldb.d_business_service       a15
on (a11.business_service_key=a15.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
join ldb.d_calendar_date       a16
on (a11.last_resolved_on_key=a16.row_key)
union
select'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
join ldb.d_configuration_item       a17
on (a11.configuration_item_key=a17.row_key)
union
select'ldb.d_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
join ldb.d_incident       a18
on (a11.incident_key=a18.row_key)
union
select'ldb.d_ci_autofill_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
join ldb.d_ci_autofill_c       a19
on (a11.ci_autofill_c_key=a19.row_key)
union
select'ldb.d_task_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
join ldb.d_task_priority       a110
on (a11.priority_src_key=a110.row_key)
union
select'ldb.d_internal_contact_affected_user_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
join ldb.d_internal_contact_affected_user_c       a111
on (a11.affected_user_c_key=a111.row_key)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
join ldb.d_internal_contact_assigned_to       a112
on (a11.assigned_to_key=a112.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
join ldb.d_internal_organization_group       a113
on (a11.assignment_group_key=a113.row_key)
union
select'ldb.d_change_request_caused_by' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
join ldb.d_change_request_caused_by       a114
on (a11.caused_by_change_key=a114.row_key)
union
select'ldb.d_change_request' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
join ldb.d_change_request       a115
on (a11.change_request_key=a115.row_key)
union
select'ldb.d_internal_organization_legalentity' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
join ldb.d_internal_organization_legalentity       a116
on (a11.company_key=a116.row_key)
union
select'ldb.d_customer_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
 join ldb.d_customer       a12
on (a11.customer_key=a12.row_key)
join ldb.d_customer_mdm       a117
on (a12.row_current_key=a117.row_current_key)
union
select'ldb.d_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
join ldb.d_internal_organization_department       a118
on (a11.opened_by_department_key=a118.row_key)
union
select'ldb.d_domain' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
join ldb.d_domain       a119
on (a11.domain_key=a119.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
 join ldb.d_internal_contact       a13
on (a11.last_resolved_by_key=a13.row_key)
join ldb.d_internal_contact_mdm       a120
on (a13.row_current_key=a120.row_current_key)
union
select'ldb.d_calendar_time_hour' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
 join ldb.d_calendar_time       a14
on (a11.opened_time_key=a14.row_key)
join ldb.d_calendar_time_hour       a121
on (a14.hour_24_format_num=a121.hour_24_format_num)
union
select'ldb.d_impacted_location_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
join ldb.d_impacted_location_c       a122
on (a11.impacted_location_c_key=a122.row_key)
union
select'ldb.d_internal_contact_opened_by_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
join ldb.d_internal_contact_opened_by_c       a123
on (a11.opened_by_key=a123.row_key)
union
select'ldb.d_region_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
join ldb.d_region_c       a124
on (a11.region_c_key=a124.row_key)
union
select'ldb.d_resolve_code_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
join ldb.d_resolve_code_c       a125
on (a11.resolve_code_src_c_key=a125.row_key)
union
select'ldb.d_service_business_service_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
join ldb.d_service_business_service_c       a126
on (a11.business_service_c_key=a126.row_key)
union
select'ldb.d_internal_organization_vendor_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
join ldb.d_internal_organization_vendor_c       a127
on (a11.vendor_c_key=a127.row_key)
union
select'ldb.d_task_impact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
join ldb.d_task_impact       a128
on (a11.impact_src_key=a128.row_key)
union
select'ldb.d_location' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
join ldb.d_location       a129
on (a11.location_key=a129.row_key)
union
select'ldb.d_task_contacttype' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
join ldb.d_task_contacttype       a130
on (a11.reported_type_src_key=a130.row_key)
union
select'ldb.d_task_urgency' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
join ldb.d_task_urgency       a131
on (a11.urgency_src_key=a131.row_key)
union
select'd_business_criticality_incident_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
join ldb.d_business_criticality_incident_c       a132
on (a11.business_service_criticality_src_c_key=a132.row_key)
union
select'ldb.d_business_service_used_for' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
 join ldb.d_business_service       a15
on (a11.business_service_key=a15.row_key)
join ldb.d_business_service_used_for       a133
on (a15.used_for_src_key=a133.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
 join ldb.d_calendar_date       a16
on (a11.last_resolved_on_key=a16.row_key)
join ldb.d_calendar_month       a139
on (a16.month_start_date_key=a139.row_key)
union
select'ldb.d_incident_category' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
 join ldb.d_incident       a18
on (a11.incident_key=a18.row_key)
join ldb.d_incident_category       a134
on (a18.category_src_key=a134.row_key)
union
select'ldb.d_incident_close_code' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
 join ldb.d_incident       a18
on (a11.incident_key=a18.row_key)
join ldb.d_incident_close_code       a135
on (a18.close_code_src_key=a135.row_key)
union
select'ldb.d_incident_severity' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
 join ldb.d_incident       a18
on (a11.incident_key=a18.row_key)
join ldb.d_incident_severity       a136
on (a18.severity_src_key=a136.row_key)
union
select'ldb.d_incident_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
 join ldb.d_incident       a18
on (a11.incident_key=a18.row_key)
join ldb.d_incident_state       a137
on (a18.state_src_key=a137.row_key)
union
select'ldb.d_incident_subcategory' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
 join ldb.d_incident       a18
on (a11.incident_key=a18.row_key)
join ldb.d_incident_subcategory       a138
on (a18.sub_category_src_key=a138.row_key)





