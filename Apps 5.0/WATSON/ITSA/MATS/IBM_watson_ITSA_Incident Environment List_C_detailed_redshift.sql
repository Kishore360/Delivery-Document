select 'ldb.f_incident_environment_list_c a11' as Table_name, count(a11.row_key) Row_count
from ldb.f_incident_environment_list_c a11
union
select 'ldb.d_environment_c a12' as Table_name, count(a11.row_key) Row_count
from ldb.f_incident_environment_list_c a11
join ldb.d_environment_c a12
on (a11.environment_c_key = a12.row_key)
union
select 'ldb.d_incident  a13' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_environment_list_c a11
join ldb.d_incident  a13
on (a11.incident_key = a13.row_key)
