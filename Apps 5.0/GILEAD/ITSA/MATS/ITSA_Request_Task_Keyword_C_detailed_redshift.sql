select 'ldb.f_request_task_c_keyword a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_task_c_keyword a11 
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_task_c_keyword a11 
 join ldb.d_calendar_date a12 
 on (a11.opened_on_key = a12.row_key)  
union
select 'ldb.d_calendar_date_closed a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_task_c_keyword a11 
 join ldb.d_calendar_date_closed a13 
 on (a11.closed_on_key = a13.row_key)  
union
select 'ldb.d_calendar_week a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_task_c_keyword a11 
 join ldb.d_calendar_date a12 
 on (a11.opened_on_key = a12.row_key) 
 join ldb.d_calendar_week a14 
 on (a12.week_start_date_key = a14.row_key)  
union
select 'ldb.d_calendar_year a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_task_c_keyword a11 
 join ldb.d_calendar_date a12 
 on (a11.opened_on_key = a12.row_key) 
 join ldb.d_calendar_year a15 
 on (a12.year_start_date_key = a15.row_key)  
union
select 'ldb.d_request_task a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_task_c_keyword a11 
 join ldb.d_request_task a16 
 on (a11.request_task_key = a16.row_key)  
union
select 'ldb.d_internal_contact_assigned_to a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_task_c_keyword a11 
 join ldb.d_internal_contact_assigned_to a17 
 on (a11.assigned_to_key = a17.row_key)  
union
select 'ldb.d_internal_organization_group a18 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_task_c_keyword a11 
 join ldb.d_internal_organization_group a18 
 on (a11.assignment_group_key = a18.row_key)  
union
select 'ldb.d_internal_organization_department a19 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_task_c_keyword a11 
 join ldb.d_internal_organization_department a19 
 on (a11.opened_by_department_key = a19.row_key)  
union
select 'ldb.d_request_item a110 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_task_c_keyword a11 
 join ldb.d_request_item a110 
 on (a11.request_item_key = a110.row_key)  
union
select 'ldb.d_sc_task_priority a111 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_task_c_keyword a11 
 join ldb.d_sc_task_priority a111 
 on (a11.priority_src_key = a111.row_key)  
union
select 'ldb.d_sc_task_state a112 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_task_c_keyword a11 
 join ldb.d_sc_task_state a112 
 on (a11.state_src_key = a112.row_key)  
union
select 'ldb.d_request_task_closure_code_c a113 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_task_c_keyword a11 
 join ldb.d_request_task a16 
 on (a11.request_task_key = a16.row_key) 
 join ldb.d_request_task_closure_code_c a113 
 on (a16.closure_code_c_key = a113.row_key)  
union
select 'ldb.d_request_task_hold_type_c a114 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_task_c_keyword a11 
 join ldb.d_request_task a16 
 on (a11.request_task_key = a16.row_key) 
 join ldb.d_request_task_hold_type_c a114 
 on (a16.hold_type_c_key = a114.row_key)  
union
select 'ldb.d_calendar_month a115 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_task_c_keyword a11 
 join ldb.d_calendar_date a12 
 on (a11.opened_on_key = a12.row_key) 
 join ldb.d_calendar_month a115 
 on (a12.month_start_date_key = a115.row_key)  
union
select 'ldb.d_calendar_month_closed a116 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_task_c_keyword a11 
 join ldb.d_calendar_date_closed a13 
 on (a11.closed_on_key = a13.row_key) 
 join ldb.d_calendar_month_closed a116 
 on (a13.month_start_date_key = a116.row_key)  
union
select 'ldb.d_calendar_quarter a117 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_task_c_keyword a11 
 join ldb.d_calendar_date a12 
 on (a11.opened_on_key = a12.row_key) 
 join ldb.d_calendar_quarter a117 
 on (a12.quarter_start_date_key = a117.row_key)  

