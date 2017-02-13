select 'ldb.f_incident_closed' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
union
select'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
join ldb.d_configuration_item       a12
on (a11.configuration_item_key=a12.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
join ldb.d_calendar_date       a13
on (a11.closed_on_key=a13.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
join ldb.d_internal_organization_group       a14
on (a11.assignment_group_key=a14.row_key)
union
select'ldb.d_internal_contact_emp_seniors_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
 join ldb.d_internal_organization_group       a14
on (a11.assignment_group_key=a14.row_key)
join ldb.d_internal_contact_emp_seniors_c       a15
on (a14.manager_c_key=a15.row_key)
union
select'ldb.d_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
join ldb.d_incident       a16
on (a11.incident_key=a16.row_key)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
join ldb.d_internal_contact_assigned_to       a17
on (a11.assigned_to_key=a17.row_key)
union
select'ldb.d_config_item_cah_bus_segment_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
 join ldb.d_configuration_item       a12
on (a11.configuration_item_key=a12.row_key)
join ldb.d_config_item_cah_bus_segment_c       a18
on (a12.cah_bus_segment_src_code_c_key=a18.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
 join ldb.d_calendar_date       a13
on (a11.closed_on_key=a13.row_key)
join ldb.d_calendar_month       a19
on (a13.month_start_date_key=a19.row_key)


