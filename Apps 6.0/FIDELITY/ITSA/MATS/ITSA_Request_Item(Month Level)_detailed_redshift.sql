select 'ldb.f_request_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
join ldb.d_calendar_date       a12
on (a11.date_key=a12.row_key)
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
join ldb.d_internal_contact       a13
on (a11.employee_key=a13.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
join ldb.d_internal_organization_group       a14
on (a11.assignment_group_key=a14.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
 join ldb.d_calendar_date       a12
on (a11.date_key=a12.row_key)
join ldb.d_calendar_month       a15
on (a12.month_start_date_key=a15.row_key)
union
select'ldb.d_calendar_quarter' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
  join ldb.d_calendar_date       a12
on (a11.date_key=a12.row_key)
join ldb.d_calendar_month       a15
on (a12.month_start_date_key=a15.row_key)
join ldb.d_calendar_quarter       a16
on (a15.quarter_start_date_key=a16.row_key)
union
select'ldb.d_master_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
join ldb.d_master_item       a17
on (a11.catalog_item_key=a17.row_key)
union
select'ldb.d_request_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
join ldb.d_request_item       a18
on (a11.request_item_key=a18.row_key)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
join ldb.d_internal_contact_assigned_to       a19
on (a11.assigned_to_key=a19.row_key)
union
select'ldb.d_calendar_week' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
 join ldb.d_calendar_date       a12
on (a11.date_key=a12.row_key)
join ldb.d_calendar_week       a110
on (a12.week_start_date_key=a110.row_key)
union
select'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
join ldb.d_configuration_item       a111
on (a11.configuration_item_key=a111.row_key)
union
select'ldb.d_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
 join ldb.d_internal_contact       a13
on (a11.employee_key=a13.row_key)
join ldb.d_internal_organization_department       a112
on (a13.department_key=a112.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
  join ldb.d_internal_contact       a13
on (a11.employee_key=a13.row_key)
join ldb.d_internal_contact_mdm       a113
on (a13.employee_mdm_key=a113.row_key)
union
select'ldb.d_request' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
join ldb.d_request       a114
on (a11.request_key=a114.row_key)
union
select'ldb.d_sc_req_item_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
join ldb.d_sc_req_item_priority       a115
on (a11.priority_src_key=a115.row_key)
union
select'ldb.d_request_item_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
join ldb.d_request_item_state       a116
on (a11.state_src_key=a116.row_key)
union
select'ldb.d_calendar_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item       a11 
   join ldb.d_calendar_date       a12
on (a11.date_key=a12.row_key)
join ldb.d_calendar_month       a15
on (a12.month_start_date_key=a15.row_key)
join ldb.d_calendar_quarter       a16
on (a15.quarter_start_date_key=a16.row_key)
join ldb.d_calendar_year       a117
on (a16.year_start_date_key=a117.row_key);


