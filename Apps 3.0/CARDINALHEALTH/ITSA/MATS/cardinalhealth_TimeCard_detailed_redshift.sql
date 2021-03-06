
select'ldb.f_time_entry' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_entry             a11 
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_entry             a11 
join ldb.d_internal_contact         a12
on (a11.user_c_key=a12.row_key)
union
select'ldb.d_calendar_greg_fiscal_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_entry             a11 
join ldb.d_calendar_greg_fiscal_c         a13
on (a11.date_c_key=a13.greogrian_calendar_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_entry             a11 
join ldb.d_calendar_date         a14
on (a11.date_c_key=a14.row_key)
union
select'ldb.d_calendar_date_fiscal' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_entry             a11
join ldb.d_calendar_greg_fiscal_c         a13
on (a11.date_c_key=a13.greogrian_calendar_key) 
join ldb.d_calendar_date_fiscal         a15
on (a13.fiscal_key=a15.row_key)
union
select'ldb.dh_employee_hierarchy' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_entry             a11
join ldb.d_internal_contact         a12
on (a11.user_c_key=a12.row_key) 
join ldb.dh_employee_hierarchy         a16
on (a12.row_current_key=a16.lev_0_key)
union
select'ldb.d_project' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_entry             a11 
join ldb.d_project         a17
on (a11.project_key=a17.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_entry             a11
join ldb.d_internal_contact         a12
on (a11.user_c_key=a12.row_key) 
join ldb.d_internal_contact_mdm         a18
on (a12.row_current_key=a18.row_current_key)
union
select'ldb.d_internal_organization_legalentity' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_entry             a11 
join ldb.d_internal_organization_legalentity         a19
on (a11.company_c_key=a19.row_key)
union
select'ldb.d_project_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_entry             a11 
join ldb.d_project_group        a110
on (a11.project_group_key=a110.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_entry             a11
join ldb.d_calendar_date         a14
on (a11.date_c_key=a14.row_key) 
join ldb.d_calendar_month        a111
on (a14.month_start_date_key=a111.row_key)
union
select'ldb.d_time_card_phase' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_entry             a11 
join ldb.d_time_card_phase        a112
on (a11.phase_src_c_key=a112.row_key)
union
select'ldb.d_task' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_entry             a11 
join ldb.d_task        a113
on (a11.task_c_key=a113.row_key)
union
select'ldb.d_time_card_category' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_entry             a11 
join ldb.d_time_card_category        a114
on (a11.category_src_key=a114.row_key)
union
select'ldb.d_time_card_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_entry             a11 
join ldb.d_time_card_state        a115
on (a11.state_src_key=a115.row_key)
union
select'ldb.dh_employee_level1' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_entry             a11
join ldb.d_internal_contact         a12
on (a11.user_c_key=a12.row_key) 
join ldb.dh_employee_hierarchy         a16
on (a12.row_current_key=a16.lev_0_key) 
join ldb.dh_employee_level1        a116
on (a16.lev_1_key=a116.row_key)
union
select'ldb.d_calendar_fiscal_period' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_entry             a11
join ldb.d_calendar_greg_fiscal_c         a13
on (a11.date_c_key=a13.greogrian_calendar_key) 
join ldb.d_calendar_date_fiscal         a15
on (a13.fiscal_key=a15.row_key) 
join ldb.d_calendar_fiscal_period        a117
on (a15.period_start_date_key=a117.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_entry             a11
join ldb.d_project         a17
on (a11.project_key=a17.row_key) 
join ldb.d_internal_contact_mdm        a118
on (a17.manager_key=a118.row_key)
union
select'ldb.d_project_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_entry             a11
join ldb.d_project         a17
on (a11.project_key=a17.row_key) 
join ldb.d_project_state        a119
on (a17.status_src_key=a119.row_key)
union
select'ldb.d_internal_contact_director' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_entry             a11 
 join ldb.d_internal_contact         a12
on (a11.user_c_key=a12.row_key) 
join ldb.d_internal_contact_mdm         a18
on (a12.row_current_key=a18.row_current_key)
join ldb.d_internal_contact_director        a120
on (a18.director_c_key=a120.row_key)
union
select'ldb.d_internal_contact_manager' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_entry             a11
join ldb.d_internal_contact         a12
on (a11.user_c_key=a12.row_key) 
join ldb.d_internal_contact_mdm         a18
on (a12.row_current_key=a18.row_current_key) 
join ldb.d_internal_contact_manager        a121
on (a18.manager_c_key=a121.row_key)
union
select'ldb.d_internal_contact_vp' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_entry             a11 
 join ldb.d_internal_contact         a12
on (a11.user_c_key=a12.row_key) 
join ldb.d_internal_contact_mdm         a18
on (a12.row_current_key=a18.row_current_key)
join ldb.d_internal_contact_vp        a122
on (a18.vp_c_key=a122.row_key)
union
select'ldb.dh_employee_level2' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_entry             a11
join ldb.d_internal_contact         a12
on (a11.user_c_key=a12.row_key) 
join ldb.dh_employee_hierarchy         a16
on (a12.row_current_key=a16.lev_0_key) 
join ldb.dh_employee_level2        a123
on (a16.lev_2_key=a123.row_key)
union
select'ldb.d_calendar_fiscal_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_entry             a11 
 join ldb.d_calendar_greg_fiscal_c         a13
on (a11.date_c_key=a13.greogrian_calendar_key) 
join ldb.d_calendar_date_fiscal         a15
on (a13.fiscal_key=a15.row_key)
join ldb.d_calendar_fiscal_year        a124
on (a15.year_start_date_key=a124.row_key)
union
select'ldb.dh_employee_level3' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_entry             a11 
 join ldb.d_internal_contact         a12
on (a11.user_c_key=a12.row_key) 
join ldb.dh_employee_hierarchy         a16
on (a12.row_current_key=a16.lev_0_key)
join ldb.dh_employee_level3        a125
on (a16.lev_3_key=a125.row_key)
union
select'ldb.dh_employee_level4' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_entry             a11
join ldb.d_internal_contact         a12
on (a11.user_c_key=a12.row_key) 
join ldb.dh_employee_hierarchy         a16
on (a12.row_current_key=a16.lev_0_key) 
join ldb.dh_employee_level4        a126
on (a16.lev_4_key=a126.row_key)
union
select'ldb.dh_employee_level5' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_entry             a11
join ldb.d_internal_contact         a12
on (a11.user_c_key=a12.row_key) 
join ldb.dh_employee_hierarchy         a16
on (a12.row_current_key=a16.lev_0_key) 
join ldb.dh_employee_level5        a127
on (a16.lev_5_key=a127.row_key)
