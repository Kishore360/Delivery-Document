select 'ldb.f_incident_resolved a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
union
select 'ldb.d_configuration_item a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
union
select 'ldb.d_incident a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_incident a13
on (a11.incident_key = a13.row_key)
union
select 'ldb.d_configuration_item_incident a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_incident a13
on (a11.incident_key = a13.row_key)
join ldb.d_configuration_item_incident a14
on (a13.configuration_item_key = a14.row_key)
union
select 'ldb.d_segment_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_segment_c a15
on (a11.segment_c_key = a15.row_key)
union
select 'ldb.d_incident_configuration_item_mdm a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_incident a13
on (a11.incident_key = a13.row_key) join ldb.d_configuration_item_incident a14
on (a13.configuration_item_key = a14.row_key)
join ldb.d_incident_configuration_item_mdm a16
on (a14.mdm_key = a16.row_key)
union
select 'ldb.d_configuration_item_mdm a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_configuration_item_mdm a17
on (a12.mdm_key = a17.row_key)
union
select 'ldb.d_incident_priority a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_incident a13
on (a11.incident_key = a13.row_key)
join ldb.d_incident_priority a18
on (a13.priority_src_key = a18.row_key)
union
select 'ldb.d_lov_incident_status_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_incident a13
on (a11.incident_key = a13.row_key)
join ldb.d_lov_incident_status_c a19
on (a13.incident_status_c_key = a19.row_key)
union
select 'ldb.d_lov_segment_type_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_segment_c a15
on (a11.segment_c_key = a15.row_key)
join ldb.d_lov_segment_type_c a110
on (a15.segment_type_c_key = a110.row_key)
union
select 'ldb.d_incident_tribe_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_incident a13
on (a11.incident_key = a13.row_key) join ldb.d_configuration_item_incident a14
on (a13.configuration_item_key = a14.row_key) join ldb.d_incident_configuration_item_mdm a16
on (a14.mdm_key = a16.row_key)
join ldb.d_incident_tribe_c a111
on (a16.incident_tribe_c_key = a111.row_key)
