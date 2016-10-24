select'ldb.f_task_state_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_state_c       a11 
union
select'ldb.d_task_ra_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_state_c       a11 
join ldb.d_task_ra_c       a12
on (a11.task_key=a12.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_state_c       a11 
join ldb.d_calendar_date       a13
on (a11.opened_on_key=a13.row_key)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_state_c       a11 
join ldb.d_internal_contact_assigned_to       a14
on (a11.assigned_to_key=a14.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_state_c       a11 
join ldb.d_internal_organization_group       a15
on (a11.assignment_group_key=a15.row_key)
union
select'ldb.d_task_state_to_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_state_c       a11 
join ldb.d_task_state_to_c       a16
on (a11.to_state_src_key=a16.row_key)
union
select'ldb.d_task_state_from_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_state_c       a11 
join ldb.d_task_state_from_c       a17
on (a11.from_state_src_key=a17.row_key)
union
select'ldb.d_task_priority_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_state_c       a11 
join ldb.d_task_priority_c       a18
on (a11.priority_src_key=a18.row_key)
union
select'ldb.d_task_state_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_state_c       a11 
join ldb.d_task_state_c       a19
on (a11.state_src_key=a19.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_state_c       a11 
 join ldb.d_calendar_date       a13
on (a11.opened_on_key=a13.row_key)
join ldb.d_calendar_month       a110
on (a13.month_start_date_key=a110.row_key)

