 select'f_request_task' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task             a11 
 union
 select'd_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task             a11 
join ldb.d_calendar_date         a12
on (a11.opened_on_key = a12.row_key)
union
select'd_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task             a11 
join ldb.d_calendar_date         a12
on (a11.opened_on_key = a12.row_key)
join ldb.d_calendar_month         a13
on (a12.month_start_date_key = a13.row_key)
union
 select'd_request_task' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task             a11 
join ldb.d_request_task         a12
on (a11.request_task_key = a12.row_key)
union
 select'd_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task             a11 
join ldb.d_internal_contact         a12
on (a11.assigned_to_key = a12.row_key)
union
 select'd_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task             a11 
join ldb.d_internal_organization_group         a12
on (a11.assignment_group_key = a12.row_key)
union
 select'd_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task             a11 
join ldb.d_internal_organization_department         a12
on (a11.opened_by_department_key = a12.row_key)
union
select'd_request_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task             a11 
join ldb.d_request_item         a12
on (a11.request_item_key = a12.row_key)
union
 select'd_task_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task             a11 
join ldb.d_task_priority         a12
on (a11.priority_src_key = a12.row_key)
union
 select'd_task_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task             a11 
join ldb.d_task_state         a12
on (a11.state_src_key = a12.row_key)




