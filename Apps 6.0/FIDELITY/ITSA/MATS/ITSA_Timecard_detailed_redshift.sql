select 'ldb.f_time_card' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_card       a11 
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_card       a11 
join ldb.d_internal_contact       a12
on (a11.employee_key=a12.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_card       a11 
join ldb.d_calendar_date       a13
on (a11.date_key=a13.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_card       a11 
 join ldb.d_calendar_date       a13
on (a11.date_key=a13.row_key)
join ldb.d_calendar_month       a14
on (a13.month_start_date_key=a14.row_key)
union
select'ldb.d_calendar_quarter' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_card       a11 
 join ldb.d_calendar_date       a13
on (a11.date_key=a13.row_key)
join ldb.d_calendar_month       a14
on (a13.month_start_date_key=a14.row_key)
join ldb.d_calendar_quarter       a15
on (a14.quarter_start_date_key=a15.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_card       a11 
 join ldb.d_internal_contact       a12
on (a11.employee_key=a12.row_key)
join ldb.d_internal_contact_mdm       a16
on (a12.employee_mdm_key=a16.row_key)
union
select'ldb.d_project' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_card       a11 
join ldb.d_project       a17
on (a11.project_key=a17.row_key)
union
select'ldb.d_task' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_card       a11 
join ldb.d_task       a18
on (a11.task_key=a18.row_key)
union
select'ldb.d_cost_center' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_card       a11 
join ldb.d_cost_center       a19
on (a11.cost_center_key=a19.row_key)
union
select'ldb.d_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_card       a11 
join ldb.d_internal_organization_department       a110
on (a11.department_key=a110.row_key)
union
select'ldb.d_location' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_card       a11 
join ldb.d_location       a111
on (a11.location_key=a111.row_key)
union
select'ldb.d_time_card_category' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_card       a11 
join ldb.d_time_card_category       a112
on (a11.category_src_key=a112.row_key)
union
select'ldb.d_time_card_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_card       a11 
join ldb.d_time_card_state       a113
on (a11.state_src_key=a113.row_key)
union
select'ldb.d_calendar_week' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_card       a11 
  join ldb.d_calendar_date       a13
on (a11.date_key=a13.row_key)
join ldb.d_calendar_week       a114
on (a13.week_start_date_key=a114.row_key)
union
select'ldb.d_task_type' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_card       a11 
 join ldb.d_task       a18
on (a11.task_key=a18.row_key)
join ldb.d_task_type       a115
on (a18.task_type_src_key=a115.row_key)
union
select'ldb.d_calendar_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_card       a11 
  join ldb.d_calendar_date       a13
on (a11.date_key=a13.row_key)
join ldb.d_calendar_month       a14
on (a13.month_start_date_key=a14.row_key)
join ldb.d_calendar_quarter       a15
on (a14.quarter_start_date_key=a15.row_key)
join ldb.d_calendar_year       a116
on (a15.year_start_date_key=a116.row_key);



