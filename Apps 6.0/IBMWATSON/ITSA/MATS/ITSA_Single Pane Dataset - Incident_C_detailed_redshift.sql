select 'ldb.f_incident a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
union
select 'ldb.d_configuration_item a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
union
select 'ldb.d_segment_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_segment_c a13
on (a11.segment_c_key = a13.row_key)
union
select 'ldb.d_calendar_date a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_date a14
on (a11.date_key = a14.row_key)
union
select 'ldb.d_incident a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a15
on (a11.incident_key = a15.row_key)
union
select 'ldb.d_incident_date a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident_date a16
on (a11.incident_date_key = a16.row_key)
union
select 'ldb.d_incident_calendar_month a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident_date a16
on (a11.incident_date_key = a16.row_key)
join ldb.d_incident_calendar_month a17
on (a16.month_start_date_key = a17.row_key)
union
select 'ldb.d_configuration_item_incident a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a15
on (a11.incident_key = a15.row_key)
join ldb.d_configuration_item_incident a18
on (a15.configuration_item_key = a18.row_key)
union
select 'ldb.d_incident_configuration_item_mdm a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a15
on (a11.incident_key = a15.row_key) join ldb.d_configuration_item_incident a18
on (a15.configuration_item_key = a18.row_key)
join ldb.d_incident_configuration_item_mdm a19
on (a18.mdm_key = a19.row_key)
union
select 'ldb.d_calendar_month a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_date a14
on (a11.date_key = a14.row_key)
join ldb.d_calendar_month a110
on (a14.month_start_date_key = a110.row_key)
union
select 'ldb.d_configuration_item_mdm a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_configuration_item_mdm a111
on (a12.mdm_key = a111.row_key)
union
select 'ldb.d_internal_contact_general_manager_c a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_segment_c a13
on (a11.segment_c_key = a13.row_key)
join ldb.d_internal_contact_general_manager_c a112
on (a13.general_manager_c_key = a112.row_key)
union
select 'ldb.d_lov_segment_type_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_segment_c a13
on (a11.segment_c_key = a13.row_key)
join ldb.d_lov_segment_type_c a113
on (a13.segment_type_c_key = a113.row_key)
union
select 'ldb.d_incident_priority a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a15
on (a11.incident_key = a15.row_key)
join ldb.d_incident_priority a114
on (a15.priority_src_key = a114.row_key)
union
select 'ldb.d_incident_state a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a15
on (a11.incident_key = a15.row_key)
join ldb.d_incident_state a115
on (a15.state_src_key = a115.row_key)
union
select 'ldb.d_lov_incident_status_c a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a15
on (a11.incident_key = a15.row_key)
join ldb.d_lov_incident_status_c a116
on (a15.incident_status_c_key = a116.row_key)
union
select 'ldb.d_incident_tribe_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a15
on (a11.incident_key = a15.row_key) join ldb.d_configuration_item_incident a18
on (a15.configuration_item_key = a18.row_key) join ldb.d_incident_configuration_item_mdm a19
on (a18.mdm_key = a19.row_key)
join ldb.d_incident_tribe_c a117
on (a19.incident_tribe_c_key = a117.row_key)
