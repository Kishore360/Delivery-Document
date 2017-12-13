select 'ldb.f_incident_keyword' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword       a11 
union
select'ldb.d_calendar_time' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword       a11 
join ldb.d_calendar_time       a12
on (a11.opened_time_key = a12.row_key)
union
select'ldb.dh_assignment_group_tier_hierarchy' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword       a11 
join ldb.dh_assignment_group_tier_hierarchy       a13
on (a11.assignment_group_key = a13.user_group_tier_key)
union
select'ldb.dh_assignment_group_type_hierarchy' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword       a11 
join ldb.dh_assignment_group_type_hierarchy       a14
on (a11.assignment_group_key = a14.user_group_type_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword       a11 
join ldb.d_calendar_date       a15
on (a11.opened_on_key = a15.row_key)
union
select'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword       a11 
join ldb.d_configuration_item       a16
on (a11.configuration_item_key = a16.row_key)
union
select'ldb.d_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword       a11 
join ldb.d_incident       a17
on (a11.table_row_key = a17.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword       a11 
join ldb.d_internal_organization_group       a18
on (a11.assignment_group_key = a18.row_key)
union
select'ldb.d_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword       a11 
join ldb.d_internal_organization_department       a19
on (a11.opened_by_department_key = a19.row_key)
union
select'ldb.d_calendar_time_hour' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword       a11 
 join ldb.d_calendar_time       a12
on (a11.opened_time_key = a12.row_key)
join ldb.d_calendar_time_hour       a110
on (a12.hour_24_format_num = a110.hour_24_format_num)
union
select'ldb.d_location' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword       a11 
join ldb.d_location       a111
on (a11.location_key = a111.row_key)
union
select'ldb.d_task_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword       a11 
join ldb.d_task_priority       a112
on (a11.priority_src_key = a112.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword       a11 
 join ldb.d_calendar_date       a15
on (a11.opened_on_key = a15.row_key)
join ldb.d_calendar_month       a113
on (a15.month_start_date_key = a113.row_key)


