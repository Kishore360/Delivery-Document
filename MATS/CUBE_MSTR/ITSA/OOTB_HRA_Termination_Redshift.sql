SELECT CASE WHEN max_count<>min_count THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN  max_count<>min_count THEN 'OOTB has Keys Dropped' ELSE 'SUCCESS'  END as Message FROM (
 select max(Row_Count) max_count,Min(Row_Count) min_count from (
select'ldb.f_employee_termination' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_employee_termination             a11 
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_employee_termination             a11 
join ldb.d_internal_contact         a12
on (a11.employee_key = a12.row_key)
union
select'ldb.dh_employee_hierarchy' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_employee_termination             a11 
 join ldb.d_internal_contact         a12
on (a11.employee_key = a12.row_key)
join ldb.dh_employee_hierarchy         a13
on (a12.row_dn_key = a13.lev_0_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_employee_termination             a11
 join ldb.d_internal_contact         a12
on (a11.employee_key = a12.row_key)
join ldb.d_internal_contact_mdm         a14
on (a12.row_current_key = a14.row_current_key)
union
select'ldb.d_employee_location' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_employee_termination             a11 
  join ldb.d_internal_contact         a12
on (a11.employee_key = a12.row_key)
join ldb.d_internal_contact_mdm         a14
on (a12.row_current_key = a14.row_current_key)
join ldb.d_employee_location         a15
on (a14.location_key = a15.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_employee_termination             a11 
join ldb.d_calendar_date         a16
on (a11.last_working_day_key = a16.row_key)
union
select'ldb.d_request_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_employee_termination             a11 
join ldb.d_request_item         a17
on (a11.request_item_key = a17.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_employee_termination             a11 
join ldb.d_calendar_date         a18
on (a11.termination_date_key = a18.row_key)
union
select'ldb.dh_employee_level1' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_employee_termination             a11 
  join ldb.d_internal_contact         a12
on (a11.employee_key = a12.row_key)
join ldb.dh_employee_hierarchy         a13
on (a12.row_dn_key = a13.lev_0_key)
join ldb.dh_employee_level1         a19
on (a13.lev_1_key = a19.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_employee_termination             a11 
 join ldb.d_calendar_date         a16
on (a11.last_working_day_key = a16.row_key)
join ldb.d_calendar_month         a110
on (a16.month_start_date_key = a110.row_key)
union
select'ldb.d_calendar_week' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_employee_termination             a11 
 join ldb.d_calendar_date         a16
on (a11.last_working_day_key = a16.row_key)
join ldb.d_calendar_week         a111
on (a16.week_start_date_key = a111.row_key)
union
select'ldb.d_calendar_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_employee_termination             a11
 join ldb.d_calendar_date         a16
on (a11.last_working_day_key = a16.row_key)
join ldb.d_calendar_year         a112
on (a16.year_start_date_key = a112.row_key)
)a
)b
