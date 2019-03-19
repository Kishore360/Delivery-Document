select 'ldb.n_task_daily_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.n_task_daily_c  a11 
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.n_task_daily_c  a11 
join ldb.d_calendar_date  a12
on (a11.n_key=a12.row_key)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.n_task_daily_c  a11 
join ldb.d_internal_contact_assigned_to  a13
on (a11.assigned_to_key=a13.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.n_task_daily_c  a11 
join ldb.d_internal_organization_group  a14
on (a11.assignment_group_key=a14.row_key)
union
select'ldb.d_task_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.n_task_daily_c  a11 
join ldb.d_task_priority  a15
on (a11.priority_src_key=a15.row_key)
union
select'ldb.d_task_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.n_task_daily_c  a11 
join ldb.d_task_state  a16
on (a11.state_src_key=a16.row_key);
