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
select 'ldb.d_incident_environment_c a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_environment_list_c a11
join ldb.d_incident_environment_c a14
on (a11.incident_environment_c_key = a14.row_key)
union
select 'ldb.d_incident a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_environment_list_c a11
join ldb.d_incident a15
on (a11.incident_key = a15.row_key)
union
select 'ldb.d_lov_segment_type_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_environment_list_c a11
join ldb.d_segment_c a12
on (a11.segment_c_key = a12.row_key)
join ldb.d_lov_segment_type_c a16
on (a12.segment_type_c_key = a16.row_key)
union
select 'ldb.d_incident_tribe_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_environment_list_c a11
join ldb.d_incident a15
on (a11.incident_key = a15.row_key) join ldb.d_configuration_item_incident a16
on (a15.configuration_item_key = a16.row_key) join ldb.d_incident_configuration_item_mdm a17
on (a16.mdm_key = a17.row_key)
join ldb.d_incident_tribe_c a19
on (a17.incident_tribe_c_key = a19.row_key)