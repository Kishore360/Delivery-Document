select 'ldb.f_catalog_audit_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_catalog_audit_c a11 
union
select 'ldb.d_master_item a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_catalog_audit_c a11 
join ldb.d_master_item a12 
on (a11.master_item_key = a12.row_key) 
union
select 'ldb.d_internal_contact_user_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_catalog_audit_c a11 
join ldb.d_internal_contact_user_c a13 
on (a11.user_c_key = a13.row_key) 
union
select 'ldb.d_catalog_c a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_catalog_audit_c a11 
join ldb.d_catalog_c a14 
on (a11.catalog_c_key = a14.row_key) 
union
select 'ldb.d_request_item a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_catalog_audit_c a11 
join ldb.d_request_item a15 
on (a11.request_item_key = a15.row_key) 