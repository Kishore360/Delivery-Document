select 'ldb.f_application_infra_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_infra_c a11
union
select 'ldb.d_application_infra_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_infra_c a11
join ldb.d_application_infra_c a12
on (a11.application_infra_key = a12.row_key)
union
select 'ldb.d_archer_application_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_infra_c a11
join ldb.d_archer_application_c a13
on (a11.archer_application_c_key = a13.row_key)
union
select 'ldb.d_configuration_item a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_infra_c a11
join ldb.d_configuration_item a14
on (a11.cmdb_ci_key = a14.row_key)