select 'ldb.f_problem_keyword a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem_keyword a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem_keyword a11 
 join ldb.d_internal_contact a12 
 on (a11.employee_key = a12.row_key)  
union
select 'ldb.d_calendar_time a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem_keyword a11 
 join ldb.d_calendar_time a13 
 on (a11.time_key = a13.row_key)  
union
select 'ldb.d_internal_contact_assigned_to a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem_keyword a11 
 join ldb.d_internal_contact_assigned_to a14 
 on (a11.assigned_to_key = a14.row_key)  
union
select 'ldb.d_internal_organization_group a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem_keyword a11 
 join ldb.d_internal_organization_group a15 
 on (a11.assignment_group_key = a15.row_key)  
union
select 'ldb.d_calendar_date a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem_keyword a11 
 join ldb.d_calendar_date a16 
 on (a11.date_key = a16.row_key)  
union
select 'ldb.d_problem a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem_keyword a11 
 join ldb.d_problem a17 
 on (a11.problem_key = a17.row_key)  
union
select 'ldb.d_configuration_item a18 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem_keyword a11 
 join ldb.d_configuration_item a18 
 on (a11.configuration_item_key = a18.row_key)  
union
select 'ldb.d_internal_contact_mdm a19 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem_keyword a11 
 join ldb.d_internal_contact a12 
 on (a11.employee_key = a12.row_key) 
 join ldb.d_internal_contact_mdm a19 
 on (a12.employee_mdm_key = a19.row_key)  
union
select 'ldb.d_calendar_time_hour a110 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem_keyword a11 
 join ldb.d_calendar_time a13 
 on (a11.time_key = a13.row_key) 
 join ldb.d_calendar_time_hour a110 
 on (a13.hour_key = a110.row_key)  
union
select 'ldb.d_problem_reported_type a111 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem_keyword a11 
 join ldb.d_problem_reported_type a111 
 on (a11.problem_reported_type_src_key = a111.row_key)  
union
select 'ldb.d_problem_priority a112 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem_keyword a11 
 join ldb.d_problem_priority a112 
 on (a11.problem_priority_src_key = a112.row_key)  
union
select 'ldb.d_problem_urgency a113 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem_keyword a11 
 join ldb.d_problem_urgency a113 
 on (a11.problem_urgency_src_key = a113.row_key)  
union
select 'ldb.d_calendar_month a114 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem_keyword a11 
 join ldb.d_calendar_date a16 
 on (a11.date_key = a16.row_key) 
 join ldb.d_calendar_month a114 
 on (a16.month_start_date_key = a114.row_key)  
union
select 'ldb.d_problem_state a115 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem_keyword a11 
 join ldb.d_problem_state a115 
 on (a11.problem_state_src_key = a115.row_key)  

