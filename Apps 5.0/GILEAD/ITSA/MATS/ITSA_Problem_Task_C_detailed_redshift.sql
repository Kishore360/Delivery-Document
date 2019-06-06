select 'ldb.f_problem_task a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem_task a11 
union
select 'ldb.d_problem_task a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem_task a11 
 join ldb.d_problem_task a12 
	on (a11.problem_task_key = a12.row_key)  
union
select 'ldb.d_problem a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem_task a11 
 join ldb.d_problem a13 
	on (a11.problem_key = a13.row_key)  
union
select 'ldb.d_internal_contact_assigned_to a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem_task a11 
 join ldb.d_internal_contact_assigned_to a14 
	on (a11.assigned_to_key = a14.row_key)  
union
select 'ldb.d_internal_organization_group a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem_task a11 
 join ldb.d_internal_organization_group a15 
	on (a11.assignment_group_key = a15.row_key)  
union
select 'ldb.d_internal_contact_created_by_c a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem_task a11 
 join ldb.d_internal_contact_created_by_c a16 
	on (a11.created_by_c_key = a16.row_key)  
union
select 'ldb.d_internal_contact_cust_problem_task_c a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem_task a11 
 join ldb.d_internal_contact_cust_problem_task_c a17 
	on (a11.cust_problem_task_c_key = a17.row_key)  
union
select 'ldb.d_internal_contact_opened_by_c a18 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem_task a11 
 join ldb.d_internal_contact_opened_by_c a18 
	on (a11.opened_by_key = a18.row_key)  
union
select 'ldb.d_problem_priority a19 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem_task a11 
 join ldb.d_problem_priority a19 
	on (a11.problem_priority_src_key = a19.row_key)  
union
select 'ldb.d_internal_contact_resolved_by_c a110 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem_task a11 
 join ldb.d_internal_contact_resolved_by_c a110 
	on (a11.resolved_by_c_key = a110.row_key)  
union
select 'ldb.d_lov_problem_task_closure_code_c a111 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem_task a11 
 join ldb.d_problem_task a12 
 on (a11.problem_task_key = a12.row_key) 
	join ldb.d_lov_problem_task_closure_code_c a111 
	on (a12.closure_code_src_c_key = a111.row_key)  
union
select 'ldb.d_lov_problem_task_deferred_reason_c a112 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem_task a11 
 join ldb.d_problem_task a12 
 on (a11.problem_task_key = a12.row_key) 
	join ldb.d_lov_problem_task_deferred_reason_c a112 
	on (a12.deferred_reason_src_c_key = a112.row_key)  
union
select 'ldb.d_problem_state a113 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem_task a11 
 join ldb.d_problem_state a113 
	on (a11.state_src_key = a113.row_key)  
union
select 'ldb.d_problem_task_priority a114 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem_task a11 
 join ldb.d_problem_task_priority a114 
	on (a11.priority_src_key = a114.row_key)  
union
select 'ldb.d_problem_task_reported_type a115 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem_task a11 
 join ldb.d_problem_task_reported_type a115 
	on (a11.reported_type_src_key = a115.row_key)  
union
select 'ldb.d_problem_task_state a116 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem_task a11 
 join ldb.d_problem_task_state a116 
	on (a11.state_src_key = a116.row_key)  
union
select 'ldb.d_lov_problem_task_pt_type_c a117 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem_task a11 
 join ldb.d_problem_task a12 
 on (a11.problem_task_key = a12.row_key) 
	join ldb.d_lov_problem_task_pt_type_c a117 
	on (a12.problem_task_type_src_c_key = a117.row_key)  
union
select 'ldb.d_problem_task_urgency a118 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem_task a11 
 join ldb.d_problem_task_urgency a118 
	on (a11.urgency_src_key = a118.row_key)  
union
select 'ldb.d_lov_problem_task_sparc_stage_c a119 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem_task a11 
 join ldb.d_problem_task a12 
 on (a11.problem_task_key = a12.row_key) 
	join ldb.d_lov_problem_task_sparc_stage_c a119 
	on (a12.sparc_stage_src_c_key = a119.row_key)  
union
select 'ldb.d_lov_problem_task_task_function_c a120 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem_task a11 
 join ldb.d_problem_task a12 
 on (a11.problem_task_key = a12.row_key) 
	join ldb.d_lov_problem_task_task_function_c a120 
	on (a12.task_function_src_c_key = a120.row_key) 

