select 'ldb.f_incident_keyword' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword       a11 
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword       a11 
join ldb.d_internal_contact       a12
on (a11.opened_by_key=a12.row_key)
union
select'ldb.d_calendar_time' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword       a11 
join ldb.d_calendar_time       a13
on (a11.opened_time_key=a13.row_key)
union
select'ldb.dh_assignment_group_tier_hierarchy' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword       a11 
join ldb.dh_assignment_group_tier_hierarchy       a14
on (a11.assignment_group_key=a14.user_group_tier_key)
union
select'ldb.dh_assignment_group_type_hierarchy' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword       a11 
join ldb.dh_assignment_group_type_hierarchy       a15
on (a11.assignment_group_key=a15.user_group_type_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword       a11 
join ldb.d_calendar_date       a16
on (a11.opened_on_key=a16.row_key)
union
select'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword       a11 
join ldb.d_configuration_item       a17
on (a11.configuration_item_key=a17.row_key)
union
select'ldb.d_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword       a11 
join ldb.d_incident       a18
on (a11.table_row_key=a18.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword       a11 
join ldb.d_internal_organization_group       a19
on (a11.assignment_group_key=a19.row_key)
union
select'ldb.d_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword       a11
 join ldb.d_internal_contact       a12
on (a11.opened_by_key=a12.row_key)
join ldb.d_internal_organization_department       a110
on (a12.department_key=a110.row_key)
union
select'ldb.d_calendar_time_hour' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword       a11
 join ldb.d_calendar_time       a13
on (a11.opened_time_key=a13.row_key)
join ldb.d_calendar_time_hour       a111
on (a13.hour_24_format_num=a111.hour_24_format_num)
union
select'ldb.d_location' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword       a11 
join ldb.d_location       a112
on (a11.location_key=a112.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword       a11
 join ldb.d_calendar_date       a16
on (a11.opened_on_key=a16.row_key)
join ldb.d_calendar_month       a113
on (a16.month_start_date_key=a113.row_key)
union
select'ldb.d_incident_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword       a11 
join ldb.d_incident_priority       a114
on (a11.priority_src_key=a114.row_key)
union
select'ldb.d_calendar_quarter' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword       a11
 join ldb.d_calendar_date       a16
on (a11.opened_on_key=a16.row_key)
join ldb.d_calendar_quarter       a115
on (a16.quarter_start_date_key=a115.row_key)
union
select'ldb.d_calendar_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword       a11
 join ldb.d_calendar_date       a16
on (a11.opened_on_key=a16.row_key)
join ldb.d_calendar_year       a116
on (a16.year_start_date_key=a116.row_key)



