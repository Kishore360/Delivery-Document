select 'ldb.f_incident_environment_list_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_environment_list_c a11
union
select 'ldb.d_segment_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_environment_list_c a11
join ldb.d_segment_c a12
on (a11.segment_c_key = a12.row_key)
union
select 'ldb.d_environment_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_environment_list_c a11
join ldb.d_environment_c a13
on (a11.environment_c_key = a13.row_key)
union
select 'ldb.d_incident a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_environment_list_c a11
join ldb.d_incident a14
on (a11.incident_key = a14.row_key)
union
select 'ldb.d_incident_environment_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_environment_list_c a11
join ldb.d_incident_environment_c a15
on (a11.incident_env_c_key = a15.row_key)
union
select 'ldb.d_incident_environment_list_tribe_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_environment_list_c a11
join ldb.d_incident_environment_list_tribe_c a16
on (a11.tribe_c_key = a16.row_key)
union
select 'ldb.d_lov_segment_type_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_environment_list_c a11
join ldb.d_segment_c a12
on (a11.segment_c_key = a12.row_key)
join ldb.d_lov_segment_type_c a17
on (a12.segment_type_c_key = a17.row_key)