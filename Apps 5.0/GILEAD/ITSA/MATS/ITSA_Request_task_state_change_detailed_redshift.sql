select 'ldb.f_request_task_state_activity a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_task_state_activity a11 
union
select 'ldb.d_internal_contact_assigned_to a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_task_state_activity a11 
 join ldb.d_internal_contact_assigned_to a12 
	on (a11.assigned_to_key = a12.row_key)  
union
select 'ldb.d_internal_organization_group a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_task_state_activity a11 
 join ldb.d_internal_organization_group a13 
	on (a11.assignment_group_key = a13.row_key)  
union
select 'ldb.d_request_item a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_task_state_activity a11 
 join ldb.d_request_item a14 
	on (a11.request_item_key = a14.row_key)  
union
select 'ldb.d_request a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_task_state_activity a11 
 join ldb.d_request a15 
	on (a11.request_key = a15.row_key)  
union
select 'ldb.d_request_task a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_task_state_activity a11 
 join ldb.d_request_task a16 
	on (a11.request_task_key = a16.row_key)  
union
select 'ldb.d_configuration_item a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_task_state_activity a11 
 join ldb.d_configuration_item a17 
	on (a11.configuration_item_key = a17.row_key)  
union
select 'ldb.d_request_item_stage a18 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_task_state_activity a11 
 join ldb.d_request_item_stage a18 
	on (a11.current_request_item_stage_key = a18.row_key)  
union
select 'ldb.d_request_item_state a19 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_task_state_activity a11 
 join ldb.d_request_item_state a19 
	on (a11.current_request_item_state_key = a19.row_key)  
union
select 'ldb.d_sc_task_approval a110 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_task_state_activity a11 
 join ldb.d_sc_task_approval a110 
	on (a11.approval_state_src_key = a110.row_key)  
union
select 'ldb.d_sc_task_from_state a111 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_task_state_activity a11 
 join ldb.d_sc_task_from_state a111 
	on (a11.from_state_key = a111.row_key)  
union
select 'ldb.d_sc_task_priority a112 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_task_state_activity a11 
 join ldb.d_sc_task_priority a112 
	on (a11.priority_src_key = a112.row_key)  
union
select 'ldb.d_sc_task_state a113 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_task_state_activity a11 
 join ldb.d_sc_task_state a113 
	on (a11.current_request_task_state_key = a113.row_key)  
union
select 'ldb.d_sc_task_to_state a114 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_task_state_activity a11 
 join ldb.d_sc_task_to_state a114 
	on (a11.to_state_key = a114.row_key)  
union
select 'ldb.d_sc_task_upon_approval a115 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_task_state_activity a11 
 join ldb.d_sc_task_upon_approval a115 
	on (a11.upon_approval_src_key = a115.row_key)  

