select 'ldb.f_hr_change' as Table_Name, count(1) Row_Count
 from  ldb.f_hr_change       a11 
union
select'ldb.d_internal_contact' as Table_Name, count(1) Row_Count
 from  ldb.f_hr_change       a11 
join ldb.d_internal_contact       a12
on (a11.requested_for_key = a12.row_key)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(1) Row_Count
 from  ldb.f_hr_change       a11 
join ldb.d_internal_contact_assigned_to       a13
on (a11.assigned_to_key = a13.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(1) Row_Count
 from  ldb.f_hr_change       a11 
join ldb.d_calendar_date       a14
on (a11.opened_on_key = a14.row_key)
union
select'ldb.dh_employee_hierarchy' as Table_Name, count(1) Row_Count
 from  ldb.f_hr_change       a11
 join ldb.d_internal_contact       a12
on (a11.requested_for_key = a12.row_key)
join ldb.dh_employee_hierarchy       a15
on (a12.row_current_key = a15.lev_0_key)
union
select'ldb.d_configuration_item' as Table_Name, count(1) Row_Count
 from  ldb.f_hr_change       a11 
join ldb.d_configuration_item       a16
on (a11.configuration_item_key = a16.row_key)
union
select'ldb.d_internal_organization_department' as Table_Name, count(1) Row_Count
 from  ldb.f_hr_change       a11 
join ldb.d_internal_organization_department       a17
on (a11.department_key = a17.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(1) Row_Count
 from  ldb.f_hr_change       a11 
  join ldb.d_internal_contact       a12
on (a11.requested_for_key = a12.row_key)
join ldb.d_internal_contact_mdm       a18
on (a12.row_current_key = a18.row_current_key)
union
select'ldb.d_hr_change_category' as Table_Name, count(1) Row_Count
 from  ldb.f_hr_change       a11 
join ldb.d_hr_change_category       a19
on (a11.category_src_key = a19.row_key)
union
select'ldb.d_hr_change_impact' as Table_Name, count(1) Row_Count
 from  ldb.f_hr_change       a11 
join ldb.d_hr_change_impact       a110
on (a11.impact_src_key = a110.row_key)
union
select'ldb.d_hr_change' as Table_Name, count(1) Row_Count
 from  ldb.f_hr_change       a11 
join ldb.d_hr_change       a111
on (a11.hr_change_key = a111.row_key)
union
select'ldb.d_hr_change_priority' as Table_Name, count(1) Row_Count
 from  ldb.f_hr_change       a11 
join ldb.d_hr_change_priority       a112
on (a11.priority_src_key = a112.row_key)
union
select'ldb.d_hr_change_urgency' as Table_Name, count(1) Row_Count
 from  ldb.f_hr_change       a11 
join ldb.d_hr_change_urgency       a113
on (a11.urgency_src_key = a113.row_key)
union
select'ldb.d_location' as Table_Name, count(1) Row_Count
 from  ldb.f_hr_change       a11 
join ldb.d_location       a114
on (a11.location_key = a114.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(1) Row_Count
 from  ldb.f_hr_change       a11 
 join ldb.d_calendar_date       a14
on (a11.opened_on_key = a14.row_key)
join ldb.d_calendar_month       a115
on (a14.month_start_date_key = a115.row_key)
union
select'ldb.d_calendar_week' as Table_Name, count(1) Row_Count
 from  ldb.f_hr_change       a11 
 join ldb.d_calendar_date       a14
on (a11.opened_on_key = a14.row_key)
join ldb.d_calendar_week       a116
on (a14.week_start_date_key = a116.row_key)
union
select'ldb.d_calendar_quarter' as Table_Name, count(1) Row_Count
 from  ldb.f_hr_change       a11 
 join ldb.d_calendar_date       a14
on (a11.opened_on_key = a14.row_key)
join ldb.d_calendar_quarter       a118
on (a14.quarter_start_date_key = a118.row_key)
union
select'ldb.d_calendar_year' as Table_Name, count(1) Row_Count
 from  ldb.f_hr_change       a11 
 join ldb.d_calendar_date       a14
on (a11.opened_on_key = a14.row_key)
join ldb.d_calendar_year       a120
on (a14.year_start_date_key = a120.row_key)
union
select'ldb.dh_employee_level1' as Table_Name, count(1) Row_Count
 from  ldb.f_hr_change       a11 
  join ldb.d_internal_contact       a12
on (a11.requested_for_key = a12.row_key)
join ldb.dh_employee_hierarchy       a15
on (a12.row_current_key = a15.lev_0_key)
join ldb.dh_employee_level1       a117
on (a15.lev_1_key = a117.row_key)
union
select'ldb.dh_employee_level2' as Table_Name, count(1) Row_Count
 from  ldb.f_hr_change       a11 
  join ldb.d_internal_contact       a12
on (a11.requested_for_key = a12.row_key)
join ldb.dh_employee_hierarchy       a15
on (a12.row_current_key = a15.lev_0_key)
join ldb.dh_employee_level2       a119
on (a15.lev_2_key = a119.row_key)
union
select'ldb.dh_employee_level3' as Table_Name, count(1) Row_Count
 from  ldb.f_hr_change       a11 
  join ldb.d_internal_contact       a12
on (a11.requested_for_key = a12.row_key)
join ldb.dh_employee_hierarchy       a15
on (a12.row_current_key = a15.lev_0_key)
join ldb.dh_employee_level3       a121
on (a15.lev_3_key = a121.row_key)
union
select'ldb.dh_employee_level4' as Table_Name, count(1) Row_Count
 from  ldb.f_hr_change       a11 
  join ldb.d_internal_contact       a12
on (a11.requested_for_key = a12.row_key)
join ldb.dh_employee_hierarchy       a15
on (a12.row_current_key = a15.lev_0_key)
join ldb.dh_employee_level4       a122
on (a15.lev_4_key = a122.row_key)
union
select'ldb.dh_employee_level5' as Table_Name, count(1) Row_Count
 from  ldb.f_hr_change       a11
  join ldb.d_internal_contact       a12
on (a11.requested_for_key = a12.row_key)
join ldb.dh_employee_hierarchy       a15
on (a12.row_current_key = a15.lev_0_key)
join ldb.dh_employee_level5       a123
on (a15.lev_5_key = a123.row_key)





