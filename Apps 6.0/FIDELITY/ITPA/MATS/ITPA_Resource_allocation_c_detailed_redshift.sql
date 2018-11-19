select 'ldb.f_resource_allocation' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_resource_allocation       a11 
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_resource_allocation       a11 
join ldb.d_internal_contact       a12
on (a11.employee_key = a12.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_resource_allocation       a11 
join ldb.d_calendar_date       a12
on (a11.date_key = a12.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_resource_allocation       a11 
 join ldb.d_calendar_date       a12
on (a11.date_key = a12.row_key)
join ldb.d_calendar_month       a13
on (a12.month_start_date_key = a13.row_key)
union
select'ldb.d_calendar_quarter' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_resource_allocation       a11 
 join ldb.d_calendar_date       a12
on (a11.date_key = a12.row_key)
join ldb.d_calendar_month       a13
on (a12.month_start_date_key = a13.row_key)
join ldb.d_calendar_quarter       a14
on (a13.quarter_start_date_key = a14.row_key)
union
select'ldb.d_calendar_week' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_resource_allocation       a11 
 join ldb.d_calendar_date       a12
on (a11.date_key = a12.row_key)
join ldb.d_calendar_week       a13
on (a12.week_start_date_key = a13.row_key)
union
select'ldb.d_calendar_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_resource_allocation       a11 
 join ldb.d_calendar_date       a12
on (a11.date_key = a12.row_key)
join ldb.d_calendar_month       a13
on (a12.month_start_date_key = a13.row_key)
join ldb.d_calendar_quarter       a14
on (a13.quarter_start_date_key = a14.row_key)
join ldb.d_calendar_year       a15
on (a14.year_start_date_key = a15.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_resource_allocation       a11 
 join ldb.d_internal_contact       a12
on (a11.employee_key = a12.row_key)
join ldb.d_internal_contact_mdm       a13
on (a12.row_current_key = a13.row_current_key)
union
select'ldb.d_employee_location' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_resource_allocation       a11 
 join ldb.d_internal_contact       a12
on (a11.employee_key = a12.row_key)
join ldb.d_internal_contact_mdm       a13
on (a12.row_current_key = a13.row_current_key)
join ldb.d_employee_location       a14
on (a13.location_key = a14.row_key)
union
select'ldb.d_internal_contact_employment_type' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_resource_allocation       a11 
 join ldb.d_internal_contact       a12
on (a11.employee_key = a12.row_key)
join ldb.d_internal_contact_mdm       a13
on (a12.row_current_key = a13.row_current_key)
join ldb.d_internal_contact_employment_type       a14
on (a13.employment_type_src_key = a14.row_key)
union
select'ldb.d_internal_contact_manager' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_resource_allocation       a11 
 join ldb.d_internal_contact       a12
on (a11.employee_key = a12.row_key)
join ldb.d_internal_contact_mdm       a13
on (a12.row_current_key = a13.row_current_key)
join ldb.d_internal_contact_manager       a14
on (a13.manager_key = a14.row_key)
union
select'ldb.d_internal_contact_manager' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_resource_allocation       a11 
 join ldb.d_internal_contact       a12
on (a11.employee_key = a12.row_key)
join ldb.d_internal_organization_department       a13
on (a12.department_key = a13.row_key)
union
select'ldb.d_resource_primary_role' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_resource_allocation       a11 
 join ldb.d_internal_contact       a12
on (a11.employee_key = a12.row_key)
join ldb.d_internal_contact_mdm       a13
on (a12.row_current_key = a13.row_current_key)
join ldb.d_resource_primary_role       a14
on (a13.primary_role_key = a14.row_key)
union
select'ldb.d_resource_primary_role' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_resource_allocation       a11 
 join ldb.d_internal_contact       a12
on (a11.employee_key = a12.row_key)
join ldb.d_internal_contact_mdm       a13
on (a12.row_current_key = a13.row_current_key)
join ldb.d_resource_primary_skill       a14
on (a13.primary_skill_key = a14.row_key)


select 'ldb.f_resource_allocation' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_resource_allocation       a11 
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_resource_allocation       a11 
join ldb.d_internal_contact       a12
on (a11.employee_key = a12.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_resource_allocation       a11 
join ldb.d_calendar_date       a12
on (a11.date_key = a12.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_resource_allocation       a11 
 join ldb.d_calendar_date       a12
on (a11.date_key = a12.row_key)
join ldb.d_calendar_month       a13
on (a12.month_start_date_key = a13.row_key)
union
select'ldb.d_calendar_quarter' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_resource_allocation       a11 
 join ldb.d_calendar_date       a12
on (a11.date_key = a12.row_key)
join ldb.d_calendar_month       a13
on (a12.month_start_date_key = a13.row_key)
join ldb.d_calendar_quarter       a14
on (a13.quarter_start_date_key = a14.row_key)
union
select'ldb.d_calendar_week' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_resource_allocation       a11 
 join ldb.d_calendar_date       a12
on (a11.date_key = a12.row_key)
join ldb.d_calendar_week       a13
on (a12.week_start_date_key = a13.row_key)
union
select'ldb.d_calendar_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_resource_allocation       a11 
 join ldb.d_calendar_date       a12
on (a11.date_key = a12.row_key)
join ldb.d_calendar_month       a13
on (a12.month_start_date_key = a13.row_key)
join ldb.d_calendar_quarter       a14
on (a13.quarter_start_date_key = a14.row_key)
join ldb.d_calendar_year       a15
on (a14.year_start_date_key = a15.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_resource_allocation       a11 
 join ldb.d_internal_contact       a12
on (a11.employee_key = a12.row_key)
join ldb.d_internal_contact_mdm       a13
on (a12.row_current_key = a13.row_current_key)
union
select'ldb.d_employee_location' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_resource_allocation       a11 
 join ldb.d_internal_contact       a12
on (a11.employee_key = a12.row_key)
join ldb.d_internal_contact_mdm       a13
on (a12.row_current_key = a13.row_current_key)
join ldb.d_employee_location       a14
on (a13.location_key = a14.row_key)
union
select'ldb.d_internal_contact_employment_type' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_resource_allocation       a11 
 join ldb.d_internal_contact       a12
on (a11.employee_key = a12.row_key)
join ldb.d_internal_contact_mdm       a13
on (a12.row_current_key = a13.row_current_key)
join ldb.d_internal_contact_employment_type       a14
on (a13.employment_type_src_key = a14.row_key)
union
select'ldb.d_internal_contact_manager' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_resource_allocation       a11 
 join ldb.d_internal_contact       a12
on (a11.employee_key = a12.row_key)
join ldb.d_internal_contact_mdm       a13
on (a12.row_current_key = a13.row_current_key)
join ldb.d_internal_contact_manager       a14
on (a13.manager_key = a14.row_key)
union
select'ldb.d_internal_contact_manager' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_resource_allocation       a11 
 join ldb.d_internal_contact       a12
on (a11.employee_key = a12.row_key)
join ldb.d_internal_organization_department       a13
on (a12.department_key = a13.row_key)
union
select'ldb.d_resource_primary_role' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_resource_allocation       a11 
 join ldb.d_internal_contact       a12
on (a11.employee_key = a12.row_key)
join ldb.d_internal_contact_mdm       a13
on (a12.row_current_key = a13.row_current_key)
join ldb.d_resource_primary_role       a14
on (a13.primary_role_key = a14.row_key)
union
select'ldb.d_resource_primary_role' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_resource_allocation       a11 
 join ldb.d_internal_contact       a12
on (a11.employee_key = a12.row_key)
join ldb.d_internal_contact_mdm       a13
on (a12.row_current_key = a13.row_current_key)
join ldb.d_resource_primary_skill       a14
on (a13.primary_skill_key = a14.row_key)


