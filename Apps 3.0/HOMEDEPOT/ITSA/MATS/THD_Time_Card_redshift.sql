
select'ldb.f_time_card' as Table_Name, count(a11.row_key) Row_Count
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
on (a11.timecard_on_key=a13.row_key)
union
select'ldb.dh_employee_hierarchy' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_card       a11 
 join ldb.d_internal_contact       a12
on (a11.employee_key=a12.row_key)
join ldb.dh_employee_hierarchy       a14
on (a12.row_current_key=a14.lev_0_key)
union
select'ldb.d_task' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_card       a11 
join ldb.d_task       a15
on (a11.task_key=a15.row_key)
union
select'ldb.d_cost_center' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_card       a11 
join ldb.d_cost_center       a16
on (a11.cost_center_key=a16.row_key)
union
select'ldb.d_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_card       a11 
join ldb.d_internal_organization_department       a17
on (a11.department_key=a17.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_card       a11 
 join ldb.d_internal_contact       a12
on (a11.employee_key=a12.row_key)
join ldb.d_internal_contact_mdm       a18
on (a12.row_current_key=a18.row_current_key)
union
select'ldb.d_location' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_card       a11 
join ldb.d_location       a19
on (a11.location_key=a19.row_key)
union
select'ldb.d_project' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_card       a11 
join ldb.d_project       a110
on (a11.project_key=a110.row_key)
union
select'ldb.d_time_card_category' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_card       a11 
join ldb.d_time_card_category       a111
on (a11.category_src_key=a111.row_key)
union
select'ldb.d_time_card_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_card       a11 
join ldb.d_time_card_state       a112
on (a11.state_src_key=a112.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_card       a11
 join ldb.d_calendar_date       a13
on (a11.timecard_on_key=a13.row_key)
join ldb.d_calendar_month       a114
on (a13.month_start_date_key=a114.row_key)
union
select'ldb.dh_employee_level1' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_card       a11 
  join ldb.d_internal_contact       a12
on (a11.employee_key=a12.row_key)
join ldb.dh_employee_hierarchy       a14
on (a12.row_current_key=a14.lev_0_key)
join ldb.dh_employee_level1       a113
on (a14.lev_1_key=a113.row_key)
union
select'ldb.dh_employee_level2' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_card       a11 
  join ldb.d_internal_contact       a12
on (a11.employee_key=a12.row_key)
join ldb.dh_employee_hierarchy       a14
on (a12.row_current_key=a14.lev_0_key)
join ldb.dh_employee_level2       a115
on (a14.lev_2_key=a115.row_key)
union
select'ldb.dh_employee_level3' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_card       a11 
  join ldb.d_internal_contact       a12
on (a11.employee_key=a12.row_key)
join ldb.dh_employee_hierarchy       a14
on (a12.row_current_key=a14.lev_0_key)
join ldb.dh_employee_level3       a116
on (a14.lev_3_key=a116.row_key)
union
select'ldb.dh_employee_level4' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_card       a11 
  join ldb.d_internal_contact       a12
on (a11.employee_key=a12.row_key)
join ldb.dh_employee_hierarchy       a14
on (a12.row_current_key=a14.lev_0_key)
join ldb.dh_employee_level4       a117
on (a14.lev_4_key=a117.row_key)
union
select'ldb.dh_employee_level5' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_card       a11 
  join ldb.d_internal_contact       a12
on (a11.employee_key=a12.row_key)
join ldb.dh_employee_hierarchy       a14
on (a12.row_current_key=a14.lev_0_key)
join ldb.dh_employee_level5       a118
on (a14.lev_5_key=a118.row_key)



