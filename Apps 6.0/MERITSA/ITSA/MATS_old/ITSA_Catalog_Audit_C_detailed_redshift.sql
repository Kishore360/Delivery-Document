select 'ldb.f_catalog_audit_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_catalog_audit_c       a11 
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_catalog_audit_c       a11 
join ldb.d_internal_contact       a12
on (a11.user_c_key=a12.row_key)
union
select'ldb.d_request_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_catalog_audit_c       a11 
join ldb.d_request_item       a12
on (a11.request_item_key=a12.row_key)

