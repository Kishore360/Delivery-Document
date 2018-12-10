select 'ldb.f_work_item_status' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_work_item_status       a11 
union
select'ldb.d_work_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_work_item_status       a11 
join ldb.d_work_item       a12
on (a11.work_item_key = a12.row_key)
union
select'ldb.d_work_item_epic' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_work_item_status       a11
 join ldb.d_work_item       a12
on (a11.work_item_key = a12.row_key)
join ldb.d_work_item_epic       a13
on (a12.work_item_epic_key = a13.row_key)
union
select'ldb.d_project' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_work_item_status       a11 
 join ldb.d_work_item       a12
on (a11.work_item_key = a12.row_key)
join ldb.d_project       a14
on (a11.project_key = a14.row_key)
union
select'ldb.d_work_item_status_from' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_work_item_status       a11
 join ldb.d_work_item       a12
on (a11.work_item_key = a12.row_key)
join ldb.d_work_item_status_from       a15
on (a11.work_item_from_state_src_key = a15.row_key)
union
select'ldb.d_work_item_status_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_work_item_status       a11 
 join ldb.d_work_item       a12
on (a11.work_item_key = a12.row_key)
join ldb.d_work_item_status_to       a16
on (a11.work_item_to_state_src_key = a16.row_key)
union
select'ldb.d_work_item_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_work_item_status       a11
 join ldb.d_work_item       a12
on (a11.work_item_key = a12.row_key)
join ldb.d_work_item_assigned_to       a17
on (a12.work_item_assigned_to_key = a17.row_key)
union
select'ldb.d_work_item_earliest_fixed_version' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_work_item_status       a11 
 join ldb.d_work_item       a12
on (a11.work_item_key = a12.row_key)
join ldb.d_work_item_earliest_fixed_version       a18
on (a12.earliest_fixed_version_key = a18.row_key)
union
select'ldb.d_iteration' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_work_item_status       a11 
 join ldb.d_work_item       a12
on (a11.work_item_key = a12.row_key)
join ldb.d_iteration       a19
on (a12.iteration_key = a19.row_key)
union
select'ldb.d_work_item_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_work_item_status       a11 
 join ldb.d_work_item       a12
on (a11.work_item_key = a12.row_key)
join ldb.d_work_item_priority       a110
on (a12.work_item_priority_src_key = a110.row_key)
union
select'ldb.d_work_item_status' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_work_item_status       a11 
 join ldb.d_work_item       a12
on (a11.work_item_key = a12.row_key)
join ldb.d_work_item_status       a111
on (a12.work_item_status_src_key = a111.row_key)
union
select'ldb.d_work_item_status_category' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_work_item_status       a11
 join ldb.d_work_item       a12
on (a11.work_item_key = a12.row_key)
join ldb.d_work_item_status_category       a112
on (a12.work_item_status_category_src_key = a112.row_key)
