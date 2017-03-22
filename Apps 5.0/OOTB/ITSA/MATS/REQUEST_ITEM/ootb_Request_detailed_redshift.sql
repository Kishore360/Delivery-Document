 select'f_request' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request             a11 
 union
 select'd_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request             a11 
join ldb.d_calendar_date         a12
on (a11.opened_on_key = a12.row_key)
union
select'd_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request             a11 
join ldb.d_calendar_date         a12
on (a11.opened_on_key = a12.row_key)
join ldb.d_calendar_month         a13
on (a12.month_start_date_key = a13.row_key)
union
 select'd_calendar_time' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request             a11 
join ldb.d_calendar_time         a14
on (a11.opened_time_key = a14.row_key)
union
select'd_calendar_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request             a11 
join ldb.d_calendar_date         a12
on (a11.opened_on_key = a12.row_key)
join ldb.d_calendar_year         a15
on (a12.year_start_date_key = a15.row_key)
union
select'd_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request             a11 
join ldb.d_configuration_item         a16
on (a11.configuration_item_key = a16.row_key)
union
select'd_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request             a11 
join ldb.d_internal_contact         a17
on (a11.opened_by_key = a17.row_key)
union
select'd_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request             a11 
join ldb.d_internal_contact         a17
on (a11.opened_by_key = a17.row_key)
join ldb.d_internal_contact_mdm         a18
on (a17.row_current_key = a18.row_current_key) 
union
select'd_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request             a11 
join ldb.d_internal_organization_group         a19
on (a11.assignment_group_key = a19.row_key)
union
select'd_location' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request             a11 
join ldb.d_location         a110
on (a11.location_key = a110.row_key)
union
select'd_request' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request             a11 
join ldb.d_request         a111
on (a11.request_key = a111.row_key)
union
/*there is cross join in 1 pass sql
select'd_task_contacttype' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request             a11 
 join ldb.d_internal_contact         a17
on (a11.opened_by_key = a17.row_key)
join ldb.d_internal_contact         a18
on (a17.row_current_key = a18.row_current_key)
 join ldb.d_task_contacttype         a112
on (a18.reported_type_src_key = a112.row_key)
union*/
select'd_task_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request             a11
 join ldb.d_sc_request_priority         a113
on (a11.priority_src_key = a113.row_key)
union
select'd_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request             a11 
join ldb.d_internal_contact         a114
on (a11.assigned_to_key = a114.row_key)
