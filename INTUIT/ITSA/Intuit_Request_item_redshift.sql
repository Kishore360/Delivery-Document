SELECT CASE WHEN max_count<>min_count THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN  max_count<>min_count THEN 'OOTB has Keys Dropped' ELSE 'SUCCESS'  END as Message FROM (
 select max(Row_Count) max_count,Min(Row_Count) min_count from (
select 'ldb.f_request_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
union
select 'ldb.dh_user_group_classification_hierarchy' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
left outer join ldb.dh_user_group_classification_hierarchy         a15
on (a11.assignment_group_key = a15.user_group_key)
union
select 'ldb.dh_user_group_classification_hierarchy_level1' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
 left outer join ldb.dh_user_group_classification_hierarchy         a15
on (a11.assignment_group_key = a15.user_group_key)
left outer join ldb.dh_user_group_classification_hierarchy_level1         a16
on (a15.user_group_classification_level1 = a16.user_group_level1_key)
union
select 'ldb.d_request_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
left outer join ldb.d_request_item         a17
on (a11.request_item_key = a17.row_key)
union
select 'ldb.d_task_contacttype_req_item_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
left outer join ldb.d_task_contacttype_req_item_c         a111
on (a11.reported_type_src_c_key = a111.row_key)
union
select 'ldb.d_request' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
left outer join ldb.d_request         a113
on (a11.request_key = a113.row_key)
union
select 'ldb.d_internal_contact_manager_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
 left outer join ldb.d_internal_contact         a14
on (a11.assigned_to_key = a14.row_key)
left outer join ldb.d_internal_contact_manager_c         a119
on (a14.manager_c_key = a119.row_key)
)a
)b