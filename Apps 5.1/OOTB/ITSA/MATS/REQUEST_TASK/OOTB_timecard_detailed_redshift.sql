select 'ldb.f_time_card' as Table_Name, count(1) Row_Count
 from  ldb.f_time_card       a11 
union
select'ldb.d_calendar_date' as Table_Name, count(1) Row_Count
 from  ldb.f_time_card       a11 
join ldb.d_calendar_date       a12
on (a11.timecard_on_key = a12.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(1) Row_Count
 from  ldb.f_time_card       a11 
join ldb.d_calendar_date       a12
on (a11.timecard_on_key = a12.row_key)
join ldb.d_calendar_month       a13
on (a12.month_start_date_key = a13.row_key)
union
select'ldb.d_cost_center' as Table_Name, count(1) Row_Count
 from  ldb.f_time_card       a11 
join ldb.d_cost_center       a14
on (a11.cost_center_key = a14.row_key)
union
select'ldb.d_internal_contact' as Table_Name, count(1) Row_Count
 from  ldb.f_time_card       a11 
join ldb.d_internal_contact       a15
on (a11.employee_key = a15.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(1) Row_Count
 from  ldb.f_time_card       a11 
join ldb.d_internal_contact       a15
on (a11.employee_key = a15.row_key)
join ldb.d_internal_contact_mdm       a16
on (a15.row_current_key = a16.row_current_key)
union
select'ldb.d_internal_organization_department' as Table_Name, count(1) Row_Count
 from  ldb.f_time_card       a11 
join ldb.d_internal_organization_department       a17
on (a11.department_key = a17.row_key)
union
select'ldb.d_location' as Table_Name, count(1) Row_Count
 from  ldb.f_time_card       a11 
join ldb.d_location       a18
on (a11.location_key = a18.row_key)
union
select'ldb.d_project' as Table_Name, count(1) Row_Count
 from  ldb.f_time_card       a11 
join ldb.d_project       a19
on (a11.project_key = a19.row_key)
union
select'ldb.d_time_card_category' as Table_Name, count(1) Row_Count
 from  ldb.f_time_card       a11 
join ldb.d_time_card_category       a20
on (a11.category_src_key = a20.row_key)
union
select'ldb.d_time_card_state' as Table_Name, count(1) Row_Count
 from  ldb.f_time_card       a11 
join ldb.d_time_card_state       a21
on (a11.state_src_key = a21.row_key)
union
select'ldb.dh_employee_hierarchy' as Table_Name, count(1) Row_Count
 from  ldb.f_time_card       a11 
  join ldb.d_internal_contact       a17
on (a11.employee_key = a17.row_key)
join ldb.d_internal_contact_mdm       a18
on (a17.row_current_key = a18.row_current_key)
join ldb.dh_employee_hierarchy       a26
on (a18.row_current_key = a26.lev_0_key)
union
select'ldb.dh_employee_level1' as Table_Name, count(1) Row_Count
 from  ldb.f_time_card       a11 
  join ldb.d_internal_contact       a17
on (a11.employee_key = a17.row_key)
join ldb.d_internal_contact_mdm       a18
on (a17.row_current_key = a18.row_current_key)
join ldb.dh_employee_hierarchy       a26
on (a18.row_current_key = a26.lev_0_key)
join ldb.dh_employee_level1       a27
on (a26.lev_1_key = a27.row_key)
union
select'ldb.dh_employee_level2' as Table_Name, count(1) Row_Count
 from  ldb.f_time_card       a11 
  join ldb.d_internal_contact       a17
on (a11.employee_key = a17.row_key)
join ldb.d_internal_contact_mdm       a18
on (a17.row_current_key = a18.row_current_key)
join ldb.dh_employee_hierarchy       a26
on (a18.row_current_key = a26.lev_0_key)
join ldb.dh_employee_level2       a28
on (a26.lev_2_key = a28.row_key)
union
select'ldb.dh_employee_level3' as Table_Name, count(1) Row_Count
 from  ldb.f_time_card       a11 
  join ldb.d_internal_contact       a17
on (a11.employee_key = a17.row_key)
join ldb.d_internal_contact_mdm       a18
on (a17.row_current_key = a18.row_current_key)
join ldb.dh_employee_hierarchy       a26
on (a18.row_current_key = a26.lev_0_key)
join ldb.dh_employee_level3       a29
on (a26.lev_3_key = a29.row_key)
union
select'ldb.dh_employee_level4' as Table_Name, count(1) Row_Count
 from  ldb.f_time_card       a11 
  join ldb.d_internal_contact       a17
on (a11.employee_key = a17.row_key)
join ldb.d_internal_contact_mdm       a18
on (a17.row_current_key = a18.row_current_key)
join ldb.dh_employee_hierarchy       a26
on (a18.row_current_key = a26.lev_0_key)
join ldb.dh_employee_level4       a30
on (a26.lev_4_key = a30.row_key)
union
select'ldb.dh_employee_level5' as Table_Name, count(1) Row_Count
 from  ldb.f_time_card       a11 
  join ldb.d_internal_contact       a17
on (a11.employee_key = a17.row_key)
join ldb.d_internal_contact_mdm       a18
on (a17.row_current_key = a18.row_current_key)
join ldb.dh_employee_hierarchy       a26
on (a18.row_current_key = a26.lev_0_key)
join ldb.dh_employee_level5       a31
on (a26.lev_5_key = a31.row_key)




