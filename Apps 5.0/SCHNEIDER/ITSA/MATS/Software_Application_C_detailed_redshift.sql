select 'ldb.f_user_ci_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_user_ci_c a11 
union
select 'ldb.d_asset a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_user_ci_c a11 
join ldb.d_asset a12 
on (a11.asset_key = a12.row_key) 
union
select 'ldb.d_internal_contact a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_user_ci_c a11 
join ldb.d_internal_contact a13 
on (a11.user_c_key = a13.row_key) 
union
select 'ldb.d_asset_master_asset_c a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_user_ci_c a11 
join ldb.d_asset a12 
on (a11.asset_key = a12.row_key) 
join ldb.d_asset_master_asset_c a14 
on (a12.bmc_asset_c_key = a14.row_key) 
union
select 'ldb.d_internal_contact_master_employee_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_user_ci_c a11 
join ldb.d_internal_contact a13 
on (a11.user_c_key = a13.row_key) 
join ldb.d_internal_contact_master_employee_c a15 
on (a13.bmc_row_key_c = a15.row_key) 
