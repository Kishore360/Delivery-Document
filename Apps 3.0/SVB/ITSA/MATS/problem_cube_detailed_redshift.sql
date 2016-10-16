 select'f_problem' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
 union
 select'd_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_problem_state_c         a12
on (a11.state_src_key = a12.row_key)