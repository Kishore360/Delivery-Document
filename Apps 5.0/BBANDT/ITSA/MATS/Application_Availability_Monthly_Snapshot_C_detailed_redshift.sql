select 'ldb.f_n_application_availability_snapshot_monthly_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_application_availability_snapshot_monthly_c a11
union
select 'ldb.d_archer_application_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_application_availability_snapshot_monthly_c a11
join ldb.d_archer_application_c a12
on (a11.application_archer_c_key = a12.row_key)
union
select 'ldb.d_software_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_application_availability_snapshot_monthly_c a11
join ldb.d_software_c a13
on (a11.archer_id_c_key = a13.row_key)