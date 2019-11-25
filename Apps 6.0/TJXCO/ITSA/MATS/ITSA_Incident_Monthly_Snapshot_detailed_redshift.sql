select 'ldb.n_incident_monthly' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.n_incident_monthly  a11 
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.n_incident_monthly  a11 
join ldb.d_calendar_date  a12
on (a11.date_key=a12.row_key)
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.n_incident_monthly  a11 
join ldb.d_internal_contact  a13
on (a11.employee_key=a13.row_key)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.n_incident_monthly  a11 
join ldb.d_internal_contact_assigned_to  a14
on (a11.assigned_to_key=a14.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.n_incident_monthly  a11 
join ldb.d_internal_organization_group  a15
on (a11.assignment_group_key=a15.row_key)
union
select'ldb.d_business_service' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.n_incident_monthly  a11 
join ldb.d_business_service  a16
on (a11.business_service_key=a16.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.n_incident_monthly  a11 
 join ldb.d_calendar_date  a12
on (a11.date_key=a12.row_key)
join ldb.d_calendar_month  a17
on (a12.month_start_date_key=a17.row_key)
union
select'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.n_incident_monthly  a11 
join ldb.d_configuration_item  a18
on (a11.configuration_item_key=a18.row_key)
union
select'ldb.d_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.n_incident_monthly  a11 
 join ldb.d_internal_contact  a13
on (a11.employee_key=a13.row_key)
join ldb.d_internal_organization_department  a19
on (a11.opened_by_department_key=a19.row_key and a13.department_key=a19.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.n_incident_monthly  a11 
 join ldb.d_internal_contact  a13
on (a11.employee_key=a13.row_key)
join ldb.d_internal_contact_mdm  a110
on (a13.employee_mdm_key=a110.row_key)
union
select'ldb.d_incident_category' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.n_incident_monthly  a11 
join ldb.d_incident_category  a111
on (a11.category_src_key=a111.row_key)
union
select'ldb.d_incident_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.n_incident_monthly  a11 
join ldb.d_incident_priority  a112
on (a11.priority_src_key=a112.row_key)
union
select'ldb.d_incident_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.n_incident_monthly  a11 
join ldb.d_incident_state  a113
on (a11.state_src_key=a113.row_key);
