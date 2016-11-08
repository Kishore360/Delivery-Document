
select'ldb.f_change_task_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_task_c       a11 
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_task_c       a11 
join ldb.d_calendar_date       a12
on (a11.opened_on_key = a12.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_task_c       a11 
join ldb.d_internal_organization_group       a13
on (a11.assignment_group_key = a13.row_key)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_task_c       a11 
join ldb.d_internal_contact_assigned_to       a14
on (a11.assigned_to_key = a14.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_task_c       a11 
 join ldb.d_calendar_date       a12
on (a11.opened_on_key = a12.row_key)
join ldb.d_calendar_month       a15
on (a12.month_start_date_key = a15.row_key)
union
select'ldb.d_assignment_group_manager_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_task_c       a11 
 join ldb.d_internal_organization_group       a13
on (a11.assignment_group_key = a13.row_key)
join ldb.d_assignment_group_manager_c       a16
on (a13.manager_c_key = a16.manager_c_key)

