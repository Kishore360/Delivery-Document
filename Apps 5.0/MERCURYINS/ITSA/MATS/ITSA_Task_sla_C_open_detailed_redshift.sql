select 'ldb.f_task_sla' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_sla       a11 
union
select'ldb.d_calendar_date_created_on_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_sla       a11 
join ldb.d_calendar_date_created_on_c       a12
on (a11.created_on_c_key = a12.row_key)
union
select'ldb.d_task' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_sla       a11 
join ldb.d_task       a13
on (a11.task_key = a13.row_key)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_sla       a11 
join ldb.d_internal_contact_assigned_to       a14
on (a11.sla_assigned_to_c_key = a14.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_sla       a11 
join ldb.d_internal_organization_group       a15
on (a11.assignment_group_key = a15.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_sla       a11 
join ldb.d_calendar_date       a16
on (a11.start_on_key = a16.row_key)
union
select'ldb.d_task_sla' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_sla       a11 
join ldb.d_task_sla       a17
on (a11.sla_key = a17.row_key)
union
select'ldb.d_task_sla_stage' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_sla       a11 
join ldb.d_task_sla_stage       a18
on (a11.stage_src_key = a18.row_key)
