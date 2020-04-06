select 'ldb.f_problem a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
union
select 'ldb.d_application a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_application a12 
 on (a11.application_key = a12.row_key)  
union
select 'ldb.d_internal_contact a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_internal_contact a13 
 on (a11.employee_key = a13.row_key)  
union
select 'ldb.d_calendar_time a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_calendar_time a14 
 on (a11.time_key = a14.row_key)  
union
select 'ldb.d_internal_contact_assigned_to a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_internal_contact_assigned_to a15 
 on (a11.assigned_to_key = a15.row_key)  
union
select 'ldb.d_internal_organization_group a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_internal_organization_group a16 
 on (a11.assignment_group_key = a16.row_key)  
union
select 'ldb.d_business_service a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_business_service a17 
 on (a11.business_service_key = a17.row_key)  
union
select 'ldb.d_calendar_date a18 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_calendar_date a18 
 on (a11.date_key = a18.row_key)  
union
select 'ldb.d_calendar_month a19 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_calendar_date a18 
 on (a11.date_key = a18.row_key) 
 join ldb.d_calendar_month a19 
 on (a18.month_start_date_key = a19.row_key)  
union
select 'ldb.d_calendar_quarter a110 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_calendar_date a18 
 on (a11.date_key = a18.row_key)join ldb.d_calendar_month a19 
 on (a18.month_start_date_key = a19.row_key) 
 join ldb.d_calendar_quarter a110 
 on (a19.quarter_start_date_key = a110.row_key)  
union
select 'ldb.d_configuration_item a111 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_configuration_item a111 
 on (a11.configuration_item_key = a111.row_key)  
union
select 'ldb.d_problem a112 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_problem a112 
 on (a11.problem_key = a112.row_key)  
union
select 'ldb.d_application_mdm a113 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_application a12 
 on (a11.application_key = a12.row_key) 
 join ldb.d_application_mdm a113 
 on (a12.mdm_key = a113.row_key)  
union
select 'ldb.d_change_request a114 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_change_request a114 
 on (a11.change_request_key = a114.row_key)  
union
select 'ldb.d_internal_organization_department a115 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_internal_contact a13 
 on (a11.employee_key = a13.row_key) 
 join ldb.d_internal_organization_department a115 
 on (a13.department_key = a115.row_key)  
union
select 'ldb.d_internal_contact_mdm a116 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_internal_contact a13 
 on (a11.employee_key = a13.row_key) 
 join ldb.d_internal_contact_mdm a116 
 on (a13.employee_mdm_key = a116.row_key)  
union
select 'ldb.d_calendar_time_hour a117 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_calendar_time a14 
 on (a11.time_key = a14.row_key) 
 join ldb.d_calendar_time_hour a117 
 on (a14.hour_key = a117.row_key)  
union
select 'ldb.d_location a118 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_location a118 
 on (a11.location_key = a118.row_key)  
union
select 'ldb.d_problem_reported_type a119 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_problem_reported_type a119 
 on (a11.reported_type_src_key = a119.row_key)  
union
select 'ldb.d_problem_impact a120 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_problem_impact a120 
 on (a11.impact_src_key = a120.row_key)  
union
select 'ldb.d_problem_priority a121 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_problem_priority a121 
 on (a11.priority_src_key = a121.row_key)  
union
select 'ldb.d_problem_urgency a122 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_problem_urgency a122 
 on (a11.urgency_src_key = a122.row_key)  
union
select 'ldb.d_location_assigned_to a123 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_internal_contact_assigned_to a15 
 on (a11.assigned_to_key = a15.row_key) 
 join ldb.d_location_assigned_to a123 
 on (a15.location_key = a123.row_key)  
union
select 'ldb.d_business_service_criticality a124 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_business_service a17 
 on (a11.business_service_key = a17.row_key) 
 join ldb.d_business_service_criticality a124 
 on (a17.criticality_key = a124.row_key)  
union
select 'ldb.d_business_service_used_for a125 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_business_service a17 
 on (a11.business_service_key = a17.row_key) 
 join ldb.d_business_service_used_for a125 
 on (a17.used_for_src_key = a125.row_key)  
union
select 'ldb.d_calendar_week a126 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_calendar_date a18 
 on (a11.date_key = a18.row_key) 
 join ldb.d_calendar_week a126 
 on (a18.week_start_date_key = a126.row_key)  
union
select 'ldb.d_problem_state a127 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_problem a112 
 on (a11.problem_key = a112.row_key) 
 join ldb.d_problem_state a127 
 on (a112.state_src_key = a127.row_key)  
union
select 'ldb.d_calendar_year a128 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem a11 
 join ldb.d_calendar_date a18 
 on (a11.date_key = a18.row_key)join ldb.d_calendar_month a19 
 on (a18.month_start_date_key = a19.row_key)join ldb.d_calendar_quarter a110 
 on (a19.quarter_start_date_key = a110.row_key) 
 join ldb.d_calendar_year a128 
 on (a110.year_start_date_key = a128.row_key)  

