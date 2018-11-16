select 'ldb.f_work_item_iteration' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_work_item_iteration  a11 
union
select'ldb.d_work_item_iteration_m2m' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_work_item_iteration  a11 
join ldb.d_work_item_iteration_m2m  a12
on (a11.work_item_iteration_m2m_key=a12.row_key)
union
select'ldb.d_work_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_work_item_iteration  a11 
join ldb.d_work_item  a13
on (a11.work_item_key=a13.row_key)
union
select'ldb.d_work_item_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_work_item_iteration  a11 
 join ldb.d_work_item  a13
on (a11.work_item_key=a13.row_key)
join ldb.d_work_item_priority  a14
on (a13.work_item_priority_src_key=a14.row_key)
union
select'ldb.d_work_item_resolved_by' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_work_item_iteration  a11
join ldb.d_work_item  a13
on (a11.work_item_key=a13.row_key) 
join ldb.d_work_item_resolved_by  a15
on (a13.work_item_resolved_by_key=a15.row_key)
union
select'ldb.d_work_item_status' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_work_item_iteration  a11 
 join ldb.d_work_item  a13
on (a11.work_item_key=a13.row_key)
join ldb.d_work_item_status  a16
on (a13.work_item_status_src_key=a16.row_key)
