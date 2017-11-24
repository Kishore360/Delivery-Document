select'ldb.d_internal_organization_change_request_ci_approval_group_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_internal_organization_change_request_ci_approval_group_c       a12
on (a11.approval_group_c_key = a12.row_key)


union
select'ldb.d_internal_contact_change_request_ci_owned_by_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_internal_contact_change_request_ci_owned_by_c       a12
on (a11.owned_by_c_key = a12.row_key)



union
select'ldb.d_internal_contact_change_request_manager_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_internal_contact_change_request_manager_c       a12
on (a11.change_manager_c_key = a12.row_key)
union
select'ldb.f_change_request' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11
 union
 select'ldb.d_configuration_item_change_request_service_offering_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_configuration_item_change_request_service_offering_c       a12
on (a11.service_offering_c_key = a12.row_key)