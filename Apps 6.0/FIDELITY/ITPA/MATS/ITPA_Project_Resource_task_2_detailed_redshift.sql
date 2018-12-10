select 'ldb.f_resource_time_card' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_resource_time_card       a11 
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_resource_time_card       a11 
join ldb.d_calendar_date       a12
on (a11.date_key = a12.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_resource_time_card       a11 
 join ldb.d_calendar_date       a12
on (a11.date_key = a12.row_key)
join ldb.d_calendar_month       a13
on (a12.month_start_date_key = a13.row_key)
union
select'ldb.d_calendar_quarter' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_resource_time_card       a11 
 join ldb.d_calendar_date       a12
on (a11.date_key = a12.row_key)
join ldb.d_calendar_month       a13
on (a12.month_start_date_key = a13.row_key)
join ldb.d_calendar_quarter       a14
on (a13.quarter_start_date_key = a14.row_key)
union
select'ldb.d_calendar_week' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_resource_time_card       a11 
 join ldb.d_calendar_date       a12
on (a11.date_key = a12.row_key)
join ldb.d_calendar_week       a13
on (a12.week_start_date_key = a13.row_key)
union
select'ldb.d_calendar_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_resource_time_card       a11 
 join ldb.d_calendar_date       a12
on (a11.date_key = a12.row_key)
join ldb.d_calendar_month       a13
on (a12.month_start_date_key = a13.row_key)
join ldb.d_calendar_quarter       a14
on (a13.quarter_start_date_key = a14.row_key)
join ldb.d_calendar_year       a15
on (a14.year_start_date_key = a15.row_key)
union
select'ldb.d_demand' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_resource_time_card       a11 
join ldb.d_demand       a12
on (a11.demand_key = a12.row_key)
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_resource_time_card       a11 
join ldb.d_internal_contact       a12
on (a11.employee_key = a12.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_resource_time_card       a11 
 join ldb.d_internal_contact       a12
on (a11.employee_key = a12.row_key)
join ldb.d_internal_contact_mdm       a13
on (a12.row_current_key = a13.row_current_key)
union
select'ldb.d_employee_location' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_resource_time_card       a11 
 join ldb.d_internal_contact       a12
on (a11.employee_key = a12.row_key)
join ldb.d_internal_contact_mdm       a13
on (a12.row_current_key = a13.row_current_key)
join ldb.d_employee_location       a14
on (a13.location_key = a14.row_key)
union
select'ldb.d_internal_contact_employment_type' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_resource_time_card       a11 
 join ldb.d_internal_contact       a12
on (a11.employee_key = a12.row_key)
join ldb.d_internal_contact_mdm       a13
on (a12.row_current_key = a13.row_current_key)
join ldb.d_internal_contact_employment_type       a14
on (a13.employment_type_src_key = a14.row_key)
union
select'ldb.d_internal_contact_manager' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_resource_time_card       a11 
 join ldb.d_internal_contact       a12
on (a11.employee_key = a12.row_key)
join ldb.d_internal_contact_mdm       a13
on (a12.row_current_key = a13.row_current_key)
join ldb.d_internal_contact_manager       a14
on (a13.manager_key = a14.row_key)
union
select'ldb.d_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_resource_time_card       a11 
 join ldb.d_internal_contact       a12
on (a11.employee_key = a12.row_key)
join ldb.d_internal_organization_department       a13
on (a12.department_key = a13.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_resource_time_card       a11 
join ldb.d_internal_organization_group       a12
on (a11.group_resource_key= a12.row_key)
union
select'ldb.d_lov_project_resource_type_view' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_resource_time_card       a11 
 join ldb.d_internal_contact       a12
on (a11.employee_key = a12.row_key)
join ldb.d_internal_contact_mdm       a13
on (a12.row_current_key = a13.row_current_key)
join ldb.d_lov_project_resource_type_view       a14
on (a13.project_resource_type_src_key = a14.row_key)
union
select'ldb.d_portfolio' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_resource_time_card       a11 
join ldb.d_portfolio       a12
on (a11.portfolio_key= a12.row_key)
union
select'ldb.d_program' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_resource_time_card       a11 
join ldb.d_program       a12
on (a11.program_key= a12.row_key)
union
select'ldb.d_project' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_resource_time_card       a11 
join ldb.d_project       a12
on (a11.project_key= a12.row_key)
union
select'ldb.d_project_parent_project' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_resource_time_card       a11 
 join ldb.d_project       a12
on (a11.project_key= a12.row_key)
join ldb.d_project_parent_project       a13
on (a12.parent_project_key= a13.row_key)
union
select'ldb.d_project_task' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_resource_time_card       a11 
join ldb.d_project_task       a12
on (a11.project_task_key= a12.row_key)
union
select'ldb.d_project_top_project' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_resource_time_card       a11 
 join ldb.d_project       a12
on (a11.project_key= a12.row_key)
join ldb.d_project_top_project       a13
on (a12.top_project_key= a13.row_key)
union
select'ldb.d_resource_plan' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_resource_time_card       a11 
join ldb.d_resource_plan       a12
on (a11.resource_plan_key= a12.row_key)
union
select'ldb.d_resource_primary_role' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_resource_time_card       a11 
 join ldb.d_internal_contact       a12
on (a11.employee_key = a12.row_key)
join ldb.d_internal_contact_mdm       a13
on (a12.row_current_key = a13.row_current_key)
join ldb.d_resource_primary_skill       a14
on (a13.primary_skill_key = a14.row_key)
union
select'ldb.d_resource_role' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_resource_time_card       a11 
join ldb.d_resource_role       a12
on (a11.resource_role_key= a12.row_key)