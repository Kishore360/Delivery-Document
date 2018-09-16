select 'ldb.f_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident  a11 
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident  a11 
join ldb.d_internal_contact  a12
on (a11.employee_key=a12.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident  a11 
join ldb.d_internal_organization_group  a13
on (a11.assignment_group_key=a13.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident  a11 
join ldb.d_calendar_date  a14
on (a11.date_key=a14.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident  a11 
 join ldb.d_internal_contact  a12
on (a11.employee_key=a12.row_key)
join ldb.d_internal_contact_mdm  a15
on (a12.employee_mdm_key=a15.row_key)
union
select'ldb.d_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident  a11 
join ldb.d_incident  a16
on (a11.incident_key=a16.row_key)
union
select'ldb.d_incident_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident  a11 
 join ldb.d_incident  a16
on (a11.incident_key=a16.row_key)
join ldb.d_incident_priority  a17
on (a16.priority_src_key=a17.row_key)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident  a11 
join ldb.d_internal_contact_assigned_to  a18
on (a11.assigned_to_key=a18.row_key)
union
select'ldb.d_incident_contacttype' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident  a11 
join ldb.d_incident_contacttype  a19
on (a11.reported_type_src_key=a19.row_key)
union
select'ldb.d_employee_location' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident  a11 
  join ldb.d_internal_contact  a12
on (a11.employee_key=a12.row_key)
join ldb.d_internal_contact_mdm  a15
on (a12.employee_mdm_key=a15.row_key)
join ldb.d_employee_location  a110
on (a15.location_key=a110.row_key)
union
select'ldb.d_incident_category' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident  a11 
 join ldb.d_incident  a16
on (a11.incident_key=a16.row_key)
join ldb.d_incident_category  a111
on (a16.category_src_key=a111.row_key)
union
select'ldb.d_task_sla_resolution_flag' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident  a11 
  join ldb.d_incident  a16
on (a11.incident_key=a16.row_key)
join ldb.d_task_sla_resolution_flag  a112
on (a16.met_resolution_sla_flag_key=a112.row_key)
union
select'ldb.d_task_sla_response_flag' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident  a11 
   join ldb.d_incident  a16
on (a11.incident_key=a16.row_key)
join ldb.d_task_sla_response_flag  a113
on (a16.met_response_sla_flag_key=a113.row_key)
union
select'ldb.d_incident_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident  a11 
    join ldb.d_incident  a16
on (a11.incident_key=a16.row_key)
join ldb.d_incident_state  a114
on (a16.state_src_key=a114.row_key)
union
select'ldb.d_incident_subcategory' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident  a11 
     join ldb.d_incident  a16
on (a11.incident_key=a16.row_key)
join ldb.d_incident_subcategory  a115
on (a16.sub_category_src_key=a115.row_key);


