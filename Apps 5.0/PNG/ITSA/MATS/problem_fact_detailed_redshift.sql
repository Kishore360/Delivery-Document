select 'ldb.f_problem' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
union
select'ldb.d_lov_problem_category_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
join ldb.d_lov_problem_category_c       a12
on (a11.category_src_key = a12.row_key)