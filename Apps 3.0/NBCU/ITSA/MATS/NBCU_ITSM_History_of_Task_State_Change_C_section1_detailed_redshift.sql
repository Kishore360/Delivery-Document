select'ldb.f_task_state_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_state_c             a11 
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_state_c             a11 
join ldb.d_internal_organization_group         a12
on (a11.assignment_group_key=a12.row_key)
union
select'ldb.d_task_ra_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_state_c             a11 
join ldb.d_task_ra_c         a14
on (a11.task_key=a14.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_state_c             a11 
join ldb.d_calendar_date         a15
on (a11.opened_on_key=a15.row_key)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_state_c             a11 
join ldb.d_internal_contact_assigned_to         a16
on (a11.assigned_to_key=a16.row_key)
union
select'ldb.d_task_state_to_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_state_c             a11 
join ldb.d_task_state_to_c         a17
on (a11.to_state_src_key=a17.row_key)
union
select'ldb.d_task_state_from_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_state_c             a11 
join ldb.d_task_state_from_c         a18
on (a11.from_state_src_key=a18.row_key)
union
select'ldb.d_task_priority_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_state_c             a11 
join ldb.d_task_priority_c         a19
on (a11.priority_src_key=a19.row_key)
union
select'ldb.d_task_state_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_state_c             a11 
join ldb.d_task_state_c         a110
on (a11.state_src_key=a110.row_key)
union
select'ldb.d_task_parent_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_state_c             a11 
 join ldb.d_task_ra_c         a14
on (a11.task_key=a14.row_key)
join ldb.d_task_parent_c         a112
on (a14.parent_task_key=a112.row_key)