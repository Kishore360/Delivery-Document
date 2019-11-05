select 'ldb.f_change_failure_analysis_c a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_failure_analysis_c a11 
union
select 'ldb.d_change_request a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_failure_analysis_c a11 
 join ldb.d_change_request a12 
	on (a11.change_request_key = a12.row_key)  
union
select 'ldb.d_calendar_date a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_failure_analysis_c a11 
 join ldb.d_calendar_date a13 
	on (a11.opened_on_key = a13.row_key)  
union
select 'ldb.d_calendar_week a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_failure_analysis_c a11 
 join ldb.d_calendar_date a13 
 on (a11.opened_on_key = a13.row_key) 
	join ldb.d_calendar_week a14 
	on (a13.week_start_date_key = a14.row_key)  
union
select 'ldb.d_internal_organization_group a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_failure_analysis_c a11 
 join ldb.d_internal_organization_group a15 
	on (a11.assignment_group_key = a15.row_key)  
union
select 'ldb.d_business_service a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_failure_analysis_c a11 
 join ldb.d_business_service a16 
	on (a11.business_service_c_key = a16.row_key)  
union
select 'ldb.d_internal_organization_business_approver_c a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_failure_analysis_c a11 
 join ldb.d_internal_organization_business_approver_c a17 
	on (a11.business_approver_c_key = a17.row_key)  
union
select 'ldb.d_change_request_impact a18 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_failure_analysis_c a11 
 join ldb.d_change_request_impact a18 
	on (a11.impact_src_key = a18.row_key)  
union
select 'ldb.d_change_request_state a19 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_failure_analysis_c a11 
 join ldb.d_change_request_state a19 
	on (a11.state_src_key = a19.row_key)  
union
select 'ldb.d_change_request_type a110 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_failure_analysis_c a11 
 join ldb.d_change_request_type a110 
	on (a11.type_src_key = a110.row_key)  
union
select 'ldb.d_internal_organization_gis_approval_c a111 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_failure_analysis_c a11 
 join ldb.d_internal_organization_gis_approval_c a111 
	on (a11.gis_approval_group_c_key = a111.row_key)  
union
select 'ldb.d_implementation_result_c a112 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_failure_analysis_c a11 
 join ldb.d_implementation_result_c a112 
	on (a11.implementation_result_src_c_key = a112.row_key)  
union
select 'ldb.d_service_business_service_c a113 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_failure_analysis_c a11 
 join ldb.d_service_business_service_c a113 
	on (a11.business_service_c_key = a113.row_key)  
union
select 'ldb.d_source_of_change_c a114 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_failure_analysis_c a11 
 join ldb.d_source_of_change_c a114 
	on (a11.source_of_change_src_c_key = a114.row_key)  
union
select 'ldb.d_internal_organization_vendor_c a115 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_failure_analysis_c a11 
 join ldb.d_internal_organization_vendor_c a115 
	on (a11.vendor_c_key = a115.row_key)  
union
select 'ldb.d_lov_change_request_approval_workflow_c a116 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_failure_analysis_c a11 
 join ldb.d_lov_change_request_approval_workflow_c a116 
	on (a11.change_request_approval_workflow_c_key = a116.row_key)  
union
select 'ldb.d_calendar_month a117 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_failure_analysis_c a11 
 join ldb.d_calendar_date a13 
 on (a11.opened_on_key = a13.row_key) 
	join ldb.d_calendar_month a117 
	on (a13.month_start_date_key = a117.row_key)  
union
select 'ldb.d_calendar_quarter a118 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_failure_analysis_c a11 
 join ldb.d_calendar_date a13 
 on (a11.opened_on_key = a13.row_key) 
	join ldb.d_calendar_quarter a118 
	on (a13.quarter_start_date_key = a118.row_key)  

