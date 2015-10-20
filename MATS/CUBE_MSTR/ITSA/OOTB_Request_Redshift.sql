SELECT CASE WHEN max_count<>min_count THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN  max_count<>min_count THEN 'OOTB has Keys Dropped' ELSE 'SUCCESS'  END as Message FROM (
 select max(Row_Count) max_count,Min(Row_Count) min_count from (
select'ldb.f_request' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request             a11 
union
select'ldb.d_location' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request             a11 
join ldb.d_location         a12
on (a11.location_key = a12.row_key)
union
select'ldb.d_request' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request             a11 
join ldb.d_request         a13
on (a11.request_key = a13.row_key)
union
select'ldb.d_task_contacttype' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request             a11 
cross join ldb.d_task_contacttype         a14
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request             a11 
join ldb.d_internal_contact         a15
on (a11.opened_by_key = a15.row_key)
union
select'ldb.d_calendar_time' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request             a11 
join ldb.d_calendar_time         a16
on (a11.opened_time_key = a16.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request             a11 
join ldb.d_calendar_date         a17
on (a11.opened_on_key = a17.row_key)
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request             a11 
join ldb.d_internal_contact         a18
on (a11.assigned_to_key = a18.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request             a11 
join ldb.d_internal_organization_group         a19
on (a11.assignment_group_key = a19.row_key)
union
select'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request             a11 
join ldb.d_configuration_item         a110
on (a11.configuration_item_key = a110.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request             a11 
 join ldb.d_internal_contact         a15
on (a11.opened_by_key = a15.row_key)
join ldb.d_internal_contact_mdm         a111
on (a15.row_current_key = a111.row_current_key)
union
select'ldb.d_task_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request             a11 
join ldb.d_task_priority         a112
on (a11.priority_src_key = a112.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request             a11 
 join ldb.d_calendar_date         a17
on (a11.opened_on_key = a17.row_key)
join ldb.d_calendar_month         a113
on (a17.month_start_date_key = a113.row_key)
union
select'ldb.d_calendar_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request             a11
 join ldb.d_calendar_date         a17
on (a11.opened_on_key = a17.row_key)
join ldb.d_calendar_year         a114
on (a17.year_start_date_key = a114.row_key)
)a
)b

