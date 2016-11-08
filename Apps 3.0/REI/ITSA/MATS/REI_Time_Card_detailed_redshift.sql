select'ldb.f_time_entry' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_entry       a11 
union
select'ldb.d_calendar_greg_fiscal_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_entry       a11 
join ldb.d_calendar_greg_fiscal_c       a12
on (a11.date_key = a12.greogrian_calendar_key)
union
select'ldb.d_calendar_date_fiscal' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_entry       a11 
 join ldb.d_calendar_greg_fiscal_c       a12
on (a11.date_key = a12.greogrian_calendar_key)
join ldb.d_calendar_date_fiscal       a13
on (a12.fiscal_key = a13.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_entry       a11 
join ldb.d_calendar_date       a14
on (a11.date_key = a14.row_key)
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_entry       a11 
join ldb.d_internal_contact       a15
on (a11.user_key = a15.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_entry       a11
 join ldb.d_internal_contact       a15
on (a11.user_key = a15.row_key)
join ldb.d_internal_contact_mdm       a16
on (a15.row_current_key = a16.row_current_key)
union
select'ldb.d_project' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_entry       a11 
join ldb.d_project       a17
on (a11.project_key = a17.row_key)
union
select'ldb.dh_employee_hierarchy' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_entry       a11 
  join ldb.d_internal_contact       a15
on (a11.user_key = a15.row_key)
join ldb.dh_employee_hierarchy       a19
on (a15.row_current_key = a19.lev_0_key)
union
select'ldb.d_internal_contact_it_director_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_entry       a11 
 join ldb.d_project       a17
on (a11.project_key = a17.row_key)
join ldb.d_internal_contact_it_director_c       a18
on (a17.it_director_c_key = a18.it_director_c_key)
union
select'ldb.d_portfolio_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_entry       a11 
 join ldb.d_project       a17
on (a11.project_key = a17.row_key)
join ldb.d_portfolio_c       a110
on (a17.portfolio_c_key = a110.row_key)
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_entry       a11 
 join ldb.d_project       a17
on (a11.project_key = a17.row_key)
join ldb.d_internal_contact       a111
on (a17.manager_c_key = a111.row_key)
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_entry       a11 
 join ldb.d_project       a17
on (a11.project_key = a17.row_key)
join ldb.d_internal_contact       a112
on (a17.requestor_c_key = a112.row_key)
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_entry       a11 
 join ldb.d_project       a17
on (a11.project_key = a17.row_key)
join ldb.d_internal_contact       a113
on (a17.sponsor_c_key = a113.row_key)
union
select'ldb.d_cost_center' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_entry       a11
 join ldb.d_project       a17
on (a11.project_key = a17.row_key)
join ldb.d_cost_center       a121
on (a17.cost_center_c_key = a121.row_key)
union
select'ldb.d_project_division' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_entry       a11 
 join ldb.d_project       a17
on (a11.project_key = a17.row_key)
join ldb.d_project_division       a123
on (a17.division_src_c_key = a123.row_key)
union
select'ldb.d_project_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_entry       a11
 join ldb.d_project       a17
on (a11.project_key = a17.row_key)
join ldb.d_project_priority       a125
on (a17.priority_src_c_key = a125.row_key)
union
select'ldb.d_project_stage' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_entry       a11 
 join ldb.d_project       a17
on (a11.project_key = a17.row_key)
join ldb.d_project_stage       a126
on (a17.stage_src_c_key = a126.row_key)
union
select'ldb.d_project_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_entry       a11 
 join ldb.d_project       a17
on (a11.project_key = a17.row_key)
join ldb.d_project_state       a127
on (a17.status_src_c_key = a127.row_key)
union
select'ldb.d_task' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_entry       a11 
join ldb.d_task       a114
on (a11.task_key = a114.row_key)
union
select'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_entry       a11 
join ldb.d_configuration_item       a115
on (a11.configuration_item_key = a115.row_key)
union
select'ldb.d_calendar_fiscal_period' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_entry       a11 
 join ldb.d_calendar_greg_fiscal_c       a12
on (a11.date_key = a12.greogrian_calendar_key)
join ldb.d_calendar_date_fiscal       a13
on (a12.fiscal_key = a13.row_key)
join ldb.d_calendar_fiscal_period       a116
on (a13.period_start_date_key = a116.row_key)
union
select'ldb.d_calendar_fiscal_quarter' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_entry       a11 
 join ldb.d_calendar_greg_fiscal_c       a12
on (a11.date_key = a12.greogrian_calendar_key)
join ldb.d_calendar_date_fiscal       a13
on (a12.fiscal_key = a13.row_key)
join ldb.d_calendar_fiscal_quarter       a122
on (a13.quarter_start_date_key = a122.row_key)
union
select'ldb.d_calendar_fiscal_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_entry       a11 
 join ldb.d_calendar_greg_fiscal_c       a12
on (a11.date_key = a12.greogrian_calendar_key)
join ldb.d_calendar_date_fiscal       a13
on (a12.fiscal_key = a13.row_key)
join ldb.d_calendar_fiscal_year       a132
on (a13.year_start_date_key = a132.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_entry       a11 
 join ldb.d_calendar_date       a14
on (a11.date_key = a14.row_key)
join ldb.d_calendar_month       a117
on (a14.month_start_date_key = a117.row_key)
union
select'ldb.d_internal_organization_legalentity' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_entry       a11 
  join ldb.d_internal_contact       a15
on (a11.user_key = a15.row_key)
join ldb.d_internal_contact_mdm       a16
on (a15.row_current_key = a16.row_current_key)
join ldb.d_internal_organization_legalentity       a130
on (a16.company_c_key = a130.row_key)
union
select'ldb.d_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_entry       a11 
  join ldb.d_internal_contact       a15
on (a11.user_key = a15.row_key)
join ldb.d_internal_contact_mdm       a16
on (a15.row_current_key = a16.row_current_key)
join ldb.d_internal_organization_department       a131
on (a16.department_c_key = a131.row_key)
union
select'ldb.dh_employee_level1' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_entry       a11
   join ldb.d_internal_contact       a15
on (a11.user_key = a15.row_key)
join ldb.dh_employee_hierarchy       a19
on (a15.row_current_key = a19.lev_0_key)
join ldb.dh_employee_level1       a134
on (a19.lev_1_key = a134.row_key)
union
select'ldb.dh_employee_level2' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_entry       a11 
   join ldb.d_internal_contact       a15
on (a11.user_key = a15.row_key)
join ldb.dh_employee_hierarchy       a19
on (a15.row_current_key = a19.lev_0_key)
join ldb.dh_employee_level2       a135
on (a19.lev_2_key = a135.row_key)
union
select'ldb.dh_employee_level3' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_entry       a11 
   join ldb.d_internal_contact       a15
on (a11.user_key = a15.row_key)
join ldb.dh_employee_hierarchy       a19
on (a15.row_current_key = a19.lev_0_key)
join ldb.dh_employee_level3       a136
on (a19.lev_3_key = a136.row_key)
union
select'ldb.dh_employee_level4' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_entry       a11 
   join ldb.d_internal_contact       a15
on (a11.user_key = a15.row_key)
join ldb.dh_employee_hierarchy       a19
on (a15.row_current_key = a19.lev_0_key)
join ldb.dh_employee_level4       a137
on (a19.lev_4_key = a137.row_key)
union
select'ldb.dh_employee_level5' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_entry       a11 
   join ldb.d_internal_contact       a15
on (a11.user_key = a15.row_key)
join ldb.dh_employee_hierarchy       a19
on (a15.row_current_key = a19.lev_0_key)
join ldb.dh_employee_level5       a138
on (a19.lev_5_key = a138.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_entry       a11 
  join ldb.d_project       a17
on (a11.project_key = a17.row_key)
join ldb.d_internal_contact       a111
on (a17.manager_c_key = a111.row_key)
join ldb.d_internal_contact_mdm       a124
on (a111.row_current_key = a124.row_key)
union
select'ldb.d_portfolio_owner_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_entry       a11 
  join ldb.d_project       a17
on (a11.project_key = a17.row_key)
join ldb.d_portfolio_c       a110
on (a17.portfolio_c_key = a110.row_key)
join ldb.d_portfolio_owner_c       a133
on (a110.portfolio_owner_key = a133.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_entry       a11 
  join ldb.d_project       a17
on (a11.project_key = a17.row_key)
join ldb.d_internal_contact       a112
on (a17.requestor_c_key = a112.row_key)
join ldb.d_internal_contact_mdm       a128
on (a112.row_current_key = a128.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_time_entry       a11 
  join ldb.d_project       a17
on (a11.project_key = a17.row_key)
join ldb.d_internal_contact       a113
on (a17.sponsor_c_key = a113.row_key)
join ldb.d_internal_contact_mdm       a129
on (a113.row_current_key = a129.row_key)








