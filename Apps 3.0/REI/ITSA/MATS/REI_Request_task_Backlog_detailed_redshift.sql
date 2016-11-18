select'ldb.f_request_task' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task             a11 
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task             a11 
join ldb.d_calendar_date         a12
on (a11.opened_on_key=a12.row_key)
union
select'ldb.d_request_item_variable_requested_completion_date_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task             a11 
join ldb.d_request_item_variable_requested_completion_date_c         a13
on (a11.request_item_key=a13.row_key)
union
select'ldb.d_master_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task             a11 
join ldb.d_master_item         a14
on (a11.catalog_item_key=a14.row_key)
union
select'ldb.d_request_task' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task             a11 
join ldb.d_request_task         a15
on (a11.request_task_key=a15.row_key)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task             a11 
join ldb.d_internal_contact_assigned_to         a16
on (a11.assigned_to_key=a16.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task             a11 
join ldb.d_internal_organization_group         a17
on (a11.assignment_group_key=a17.row_key)
union
select'ldb.d_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task             a11 
join ldb.d_internal_organization_department         a18
on (a11.opened_by_department_key=a18.row_key)
union
select'ldb.d_request_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task             a11 
join ldb.d_request_item         a19
on (a11.request_item_key=a19.row_key)
union
select'ldb.d_sc_task_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task             a11 
join ldb.d_sc_task_priority         a110
on (a11.priority_src_key=a110.row_key)
union
select'ldb.d_sc_task_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task             a11 
join ldb.d_sc_task_state         a111
on (a11.state_src_key=a111.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task             a11
join ldb.d_calendar_date         a12
on (a11.opened_on_key=a12.row_key) 
join ldb.d_calendar_month         a112
on (a12.month_start_date_key=a112.row_key)