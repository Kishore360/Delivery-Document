select 'ldb.f_project_cost' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_project_cost       a11 
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_project_cost       a11 
join ldb.d_calendar_date       a12
on (a11.calendar_date_key = a12.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_project_cost       a11 
 join ldb.d_calendar_date       a12
on (a11.calendar_date_key = a12.row_key)
join ldb.d_calendar_month       a13
on (a12.month_start_date_key = a13.row_key)
union
select'ldb.d_calendar_quarter' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_project_cost       a11 
  join ldb.d_calendar_date       a12
on (a11.calendar_date_key = a12.row_key)
join ldb.d_calendar_month       a13
on (a12.month_start_date_key = a13.row_key)
join ldb.d_calendar_quarter       a14
on (a13.quarter_start_date_key = a14.row_key)
union
select'ldb.d_project' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_project_cost       a11 
join ldb.d_project       a15
on (a11.project_key = a15.row_key)
union
select'ldb.d_project_parent_project' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_project_cost       a11 
 join ldb.d_project       a15
on (a11.project_key = a15.row_key)
join ldb.d_project_parent_project       a16
on (a15.parent_project_key = a16.row_key)
union
select'ldb.d_project_top_project' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_project_cost       a11 
 join ldb.d_project       a15
on (a11.project_key = a15.row_key)
join ldb.d_project_top_project       a17
on (a15.top_project_key = a17.row_key)
union
select'ldb.d_internal_organization_legalentity' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_project_cost       a11 
join ldb.d_internal_organization_legalentity       a18
on (a11.company_key = a18.row_key)
union
select'ldb.d_domain' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_project_cost       a11 
join ldb.d_domain       a19
on (a11.domain_key = a19.row_key)
union
select'ldb.d_portfolio' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_project_cost       a11 
join ldb.d_portfolio       a110
on (a11.portfolio_key = a110.row_key)
union
select'ldb.d_program' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_project_cost       a11 
join ldb.d_program       a111
on (a11.program_key = a111.row_key)
union
select'ldb.d_project_cost_plan' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_project_cost       a11 
join ldb.d_project_cost_plan       a112
on (a11.project_cost_plan_key = a112.row_key)
union
select'ldb.d_lov_project_cost_type_view' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_project_cost       a11 
join ldb.d_lov_project_cost_type_view       a113
on (a11.project_cost_type_key = a113.row_key)
union
select'ldb.d_lov_project_expense_type_view' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_project_cost       a11 
join ldb.d_lov_project_expense_type_view       a114
on (a11.project_expense_type_key = a114.row_key)
union
select'ldb.d_calendar_week' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_project_cost       a11 
 join ldb.d_calendar_date       a12
on (a11.calendar_date_key = a12.row_key)
join ldb.d_calendar_week       a115
on (a12.week_start_date_key = a115.row_key)
union
select'ldb.d_calendar_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_project_cost       a11 
   join ldb.d_calendar_date       a12
on (a11.calendar_date_key = a12.row_key)
join ldb.d_calendar_month       a13
on (a12.month_start_date_key = a13.row_key)
join ldb.d_calendar_quarter       a14
on (a13.quarter_start_date_key = a14.row_key)
join ldb.d_calendar_year       a116
on (a14.year_start_date_key = a116.row_key)

