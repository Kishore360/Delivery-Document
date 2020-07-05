select 'ldb.f_incident_new_state_duration_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_new_state_duration_c a11
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_new_state_duration_c a11
join ldb.d_calendar_date a12
on (a11.opened_on_key = a12.row_key)
union
select 'ldb.d_configuration_item a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_new_state_duration_c a11
join ldb.d_configuration_item a13
on (a11.configuration_item_key = a13.row_key)
union
select 'ldb.d_calendar_month a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_new_state_duration_c a11
join ldb.d_calendar_date a12
on (a11.opened_on_key = a12.row_key)
join ldb.d_calendar_month a14
on (a12.month_start_date_key = a14.row_key)
union
select 'ldb.d_segment_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_new_state_duration_c a11
join ldb.d_segment_c a15
on (a11.segment_c_key = a15.row_key)
union
select 'ldb.d_incident_activity_date a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_new_state_duration_c a11
join ldb.d_incident_activity_date a16
on (a11.incident_activity_date_key = a16.row_key)
union
select 'ldb.d_incident_activity_calendar_month a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_new_state_duration_c a11
join ldb.d_incident_activity_date a16
on (a11.incident_activity_date_key = a16.row_key)
join ldb.d_incident_activity_calendar_month a17
on (a16.month_start_date_key = a17.row_key)
union
select 'ldb.d_incident a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_new_state_duration_c a11
join ldb.d_incident a18
on (a11.incident_key = a18.row_key)
union
select 'ldb.d_configuration_item_incident a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_new_state_duration_c a11
join ldb.d_incident a18
on (a11.incident_key = a18.row_key)
join ldb.d_configuration_item_incident a19
on (a18.configuration_item_key = a19.row_key)
union
select 'ldb.d_incident_configuration_item_mdm a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_new_state_duration_c a11
join ldb.d_incident a18
on (a11.incident_key = a18.row_key) join ldb.d_configuration_item_incident a19
on (a18.configuration_item_key = a19.row_key)
join ldb.d_incident_configuration_item_mdm a110
on (a19.mdm_key = a110.row_key)
union
select 'ldb.d_configuration_item_mdm a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_new_state_duration_c a11
join ldb.d_configuration_item a13
on (a11.configuration_item_key = a13.row_key)
join ldb.d_configuration_item_mdm a111
on (a13.mdm_key = a111.row_key)
union
select 'ldb.d_incident_state_from a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_new_state_duration_c a11
join ldb.d_incident_state_from a112
on (a11.from_state_src_key = a112.row_key)
union
select 'ldb.d_incident_state_to a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_new_state_duration_c a11
join ldb.d_incident_state_to a113
on (a11.to_state_src_key = a113.row_key)
union
select 'ldb.d_lov_segment_type_c a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_new_state_duration_c a11
join ldb.d_segment_c a15
on (a11.segment_c_key = a15.row_key)
join ldb.d_lov_segment_type_c a114
on (a15.segment_type_c_key = a114.row_key)
union
select 'ldb.d_incident_priority a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_new_state_duration_c a11
join ldb.d_incident a18
on (a11.incident_key = a18.row_key)
join ldb.d_incident_priority a115
on (a18.priority_src_key = a115.row_key)
union
select 'ldb.d_incident_tribe_c a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_new_state_duration_c a11
join ldb.d_incident a18
on (a11.incident_key = a18.row_key) join ldb.d_configuration_item_incident a19
on (a18.configuration_item_key = a19.row_key) join ldb.d_incident_configuration_item_mdm a110
on (a19.mdm_key = a110.row_key)
join ldb.d_incident_tribe_c a116
on (a110.incident_tribe_c_key = a116.row_key)