select 'ldb.f_incident' as Table_Name, count(a11.row_key) Row_Count
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
select'ldb.d_change_request' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_change_request       a17
on (a11.change_request_key=a17.row_key)
union
select'ldb.d_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_incident       a18
on (a11.incident_key=a18.row_key)
union
select'ldb.d_internal_organization_legalentity' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_internal_organization_legalentity       a19
on (a11.company_key=a19.row_key)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_internal_contact_assigned_to       a110
on (a11.assigned_to_key=a110.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_internal_organization_group       a111
on (a11.assignment_group_key=a111.row_key)
union
select'ldb.d_change_request_caused_by' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_change_request_caused_by       a112
on (a11.caused_by_change_key=a112.row_key)
union
select'ldb.d_customer_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_customer       a12
on (a11.customer_key=a12.row_key)
join ldb.d_customer_mdm       a113
on (a12.row_current_key=a113.row_current_key)
union
select'ldb.d_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_internal_organization_department       a114
on (a11.opened_by_department_key=a114.row_key)
union
select'ldb.d_lov_disposition_code_incident_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_lov_disposition_code_incident_c       a115
on (a11.disposition_src_c_key=a115.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_internal_contact       a13
on (a11.opened_by_key=a13.row_key)
join ldb.d_internal_contact_mdm       a116
on (a13.row_current_key=a116.row_current_key)
union
select'ldb.d_lov_environment_type_incident_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_lov_environment_type_incident_c       a117
on (a11.environment_type_src_c_key=a117.row_key)
union
select'ldb.d_lov_feature_type_incident_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_lov_feature_type_incident_c       a118
on (a11.feature_type_src_c_key=a118.row_key)
union
select'ldb.d_calendar_time_hour' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_calendar_time       a14
on (a11.opened_time_key=a14.row_key)
join ldb.d_calendar_time_hour       a119
on (a14.hour_24_format_num=a119.hour_24_format_num)
union
select'ldb.d_lov_incident_hierarachy_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_lov_incident_hierarachy_c       a120
on (a11.incident_hierarachy_src_c_key=a120.row_key)
union
select'ldb.d_lov_intial_priority_incident_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_lov_intial_priority_incident_c       a121
on (a11.initial_priority_src_c_key=a121.row_key)
union
select'ldb.d_lov_parent_type_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_lov_parent_type_c       a122
on (a11.parent_type_src_c_key=a122.row_key)
union
select'ldb.d_lov_pending_reason_incident_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_lov_pending_reason_incident_c       a123
on (a11.pending_reason_src_c_key=a123.row_key)
union
select'ldb.d_lov_reproducability_incident_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_lov_reproducability_incident_c       a124
on (a11.reproducability_src_c_key=a124.row_key)
union
select'ldb.d_lov_issue_type_incident_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_lov_issue_type_incident_c       a125
on (a11.issue_type_src_c_key=a125.row_key)
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
select'ldb.d_task_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_task_priority       a128
on (a11.priority_src_key=a128.row_key)
union
select'ldb.d_task_contacttype' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_task_contacttype       a129
on (a11.reported_type_src_key=a129.row_key)
union
select'ldb.d_task_urgency' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_task_urgency       a130
on (a11.urgency_src_key=a130.row_key)
union
select'ldb.d_lov_verification_code_incident_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_lov_verification_code_incident_c       a131
on (a11.verification_src_c_key=a131.row_key)
union
select'ldb.d_business_service_criticality' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_business_service       a15
on (a11.business_service_key=a15.row_key)
join ldb.d_business_service_criticality       a132
on (a15.criticality_key=a132.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11
 join ldb.d_calendar_date       a16
on (a11.opened_on_key=a16.row_key)
join ldb.d_calendar_month       a139
on (a16.month_start_date_key=a139.row_key)
union
select'ldb.d_incident_category' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_incident       a18
on (a11.incident_key=a18.row_key)
join ldb.d_incident_category       a134
on (a18.category_src_key=a134.row_key)
union
select'ldb.d_incident_close_code' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_incident       a18
on (a11.incident_key=a18.row_key)
join ldb.d_incident_close_code       a135
on (a18.close_code_src_key=a135.row_key)
union
select'ldb.d_incident_severity' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_incident       a18
on (a11.incident_key=a18.row_key)
join ldb.d_incident_severity       a136
on (a18.severity_src_key=a136.row_key)
union
select'ldb.d_incident_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_incident       a18
on (a11.incident_key=a18.row_key)
join ldb.d_incident_state       a137
on (a18.state_src_key=a137.row_key)
union
select'ldb.d_incident_subcategory' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_incident       a18
on (a11.incident_key=a18.row_key)
join ldb.d_incident_subcategory       a138
on (a18.sub_category_src_key=a138.row_key)
union
select'ldb.d_lov_company_type_core_company_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_internal_organization_legalentity       a19
on (a11.company_key=a19.row_key)
join ldb.d_lov_company_type_core_company_c       a133
on (a19.company_type_src_c_key=a133.row_key)






