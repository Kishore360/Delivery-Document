select 'ldb.f_problem_state_activity a11 ' as Table_name, count(a11.problem_key) Row_Count
 from ldb.f_problem_state_activity a11 
union
select 'ldb.d_internal_contact_assigned_to a12 ' as Table_name, count(a11.problem_key) Row_Count
 from ldb.f_problem_state_activity a11 
 join ldb.d_internal_contact_assigned_to a12 
	on (a11.assigned_to_key = a12.row_key)  
union
select 'ldb.d_internal_organization_group a13 ' as Table_name, count(a11.problem_key) Row_Count
 from ldb.f_problem_state_activity a11 
 join ldb.d_internal_organization_group a13 
	on (a11.assignment_group_key = a13.row_key)  
union
select 'ldb.d_change_request a14 ' as Table_name, count(a11.problem_key) Row_Count
 from ldb.f_problem_state_activity a11 
 join ldb.d_change_request a14 
	on (a11.change_request_key = a14.row_key)  
union
select 'ldb.d_problem a15 ' as Table_name, count(a11.problem_key) Row_Count
 from ldb.f_problem_state_activity a11 
 join ldb.d_problem a15 
	on (a11.problem_key = a15.row_key)  
union
select 'ldb.d_configuration_item a16 ' as Table_name, count(a11.problem_key) Row_Count
 from ldb.f_problem_state_activity a11 
 join ldb.d_configuration_item a16 
	on (a11.configuration_item_key = a16.row_key)  
union
select 'ldb.d_problem_from_state a17 ' as Table_name, count(a11.problem_key) Row_Count
 from ldb.f_problem_state_activity a11 
 join ldb.d_problem_from_state a17 
	on (a11.from_state_key = a17.row_key)  
union
select 'ldb.d_problem_impact a18 ' as Table_name, count(a11.problem_key) Row_Count
 from ldb.f_problem_state_activity a11 
 join ldb.d_problem_impact a18 
	on (a11.impact_src_key = a18.row_key)  
union
select 'ldb.d_problem_priority a19 ' as Table_name, count(a11.problem_key) Row_Count
 from ldb.f_problem_state_activity a11 
 join ldb.d_problem_priority a19 
	on (a11.priority_src_key = a19.row_key)  
union
select 'ldb.d_problem_to_state a110 ' as Table_name, count(a11.problem_key) Row_Count
 from ldb.f_problem_state_activity a11 
 join ldb.d_problem_to_state a110 
	on (a11.to_state_key = a110.row_key)  
union
select 'ldb.d_problem_urgency a111 ' as Table_name, count(a11.problem_key) Row_Count
 from ldb.f_problem_state_activity a11 
 join ldb.d_problem_urgency a111 
	on (a11.urgency_src_key = a111.row_key)  
union
select 'ldb.d_problem_state a112 ' as Table_name, count(a11.problem_key) Row_Count
 from ldb.f_problem_state_activity a11 
 join ldb.d_problem_state a112 
	on (a11.current_problem_state_key = a112.row_key) 

