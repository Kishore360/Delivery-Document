select 'ldb.f_incident_new_state_duration_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_new_state_duration_c a11
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_new_state_duration_c a11
join ldb.d_calendar_date a12
on (a11.opened_on_key = a12.row_key)
union
select 'ldb.d_segment_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_new_state_duration_c a11
join ldb.d_segment_c a13
on (a11.segment_c_key = a13.row_key)
union
select 'ldb.d_incident a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_new_state_duration_c a11
join ldb.d_incident a14
on (a11.incident_key = a14.row_key)
union
select 'ldb.d_calendar_month a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_new_state_duration_c a11
join ldb.d_calendar_date a12
on (a11.opened_on_key = a12.row_key)
join ldb.d_calendar_month a15
on (a12.month_start_date_key = a15.row_key)
union
select 'ldb.d_configuration_item a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_new_state_duration_c a11
join ldb.d_configuration_item a16
on (a11.configuration_item_key = a16.row_key)
union
select 'ldb.d_incident_state_from a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_new_state_duration_c a11
join ldb.d_incident_state_from a17
on (a11.from_state_src_key = a17.row_key)
union
select 'ldb.d_incident_new_state_duration_tribe_c a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_new_state_duration_c a11
join ldb.d_incident_new_state_duration_tribe_c a18
on (a11.tribe_c_key = a18.row_key)
union
select 'ldb.d_incident_state_to a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_new_state_duration_c a11
join ldb.d_incident_state_to a19
on (a11.to_state_src_key = a19.row_key)
union
select 'ldb.d_lov_segment_type_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_new_state_duration_c a11
join ldb.d_segment_c a13
on (a11.segment_c_key = a13.row_key)
join ldb.d_lov_segment_type_c a110
on (a13.segment_type_c_key = a110.row_key)
union
select 'ldb.d_incident_priority a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_new_state_duration_c a11
join ldb.d_incident_priority a111
on (a11.priority_src_key = a111.row_key)