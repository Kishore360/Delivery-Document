select'ldb.f_request_task' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task       a11 
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task       a11 
join ldb.d_calendar_date       a12
on (a11.opened_on_key = a12.row_key)
union
select'ldb.d_sc_task_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task       a11 
join ldb.d_sc_task_state       a13
on (a11.state_src_key = a13.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task       a11 
join ldb.d_internal_organization_group       a14
on (a11.assignment_group_key = a14.row_key)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task       a11 
join ldb.d_internal_contact_assigned_to       a15
on (a11.assigned_to_key = a15.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task       a11 
 join ldb.d_calendar_date       a12
on (a11.opened_on_key = a12.row_key)
join ldb.d_calendar_month       a16
on (a12.month_start_date_key = a16.row_key)
union
select'ldb.d_assignment_group_manager_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task       a11 
 join ldb.d_internal_organization_group       a14
on (a11.assignment_group_key = a14.row_key)
join ldb.d_assignment_group_manager_c       a17
on (a14.manager_c_key = a17.manager_c_key)

