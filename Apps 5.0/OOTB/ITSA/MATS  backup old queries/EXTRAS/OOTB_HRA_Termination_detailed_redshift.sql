 select'f_employee_termination' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_employee_termination             a11 
 union
  select'd_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_employee_termination             a11 
join ldb.d_internal_contact         a12
on (a11.employee_key = a12.row_key)
union
 select'd_calendar_date_termination' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_employee_termination             a11 
join ldb.d_calendar_date         a13
on (a11.termination_date_key = a13.row_key)
union
 select'd_calendar_date_last' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_employee_termination             a11 
join ldb.d_calendar_date         a14
on (a11.last_working_day_key = a14.row_key)
union
 select'd_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_employee_termination             a11
 join ldb.d_calendar_date         a14
on (a11.last_working_day_key = a14.row_key)
join ldb.d_calendar_month         a15
on (a14.month_start_date_key = a15.row_key)
union
 select'd_calendar_week' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_employee_termination             a11
 join ldb.d_calendar_date         a14
on (a11.last_working_day_key = a14.row_key)
join ldb.d_calendar_week         a16
on (a14.week_start_date_key = a16.row_key)
union
select'd_calendar_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_employee_termination             a11
 join ldb.d_calendar_date         a14
on (a11.last_working_day_key = a14.row_key)
join ldb.d_calendar_year         a17
on (a14.year_start_date_key = a17.row_key)
union
select'd_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_employee_termination             a11
 join ldb.d_internal_contact         a12
on (a11.employee_key = a12.row_key)
join ldb.d_internal_contact_mdm         a18
on (a12.row_current_key = a18.row_current_key)
union
select'd_employee_location' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_employee_termination             a11
  join ldb.d_internal_contact         a12
on (a11.employee_key = a12.row_key)
join ldb.d_internal_contact_mdm         a18
on (a12.row_current_key = a18.row_current_key)
join ldb.d_employee_location         a19
on (a18.location_key = a19.row_key)
union
 select'd_request_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_employee_termination             a11 
join ldb.d_request_item         a19
on (a11.request_item_key = a19.row_key)
union
 select'dh_employee_hierarchy' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_employee_termination             a11 
 join ldb.d_internal_contact         a12
on (a11.employee_key = a12.row_key)
join ldb.dh_employee_hierarchy         a110
on (a12.row_dn_key = a110.lev_0_key)
union
 select'dh_employee_level1' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_employee_termination             a11 
 join ldb.d_internal_contact         a12
on (a11.employee_key = a12.row_key)
join ldb.dh_employee_hierarchy         a110
on (a12.row_dn_key = a110.lev_0_key)
join ldb.dh_employee_level1         a111
on (a110.lev_1_key = a111.row_key)
