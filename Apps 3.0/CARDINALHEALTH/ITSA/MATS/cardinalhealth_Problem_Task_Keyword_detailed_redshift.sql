select'ldb.f_problem_task_keyword_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task_keyword_c          a11 
union
select'ldb.d_problem_task' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task_keyword_c          a11 
join ldb.d_problem_task         a13
on (a11.problem_task_key=a13.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task_keyword_c          a11 
join ldb.d_calendar_date         a14
on (a11.opened_on_key=a14.row_key)
union
select'ldb.d_calendar_greg_fiscal_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task_keyword_c          a11 
join ldb.d_calendar_greg_fiscal_c         a15
on (a11.opened_on_key=a15.greogrian_calendar_key)
union
select'ldb.d_calendar_date_fiscal' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task_keyword_c          a11
join ldb.d_calendar_greg_fiscal_c         a15
on (a11.opened_on_key=a15.greogrian_calendar_key) 
join ldb.d_calendar_date_fiscal         a16
on (a15.fiscal_key=a16.row_key)
union
select'ldb.d_problem' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task_keyword_c          a11 
join ldb.d_problem         a17
on (a11.problem_key=a17.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task_keyword_c          a11 
join ldb.d_internal_organization_group         a18
on (a11.assignment_group_key=a18.row_key)
union
select'ldb.d_problem_task_reported_type' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task_keyword_c          a11 
join ldb.d_problem_task_reported_type         a19
on (a11.reported_type_src_key=a19.row_key)
union
select'ldb.d_calendar_fiscal_period' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task_keyword_c          a11
join ldb.d_calendar_greg_fiscal_c         a15
on (a11.opened_on_key=a15.greogrian_calendar_key) 
join ldb.d_calendar_date_fiscal         a16
on (a15.fiscal_key=a16.row_key) 
join ldb.d_calendar_fiscal_period        a110
on (a16.period_start_date_key=a110.row_key)
union
select'ldb.d_calendar_fiscal_quarter' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task_keyword_c          a11
join ldb.d_calendar_greg_fiscal_c         a15
on (a11.opened_on_key=a15.greogrian_calendar_key) 
join ldb.d_calendar_date_fiscal         a16
on (a15.fiscal_key=a16.row_key) 
join ldb.d_calendar_fiscal_quarter        a111
on (a16.quarter_start_date_key=a111.row_key)
union
select'ldb.d_calendar_fiscal_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task_keyword_c          a11
join ldb.d_calendar_greg_fiscal_c         a15
on (a11.opened_on_key=a15.greogrian_calendar_key) 
join ldb.d_calendar_date_fiscal         a16
on (a15.fiscal_key=a16.row_key) 
join ldb.d_calendar_fiscal_year        a112
on (a16.year_start_date_key=a112.row_key)
