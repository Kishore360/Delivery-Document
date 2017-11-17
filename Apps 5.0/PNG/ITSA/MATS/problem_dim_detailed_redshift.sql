select 'ldb.d_problem' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.d_problem       a11 
union
select'ldb.d_lov_problem_root_cause_code_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.d_problem       a11 
join ldb.d_lov_problem_root_cause_code_c       a12
on (a11.root_cause_code_src_c_key = a12.row_key)