select 'ldb.f_change_task a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_task a11 
union
select 'ldb.d_application a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_task a11 
 join ldb.d_application a12 
	on (a11.application_key = a12.row_key)  
union
select 'ldb.d_internal_contact a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_task a11 
 join ldb.d_internal_contact a13 
	on (a11.employee_key = a13.row_key)  
union
select 'ldb.d_change_task a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_task a11 
 join ldb.d_change_task a14 
	on (a11.change_task_key = a14.row_key)  
union
select 'ldb.d_internal_contact_assigned_to a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_task a11 
 join ldb.d_internal_contact_assigned_to a15 
	on (a11.assigned_to_key = a15.row_key)  
union
select 'ldb.d_internal_organization_group a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_task a11 
 join ldb.d_internal_organization_group a16 
	on (a11.assignment_group_key = a16.row_key)  
union
select 'ldb.d_calendar_date a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_task a11 
 join ldb.d_calendar_date a17 
	on (a11.date_key = a17.row_key)  
union
select 'ldb.d_change_request a18 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_task a11 
 join ldb.d_change_request a18 
	on (a11.change_request_key = a18.row_key)  
union
select 'ldb.d_application_mdm a19 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_task a11 
 join ldb.d_application a12 
 on (a11.application_key = a12.row_key) 
	join ldb.d_application_mdm a19 
	on (a12.mdm_key = a19.row_key)  
union
select 'ldb.d_business_service a110 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_task a11 
 join ldb.d_business_service a110 
	on (a11.business_service_key = a110.row_key)  
union
select 'ldb.d_change_request_assignment_group a111 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_task a11 
 join ldb.d_change_request_assignment_group a111 
	on (a11.parent_assignment_group_key = a111.row_key)  
union
select 'ldb.d_change_request_priority a112 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_task a11 
 join ldb.d_change_request_priority a112 
	on (a11.parent_priority_src_key = a112.row_key)  
union
select 'ldb.d_change_request_state a113 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_task a11 
 join ldb.d_change_request_state a113 
	on (a11.parent_state_src_key = a113.row_key)  
union
select 'ldb.d_change_request_type a114 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_task a11 
 join ldb.d_change_request_type a114 
	on (a11.parent_type_src_key = a114.row_key)  
union
select 'ldb.d_configuration_item a115 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_task a11 
 join ldb.d_configuration_item a115 
	on (a11.configuration_item_key = a115.row_key)  
union
select 'ldb.d_internal_contact_mdm a116 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_task a11 
 join ldb.d_internal_contact a13 
 on (a11.employee_key = a13.row_key) 
	join ldb.d_internal_contact_mdm a116 
	on (a13.employee_mdm_key = a116.row_key)  
union
select 'ldb.d_location a117 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_task a11 
 join ldb.d_location a117 
	on (a11.location_key = a117.row_key)  
union
select 'ldb.d_change_request_close_code a118 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_task a11 
 join ldb.d_change_request a18 
 on (a11.change_request_key = a18.row_key) 
	join ldb.d_change_request_close_code a118 
	on (a18.close_code_src_key = a118.row_key)  
union
select 'ldb.d_change_request_phase a119 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_task a11 
 join ldb.d_change_request a18 
 on (a11.change_request_key = a18.row_key) 
	join ldb.d_change_request_phase a119 
	on (a18.phase_src_key = a119.row_key)  
union
select 'ldb.d_change_request_phase_state a120 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_task a11 
 join ldb.d_change_request a18 
 on (a11.change_request_key = a18.row_key) 
	join ldb.d_change_request_phase_state a120 
	on (a18.phase_state_src_key = a120.row_key)  
union
select 'ldb.d_change_task_approval a121 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_task a11 
 join ldb.d_change_task a14 
 on (a11.change_task_key = a14.row_key) 
	join ldb.d_change_task_approval a121 
	on (a14.approval_src_key = a121.row_key)  
union
select 'ldb.d_change_task_category_c a122 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_task a11 
 join ldb.d_change_task a14 
 on (a11.change_task_key = a14.row_key) 
	join ldb.d_change_task_category_c a122 
	on (a14.change_task_category_c_key = a122.row_key)  
union
select 'ldb.d_change_task_closure_code_c a123 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_task a11 
 join ldb.d_change_task a14 
 on (a11.change_task_key = a14.row_key) 
	join ldb.d_change_task_closure_code_c a123 
	on (a14.change_task_closure_code_c_key = a123.row_key)  
union
select 'ldb.d_change_task_reported_type a124 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_task a11 
 join ldb.d_change_task a14 
 on (a11.change_task_key = a14.row_key) 
	join ldb.d_change_task_reported_type a124 
	on (a14.reported_type_src_key = a124.row_key)  
 
union
select 'ldb.d_change_task_impact a126 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_task a11 
 join ldb.d_change_task a14 
 on (a11.change_task_key = a14.row_key) 
	join ldb.d_change_task_impact a126 
	on (a14.impact_src_key = a126.row_key)  
union
select 'ldb.d_change_task_priority a127 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_task a11 
 join ldb.d_change_task a14 
 on (a11.change_task_key = a14.row_key) 
	join ldb.d_change_task_priority a127 
	on (a14.priority_src_key = a127.row_key)  
union
select 'ldb.d_change_task_state a128 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_task a11 
 join ldb.d_change_task a14 
 on (a11.change_task_key = a14.row_key) 
	join ldb.d_change_task_state a128 
	on (a14.state_src_key = a128.row_key)  
union
select 'ldb.d_change_task_task_type a129 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_task a11 
 join ldb.d_change_task a14 
 on (a11.change_task_key = a14.row_key) 
	join ldb.d_change_task_task_type a129 
	on (a14.task_type_src_key = a129.row_key)  
union
select 'ldb.d_change_task_urgency a130 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_task a11 
 join ldb.d_change_task a14 
 on (a11.change_task_key = a14.row_key) 
	join ldb.d_change_task_urgency a130 
	on (a14.urgency_src_key = a130.row_key) 


