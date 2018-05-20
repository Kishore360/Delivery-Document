select 'ldb.f_time_card' as Table_Name, count(1) Row_Count
 from  ldb.f_time_card       a11 
union
select'ldb.d_internal_contact' as Table_Name, count(1) Row_Count
 from  ldb.f_time_card       a11 
join ldb.d_internal_contact       a12
on (a11.employee_key = a12.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(1) Row_Count
 from  ldb.f_time_card       a11 
join ldb.d_calendar_date       a13
on (a11.timecard_on_key = a13.row_key)
union
select'ldb.dh_employee_hierarchy' as Table_Name, count(1) Row_Count
 from  ldb.f_time_card       a11 
 join ldb.d_internal_contact       a12
on (a11.employee_key = a12.row_key)
join ldb.dh_employee_hierarchy       a14
on (a12.row_current_key = a14.lev_0_key)
union
select'ldb.d_project' as Table_Name, count(1) Row_Count
 from  ldb.f_time_card       a11 
join ldb.d_project       a15
on (a11.project_key = a15.row_key)
union
select'ldb.d_task' as Table_Name, count(1) Row_Count
 from  ldb.f_time_card       a11 
join ldb.d_task       a16
on (a11.task_key = a16.row_key)
union
select'ldb.d_cost_center' as Table_Name, count(1) Row_Count
 from  ldb.f_time_card       a11 
join ldb.d_cost_center       a17
on (a11.cost_center_key = a17.row_key)
union
select'ldb.d_internal_organization_department' as Table_Name, count(1) Row_Count
 from  ldb.f_time_card       a11 
join ldb.d_internal_organization_department       a18
on (a11.department_key = a18.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(1) Row_Count
 from  ldb.f_time_card       a11 
 join ldb.d_internal_contact       a12
on (a11.employee_key = a12.row_key)
join ldb.d_internal_contact_mdm       a19
on (a12.row_current_key = a19.row_current_key)
union
select'ldb.d_location' as Table_Name, count(1) Row_Count
 from  ldb.f_time_card       a11 
join ldb.d_location       a110
on (a11.location_key = a110.row_key)
union
select'ldb.d_time_card_category' as Table_Name, count(1) Row_Count
 from  ldb.f_time_card       a11 
join ldb.d_time_card_category       a111
on (a11.category_src_key = a111.row_key)
union
select'ldb.d_time_card_state' as Table_Name, count(1) Row_Count
 from  ldb.f_time_card       a11 
join ldb.d_time_card_state       a112
on (a11.state_src_key = a112.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(1) Row_Count
 from  ldb.f_time_card       a11
 join ldb.d_calendar_date       a13
on (a11.timecard_on_key = a13.row_key)
join ldb.d_calendar_month       a113
on (a13.month_start_date_key = a113.row_key)
union
select'ldb.d_calendar_week' as Table_Name, count(1) Row_Count
 from  ldb.f_time_card       a11 
 join ldb.d_calendar_date       a13
on (a11.timecard_on_key = a13.row_key)
join ldb.d_calendar_week       a114
on (a13.week_start_date_key = a114.row_key)
union
select'ldb.d_calendar_quarter' as Table_Name, count(1) Row_Count
 from  ldb.f_time_card       a11
 join ldb.d_calendar_date       a13
on (a11.timecard_on_key = a13.row_key)
join ldb.d_calendar_quarter       a117
on (a13.quarter_start_date_key = a117.row_key)
union
select'ldb.d_calendar_year' as Table_Name, count(1) Row_Count
 from  ldb.f_time_card       a11
 join ldb.d_calendar_date       a13
on (a11.timecard_on_key = a13.row_key)
join ldb.d_calendar_year       a119
on (a13.year_start_date_key = a119.row_key)
union
select'ldb.dh_employee_level1' as Table_Name, count(1) Row_Count
 from  ldb.f_time_card       a11 
  join ldb.d_internal_contact       a12
on (a11.employee_key = a12.row_key)
join ldb.dh_employee_hierarchy       a14
on (a12.row_current_key = a14.lev_0_key)
join ldb.dh_employee_level1       a115
on (a14.lev_1_key = a115.row_key)
union
select'ldb.dh_employee_level2' as Table_Name, count(1) Row_Count
 from  ldb.f_time_card       a11 
  join ldb.d_internal_contact       a12
on (a11.employee_key = a12.row_key)
join ldb.dh_employee_hierarchy       a14
on (a12.row_current_key = a14.lev_0_key)
join ldb.dh_employee_level2       a118
on (a14.lev_2_key = a118.row_key)
union
select'ldb.dh_employee_level3' as Table_Name, count(1) Row_Count
 from  ldb.f_time_card       a11
  join ldb.d_internal_contact       a12
on (a11.employee_key = a12.row_key)
join ldb.dh_employee_hierarchy       a14
on (a12.row_current_key = a14.lev_0_key)
join ldb.dh_employee_level3       a120
on (a14.lev_3_key = a120.row_key)
union
select'ldb.dh_employee_level4' as Table_Name, count(1) Row_Count
 from  ldb.f_time_card       a11 
  join ldb.d_internal_contact       a12
on (a11.employee_key = a12.row_key)
join ldb.dh_employee_hierarchy       a14
on (a12.row_current_key = a14.lev_0_key)
join ldb.dh_employee_level4       a121
on (a14.lev_4_key = a121.row_key)
union
select'ldb.dh_employee_level5' as Table_Name, count(1) Row_Count
 from  ldb.f_time_card       a11
  join ldb.d_internal_contact       a12
on (a11.employee_key = a12.row_key)
join ldb.dh_employee_hierarchy       a14
on (a12.row_current_key = a14.lev_0_key)
join ldb.dh_employee_level5       a122
on (a14.lev_5_key = a122.row_key)
union
select'ldb.d_task_type' as Table_Name, count(1) Row_Count
 from  ldb.f_time_card       a11 
 join ldb.d_task       a16
on (a11.task_key = a16.row_key)
join ldb.d_task_type       a116
on (a16.task_type_src_key = a116.row_key)





