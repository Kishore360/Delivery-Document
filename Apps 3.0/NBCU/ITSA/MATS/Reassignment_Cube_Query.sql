select'ldb.f_t_task_activity_reassignment_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_t_task_activity_reassignment_c             a11 
union
select'ldb.d_task_ra_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_t_task_activity_reassignment_c             a11 
join ldb.d_task_ra_c         a12
on (a11.task_row_key=a12.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_t_task_activity_reassignment_c             a11 
join ldb.d_calendar_date         a13
on (a11.assigned_on_key=a13.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_t_task_activity_reassignment_c             a11 
join ldb.d_internal_organization_group         a14
on (a11.current_assginment_group_key=a14.row_key)
union
select'ldb.d_task_ra_state_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_t_task_activity_reassignment_c             a11 
join ldb.d_task_ra_state_c         a15
on (a11.state_src_key=a15.row_key)
union
select'ldb.d_internal_contact_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_t_task_activity_reassignment_c             a11 
join ldb.d_internal_contact_to         a16
on (a11.to_assigned_to_key=a16.row_key)
union
select'ldb.d_internal_organization_group_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_t_task_activity_reassignment_c             a11 
join ldb.d_internal_organization_group_to         a17
on (a11.to_assignment_group_key=a17.row_key)
union
select'ldb.d_internal_contact_from' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_t_task_activity_reassignment_c             a11 
join ldb.d_internal_contact_from         a18
on (a11.from_assigned_to_key=a18.row_key)
union
select'ldb.d_internal_organization_group_from' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_t_task_activity_reassignment_c             a11 
join ldb.d_internal_organization_group_from         a19
on (a11.from_assignment_group_key=a19.row_key)
union
select'ldb.d_task_ra_priority_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_t_task_activity_reassignment_c             a11 
join ldb.d_task_ra_priority_c         a110
on (a11.priority_src_key=a110.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_t_task_activity_reassignment_c             a11 
 join ldb.d_calendar_date         a13
on (a11.assigned_on_key=a13.row_key)
join ldb.d_calendar_month         a111
on (a13.month_start_date_key=a111.row_key)

