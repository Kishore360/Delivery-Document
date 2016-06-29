
 select'f_request_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
 union
 select 'requested_for_c' as Table_Name, count(a11.row_key) Row_Count from 
ldb.f_request_item a11
 join ldb.d_internal_contact_variable_requested_for_c a12
   on  (a11.request_item_key = a12.row_key and 
 a11.requested_for_c_key = a12.row_key)
union
select 'user_manager_c' as Table_Name, count(a11.row_key) Row_Count from 
ldb.f_request_item a11
 join ldb.d_internal_contact_variable_user_manager_c a12
   on  (a11.request_item_key = a12.row_key and 
 a11.user_manager_c_key = a12.row_key)
 union
select 'user_budget_owner_c' as Table_Name, count(a11.row_key) Row_Count from
ldb.f_request_item a11
 join ldb.d_internal_contact_variable_user_budget_owner_c a12
   on  (a11.request_item_key = a12.row_key and 
 a11.user_budget_owner_c_key = a12.row_key)
