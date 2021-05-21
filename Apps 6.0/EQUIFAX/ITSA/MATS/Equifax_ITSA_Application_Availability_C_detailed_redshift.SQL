select 'ldb.f_incident a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_calendar_date a12 
	on (a11.date_key = a12.row_key)  
 union
select 'ldb.d_change_request_caused_by a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_change_request_caused_by a13 
	on (a11.caused_by_change_key = a13.row_key)  
 union
select 'ldb.d_incident a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_incident a14 
	on (a11.incident_key = a14.row_key)  
 union
select 'ldb.d_problem a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_problem a15 
	on (a11.problem_key = a15.row_key)  
 union
select 'ldb.d_business_service a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_business_service a16 
	on (a11.business_service_key = a16.row_key)  
 union
select 'ldb.d_internal_organization_group a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_internal_organization_group a17 
	on (a11.assignment_group_key = a17.row_key)  
 union
select 'ldb.d_calendar_month a18 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_calendar_date a12 
 on (a11.date_key = a12.row_key) 
	join ldb.d_calendar_month a18 
	on (a12.month_start_date_key = a18.row_key)  
 union
select 'ldb.d_calendar_quarter a19 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_calendar_date a12 
 on (a11.date_key = a12.row_key) join ldb.d_calendar_month a18 
 on (a12.month_start_date_key = a18.row_key) 
	join ldb.d_calendar_quarter a19 
	on (a18.quarter_start_date_key = a19.row_key)  
 union
select 'ldb.d_calendar_week a110 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_calendar_date a12 
 on (a11.date_key = a12.row_key) 
	join ldb.d_calendar_week a110 
	on (a12.week_start_date_key = a110.row_key)  
 union
select 'ldb.d_calendar_year a111 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_calendar_date a12 
 on (a11.date_key = a12.row_key) join ldb.d_calendar_month a18 
 on (a12.month_start_date_key = a18.row_key) join ldb.d_calendar_quarter a19 
 on (a18.quarter_start_date_key = a19.row_key) 
	join ldb.d_calendar_year a111 
	on (a19.year_start_date_key = a111.row_key)  
 union
select 'ldb.d_business_application_v1_c a112 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_business_service a16 
 on (a11.business_service_key = a16.row_key) 
	join ldb.d_business_application_v1_c a112 
	on (a16.business_application_v1_c_key = a112.row_key)  
 union
select 'ldb.d_incident_priority a113 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_incident a14 
 on (a11.incident_key = a14.row_key) 
	join ldb.d_incident_priority a113 
	on (a14.priority_src_key = a113.row_key)  
 union
select 'ldb.d_incident_state a114 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_incident a14 
 on (a11.incident_key = a14.row_key) 
	join ldb.d_incident_state a114 
	on (a14.state_src_key = a114.row_key)  
 union
select 'ldb.d_lov_application_business_service_classification_c a115 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_business_service a16 
 on (a11.business_service_key = a16.row_key) 
	join ldb.d_lov_application_business_service_classification_c a115 
	on (a16.application_business_service_classification_c_key = a115.row_key)  
 union
select 'ldb.d_lov_application_business_service_operational_status_c a116 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_business_service a16 
 on (a11.business_service_key = a16.row_key) 
	join ldb.d_lov_application_business_service_operational_status_c a116 
	on (a16.application_business_service_operational_status_c_key = a116.row_key)  
 union
select 'ldb.d_business_service_used_for a117 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_business_service a16 
 on (a11.business_service_key = a16.row_key) 
	join ldb.d_business_service_used_for a117 
	on (a16.used_for_src_key = a117.row_key)  
 union
select 'ldb.d_group_bu_c a118 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_internal_organization_group a17 
 on (a11.assignment_group_key = a17.row_key) 
	join ldb.d_group_bu_c a118 
	on (a17.group_bu_c_key = a118.row_key)  
 union
select 'ldb.d_business_service_department_c a119 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_business_service a16 
 on (a11.business_service_key = a16.row_key) 
	join ldb.d_business_service_department_c a119 
	on (a16.business_service_department_c_key = a119.row_key)  
 union
select 'ldb.d_lov_business_application_cloud_platform_c a120 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_business_service a16 
 on (a11.business_service_key = a16.row_key) join ldb.d_business_application_v1_c a112 
 on (a16.business_application_v1_c_key = a112.row_key) 
	join ldb.d_lov_business_application_cloud_platform_c a120 
	on (a112.business_application_cloud_platform_c_key = a120.row_key)  
 union
select 'ldb.d_lov_business_application_install_type_c a121 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_business_service a16 
 on (a11.business_service_key = a16.row_key) join ldb.d_business_application_v1_c a112 
 on (a16.business_application_v1_c_key = a112.row_key) 
	join ldb.d_lov_business_application_install_type_c a121 
	on (a112.business_application_install_type_c_key = a121.row_key)  
