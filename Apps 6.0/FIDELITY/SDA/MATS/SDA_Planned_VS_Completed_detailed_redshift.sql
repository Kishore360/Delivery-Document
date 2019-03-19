select 'ldb.f_work_item_plan_complete_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_work_item_plan_complete_c  a11 
union
select'ldb.d_work_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_work_item_plan_complete_c  a11 
join ldb.d_work_item  a12
on (a11.work_item_key = a12.row_key)
union
select'ldb.d_work_item_iteration_m2m' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_work_item_plan_complete_c  a11 
join ldb.d_work_item_iteration_m2m  a13
on (a11.work_item_iteration_m2m_key_c = a13.row_key)

