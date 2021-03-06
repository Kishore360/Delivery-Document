select 'ldb.f_change_request a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request a11 
union
select 'ldb.d_application a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request a11 
 join ldb.d_application a12 
 on (a11.application_key = a12.row_key)  
union
select 'ldb.d_internal_contact a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request a11 
 join ldb.d_internal_contact a13 
 on (a11.employee_key = a13.row_key)  
union
select 'ldb.d_internal_contact_assigned_to a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request a11 
 join ldb.d_internal_contact_assigned_to a14 
 on (a11.assigned_to_key = a14.row_key)  
union
select 'ldb.d_internal_organization_group a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request a11 
 join ldb.d_internal_organization_group a15 
 on (a11.assignment_group_key = a15.row_key)  
union
select 'ldb.d_business_service a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request a11 
 join ldb.d_business_service a16 
 on (a11.business_service_key = a16.row_key)  
union
select 'ldb.d_calendar_date a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request a11 
 join ldb.d_calendar_date a17 
 on (a11.date_key = a17.row_key)  
union
select 'ldb.d_calendar_month a18 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request a11 
 join ldb.d_calendar_date a17 
 on (a11.date_key = a17.row_key) 
 join ldb.d_calendar_month a18 
 on (a17.month_start_date_key = a18.row_key)  
union
select 'ldb.d_calendar_quarter a19 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request a11 
 join ldb.d_calendar_date a17 
 on (a11.date_key = a17.row_key)join ldb.d_calendar_month a18 
 on (a17.month_start_date_key = a18.row_key) 
 join ldb.d_calendar_quarter a19 
 on (a18.quarter_start_date_key = a19.row_key)  
union
select 'ldb.d_change_request a110 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request a11 
 join ldb.d_change_request a110 
 on (a11.change_request_key = a110.row_key)  
union
select 'ldb.d_change_request_risk a111 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request a11 
 join ldb.d_change_request_risk a111 
 on (a11.risk_src_key = a111.row_key)  
union
select 'ldb.d_configuration_item a112 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request a11 
 join ldb.d_configuration_item a112 
 on (a11.configuration_item_key = a112.row_key)  
union
select 'ldb.d_application_mdm a113 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request a11 
 join ldb.d_application a12 
 on (a11.application_key = a12.row_key) 
 join ldb.d_application_mdm a113 
 on (a12.mdm_key = a113.row_key)  
union
select 'ldb.d_change_request_approval a114 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request a11 
 join ldb.d_change_request_approval a114 
 on (a11.approval_state_src_key = a114.row_key)  
union
select 'ldb.d_change_request_category a115 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request a11 
 join ldb.d_change_request_category a115 
 on (a11.category_src_key = a115.row_key)  
union
select 'ldb.d_change_request_reported_type a116 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request a11 
 join ldb.d_change_request_reported_type a116 
 on (a11.reported_type_src_key = a116.row_key)  
union
select 'ldb.d_change_request_impact a117 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request a11 
 join ldb.d_change_request_impact a117 
 on (a11.impact_src_key = a117.row_key)  
union
select 'ldb.d_change_request_priority a118 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request a11 
 join ldb.d_change_request_priority a118 
 on (a11.priority_src_key = a118.row_key)  
union
select 'ldb.d_change_request_reason a119 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request a11 
 join ldb.d_change_request_reason a119 
 on (a11.reason_src_key = a119.row_key)  
union
select 'ldb.d_change_request_review_status a120 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request a11 
 join ldb.d_change_request_review_status a120 
 on (a11.review_status_src_key = a120.row_key)  
union
select 'ldb.d_change_request_scope a121 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request a11 
 join ldb.d_change_request_scope a121 
 on (a11.scope_src_key = a121.row_key)  
union
select 'ldb.d_change_request_state a122 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request a11 
 join ldb.d_change_request_state a122 
 on (a11.state_src_key = a122.row_key)  
union
select 'ldb.d_change_request_type a123 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request a11 
 join ldb.d_change_request_type a123 
 on (a11.type_src_key = a123.row_key)  
union
select 'ldb.d_change_request_urgency a124 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request a11 
 join ldb.d_change_request_urgency a124 
 on (a11.urgency_src_key = a124.row_key)  
union
select 'ldb.d_internal_organization_department a125 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request a11 
 join ldb.d_internal_organization_department a125 
 on (a11.requested_by_department_key = a125.row_key)  
union
select 'ldb.d_domain a126 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request a11 
 join ldb.d_domain a126 
 on (a11.domain_key = a126.row_key)  
union
select 'ldb.d_internal_contact_mdm a127 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request a11 
 join ldb.d_internal_contact a13 
 on (a11.employee_key = a13.row_key) 
 join ldb.d_internal_contact_mdm a127 
 on (a13.employee_mdm_key = a127.row_key)  
union
select 'ldb.d_location a128 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request a11 
 join ldb.d_location a128 
 on (a11.location_key = a128.row_key)  
union
select 'ldb.d_business_service_criticality a129 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request a11 
 join ldb.d_business_service a16 
 on (a11.business_service_key = a16.row_key) 
 join ldb.d_business_service_criticality a129 
 on (a16.criticality_key = a129.row_key)  
union
select 'ldb.d_business_service_used_for a130 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request a11 
 join ldb.d_business_service a16 
 on (a11.business_service_key = a16.row_key) 
 join ldb.d_business_service_used_for a130 
 on (a16.used_for_src_key = a130.row_key)  
union
select 'ldb.d_calendar_week a131 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request a11 
 join ldb.d_calendar_date a17 
 on (a11.date_key = a17.row_key) 
 join ldb.d_calendar_week a131 
 on (a17.week_start_date_key = a131.row_key)  
union
select 'ldb.d_calendar_year a132 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request a11 
 join ldb.d_calendar_date a17 
 on (a11.date_key = a17.row_key)join ldb.d_calendar_month a18 
 on (a17.month_start_date_key = a18.row_key)join ldb.d_calendar_quarter a19 
 on (a18.quarter_start_date_key = a19.row_key) 
 join ldb.d_calendar_year a132 
 on (a19.year_start_date_key = a132.row_key)  

