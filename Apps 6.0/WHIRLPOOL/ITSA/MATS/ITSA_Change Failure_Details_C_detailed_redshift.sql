select 'ldb.f_task_assignment_group_details_c a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_task_assignment_group_details_c a11 
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_task_assignment_group_details_c a11 
 join ldb.d_calendar_date a12 
	on (a11.day_key = a12.row_key)  
union
select 'ldb.d_calendar_week a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_task_assignment_group_details_c a11 
 join ldb.d_calendar_date a12 
 on (a11.day_key = a12.row_key) 
	join ldb.d_calendar_week a13 
	on (a12.week_start_date_key = a13.row_key)  
union
select 'ldb.d_internal_contact_assigned_to a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_task_assignment_group_details_c a11 
 join ldb.d_internal_contact_assigned_to a14 
	on (a11.assigned_to_key = a14.row_key)  
union
select 'ldb.d_change_request_caused_by a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_task_assignment_group_details_c a11 
 join ldb.d_change_request_caused_by a15 
	on (a11.caused_by_change_key = a15.row_key)  
union
select 'ldb.d_change_request a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_task_assignment_group_details_c a11 
 join ldb.d_change_request a16 
	on (a11.change_request_key = a16.row_key)  
union
select 'ldb.d_problem a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_task_assignment_group_details_c a11 
 join ldb.d_problem a17 
	on (a11.problem_key = a17.row_key) 