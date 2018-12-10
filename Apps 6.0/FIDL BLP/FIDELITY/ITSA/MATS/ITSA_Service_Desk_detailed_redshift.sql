select 'ldb.f_call' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call       a11 
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call       a11 
join ldb.d_internal_contact       a12
on (a11.employee_key=a12.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call       a11 
join ldb.d_calendar_date       a13
on (a11.date_key=a13.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call       a11 
 join ldb.d_calendar_date       a13
on (a11.date_key=a13.row_key)
join ldb.d_calendar_month       a14
on (a13.month_start_date_key=a14.row_key)
union
select'ldb.d_calendar_quarter' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call       a11 
  join ldb.d_calendar_date       a13
on (a11.date_key=a13.row_key)
join ldb.d_calendar_month       a14
on (a13.month_start_date_key=a14.row_key)
join ldb.d_calendar_quarter       a15
on (a14.quarter_start_date_key=a15.row_key)
union
select'ldb.d_call' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call       a11 
join ldb.d_call       a16
on (a11.call_key=a16.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call       a11 
 join ldb.d_internal_contact       a12
on (a11.employee_key=a12.row_key)
join ldb.d_internal_contact_mdm       a17
on (a12.employee_mdm_key=a17.row_key)
union
select'ldb.d_task' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call       a11 
join ldb.d_task       a18
on (a11.task_key=a18.row_key)
union
select'ldb.d_call_reported_type' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call       a11 
join ldb.d_call_reported_type       a19
on (a11.reported_type_src_key=a19.row_key)
union
select'ldb.d_internal_contact_caller' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call       a11 
join ldb.d_internal_contact_caller       a110
on (a11.caller_key=a110.row_key)
union
select'ldb.d_internal_organization_legalentity' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call       a11 
join ldb.d_internal_organization_legalentity       a111
on (a11.company_key=a111.row_key)
union
select'ldb.d_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call       a11 
join ldb.d_internal_organization_department       a112
on (a11.department_key=a112.row_key)
union
select'ldb.d_domain' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call       a11 
join ldb.d_domain       a113
on (a11.domain_key=a113.row_key)
union
select'ldb.d_master_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call       a11 
join ldb.d_master_item       a114
on (a11.master_item_key=a114.row_key)
union
select'ldb.d_location' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call       a11 
join ldb.d_location       a115
on (a11.location_key=a115.row_key)
union
select'ldb.d_calendar_week' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call       a11 
join ldb.d_calendar_date       a13
on (a11.date_key=a13.row_key)
join ldb.d_calendar_week       a116
on (a13.week_start_date_key=a116.row_key)
union
select'ldb.d_employee_location' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call       a11 
  join ldb.d_internal_contact       a12
on (a11.employee_key=a12.row_key)
join ldb.d_internal_contact_mdm       a17
on (a12.employee_mdm_key=a17.row_key)
join ldb.d_employee_location       a117
on (a17.location_key=a117.row_key)
union
select'ldb.d_task_type' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call       a11 
 join ldb.d_task       a18
on (a11.task_key=a18.row_key)
join ldb.d_task_type       a118
on (a18.task_type_src_key=a118.row_key)
union
select'ldb.d_calendar_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call       a11 
   join ldb.d_calendar_date       a13
on (a11.date_key=a13.row_key)
join ldb.d_calendar_month       a14
on (a13.month_start_date_key=a14.row_key)
join ldb.d_calendar_quarter       a15
on (a14.quarter_start_date_key=a15.row_key)
join ldb.d_calendar_year       a119
on (a15.year_start_date_key=a119.row_key);


