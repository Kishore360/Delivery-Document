select'ldb.f_call' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call             a11 
 union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call             a11 
join ldb.d_internal_contact         a12
on (a11.opened_by_key=a12.row_key)
union
select'ldb.d_master_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call             a11 
join ldb.d_master_item         a13
on (a11.master_item_key=a13.row_key)
union
select'ldb.d_call' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call             a11 
join ldb.d_call         a14
on (a11.call_key=a14.row_key)
union
select'ldb.dh_employee_hierarchy' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call             a11 
 join ldb.d_internal_contact         a12
on (a11.opened_by_key=a12.row_key)
join ldb.dh_employee_hierarchy         a15
on (a12.row_current_key=a15.lev_0_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call             a11 
 join ldb.d_internal_contact         a12
on (a11.opened_by_key=a12.row_key)
join ldb.d_internal_contact_mdm         a16
on (a12.row_current_key=a16.row_current_key)
union
select'ldb.d_employee_location' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call             a11
 join ldb.d_internal_contact         a12
on (a11.opened_by_key=a12.row_key)
join ldb.d_internal_contact_mdm         a16
on (a12.row_current_key=a16.row_current_key) 
join ldb.d_employee_location         a17
on (a16.location_key=a17.row_key)
union
select'ldb.d_calendar_greg_fiscal_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call             a11 
join ldb.d_calendar_greg_fiscal_c         a18
on (a11.opened_on_key=a18.greogrian_calendar_key)
union
select'ldb.d_calendar_date_fiscal' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call             a11 
 join ldb.d_calendar_greg_fiscal_c         a18
on (a11.opened_on_key=a18.greogrian_calendar_key)
join ldb.d_calendar_date_fiscal         a19
on (a18.fiscal_key=a19.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call             a11 
join ldb.d_calendar_date         a110
on (a11.opened_on_key=a110.row_key)
union
select'ldb.d_calendar_week' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call             a11 
 join ldb.d_calendar_date         a110
on (a11.opened_on_key=a110.row_key)
join ldb.d_calendar_week         a111
on (a110.week_start_date_key=a111.row_key)
union
select'ldb.d_task' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call             a11 
join ldb.d_task         a112
on (a11.task_key=a112.row_key)
union
select'ldb.d_call_reported_type' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call             a11 
join ldb.d_call_reported_type         a113
on (a11.reported_type_src_key=a113.row_key)
union
select'ldb.d_internal_contact_caller' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call             a11 
join ldb.d_internal_contact_caller         a114
on (a11.caller_key=a114.row_key)
union
select'ldb.d_internal_organization_legalentity' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call             a11 
join ldb.d_internal_organization_legalentity         a115
on (a11.company_key=a115.row_key)
union
select'ldb.d_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call             a11 
join ldb.d_internal_organization_department         a116
on (a11.department_key=a116.row_key)
union
select'ldb.d_domain' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call             a11 
join ldb.d_domain         a117
on (a11.domain_key=a117.row_key)
union
select'ldb.d_location' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call             a11 
join ldb.d_location         a118
on (a11.location_key=a118.row_key)
union
select'ldb.dh_employee_level1' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call             a11
 join ldb.d_internal_contact         a12
on (a11.opened_by_key=a12.row_key)
join ldb.dh_employee_hierarchy         a15
on (a12.row_current_key=a15.lev_0_key) 
join ldb.dh_employee_level1         a119
on (a15.lev_1_key=a119.row_key)
union
select'ldb.dh_employee_level2' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call             a11
 join ldb.d_internal_contact         a12
on (a11.opened_by_key=a12.row_key)
join ldb.dh_employee_hierarchy         a15
on (a12.row_current_key=a15.lev_0_key) 
join ldb.dh_employee_level2         a120
on (a15.lev_2_key=a120.row_key)
union
select'ldb.d_calendar_fiscal_period' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call             a11
 join ldb.d_calendar_greg_fiscal_c         a18
on (a11.opened_on_key=a18.greogrian_calendar_key)
join ldb.d_calendar_date_fiscal         a19
on (a18.fiscal_key=a19.row_key) 
join ldb.d_calendar_fiscal_period         a121
on (a19.period_start_date_key=a121.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call             a11
join ldb.d_calendar_date         a110
on (a11.opened_on_key=a110.row_key) 
join ldb.d_calendar_month         a122
on (a110.month_start_date_key=a122.row_key)
union
select'ldb.dh_employee_level3' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call             a11 
  join ldb.d_internal_contact         a12
on (a11.opened_by_key=a12.row_key)
join ldb.dh_employee_hierarchy         a15
on (a12.row_current_key=a15.lev_0_key)
join ldb.dh_employee_level3         a123
on (a15.lev_3_key=a123.row_key)
union
select'ldb.d_calendar_fiscal_quarter' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call             a11
 join ldb.d_calendar_greg_fiscal_c         a18
on (a11.opened_on_key=a18.greogrian_calendar_key)
join ldb.d_calendar_date_fiscal         a19
on (a18.fiscal_key=a19.row_key) 
join ldb.d_calendar_fiscal_quarter         a124
on (a19.quarter_start_date_key=a124.row_key)
union
select'ldb.dh_employee_level4' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call             a11
 join ldb.d_internal_contact         a12
on (a11.opened_by_key=a12.row_key)
join ldb.dh_employee_hierarchy         a15
on (a12.row_current_key=a15.lev_0_key) 
join ldb.dh_employee_level4         a125
on (a15.lev_4_key=a125.row_key)
union
select'ldb.d_calendar_fiscal_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call             a11 
 join ldb.d_calendar_greg_fiscal_c         a18
on (a11.opened_on_key=a18.greogrian_calendar_key)
 join ldb.d_calendar_date_fiscal         a19
on (a18.fiscal_key=a19.row_key)
join ldb.d_calendar_fiscal_year         a126
on (a19.year_start_date_key=a126.row_key)
union
select'ldb.dh_employee_level5' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call             a11
 join ldb.d_internal_contact         a12
on (a11.opened_by_key=a12.row_key)
join ldb.dh_employee_hierarchy         a15
on (a12.row_current_key=a15.lev_0_key) 
join ldb.dh_employee_level5         a127
on (a15.lev_5_key=a127.row_key)
union
select'ldb.d_configuration_item_call_center_configuration_item_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call             a11
join ldb.d_configuration_item_call_center_configuration_item_c a1113
on a11.configuration_item_c_key=a1113.row_key