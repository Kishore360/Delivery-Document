select 'ldb.f_cmdb_ci_website_c_fact a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cmdb_ci_website_c_fact a11 
union
select 'ldb.d_location a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cmdb_ci_website_c_fact a11 
join ldb.d_location a12 
on (a11.location_key = a12.row_key) 
union
select 'ldb.d_cmdb_ci_website_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cmdb_ci_website_c_fact a11 
join ldb.d_cmdb_ci_website_c a13 
on (a11.cmdb_ci_website_c_key = a13.row_key) 
union
select 'ldb.d_configuration_item a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cmdb_ci_website_c_fact a11 
join ldb.d_cmdb_ci_website_c a13 
on (a11.cmdb_ci_website_c_key = a13.row_key) 
join ldb.d_configuration_item a14 
on (a13.configuration_item_c_key = a14.row_key) 
union
select 'ldb.d_internal_organization_department a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cmdb_ci_website_c_fact a11 
join ldb.d_internal_organization_department a15 
on (a11.department_key = a15.row_key) 
union
select 'ldb.d_website_vendor_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cmdb_ci_website_c_fact a11 
join ldb.d_website_vendor_c a16 
on (a11.website_vendor_c_key = a16.row_key) 
union
select 'ldb.d_lov_business_critical_website_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cmdb_ci_website_c_fact a11 
join ldb.d_cmdb_ci_website_c a13 
on (a11.cmdb_ci_website_c_key = a13.row_key) 
join ldb.d_lov_business_critical_website_c a17 
on (a13.web_business_critical_c_key = a17.row_key) 
union
select 'ldb.d_lov_environment_website_c a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cmdb_ci_website_c_fact a11 
join ldb.d_cmdb_ci_website_c a13 
on (a11.cmdb_ci_website_c_key = a13.row_key) 
join ldb.d_lov_environment_website_c a18 
on (a13.pg_environment_c_key = a18.row_key) 
union
select 'ldb.d_lov_install_status_website_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cmdb_ci_website_c_fact a11 
join ldb.d_cmdb_ci_website_c a13 
on (a11.cmdb_ci_website_c_key = a13.row_key) 
join ldb.d_lov_install_status_website_c a19 
on (a13.website_install_status_c_key = a19.row_key) 
