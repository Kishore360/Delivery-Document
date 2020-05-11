select 'ldb.f_incident_state a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_state a11
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_state a11
join ldb.d_calendar_date a12
on (a11.date_key = a12.row_key)
union
select 'ldb.d_configuration_item a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_state a11
join ldb.d_configuration_item a13
on (a11.configuration_item_key = a13.row_key)
union
select 'ldb.d_segment_c a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_state a11
join ldb.d_segment_c a14
on (a11.segment_c_key = a14.row_key)
union
select 'ldb.d_internal_contact_assigned_to a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_state a11
join ldb.d_internal_contact_assigned_to a15
on (a11.assigned_to_key = a15.row_key)
union
select 'ldb.d_internal_organization_group a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_state a11
join ldb.d_internal_organization_group a16
on (a11.assignment_group_key = a16.row_key)
union
select 'ldb.d_incident a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_state a11
join ldb.d_incident a17
on (a11.incident_key = a17.row_key)
union
select 'ldb.d_parent_incident a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_state a11
join ldb.d_incident a17
on (a11.incident_key = a17.row_key)
join ldb.d_parent_incident a18
on (a17.parent_incident_key = a18.row_key)
union
select 'ldb.d_calendar_month a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_state a11
join ldb.d_calendar_date a12
on (a11.date_key = a12.row_key)
join ldb.d_calendar_month a19
on (a12.month_start_date_key = a19.row_key)
union
select 'ldb.d_configuration_item_mdm a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_state a11
join ldb.d_configuration_item a13
on (a11.configuration_item_key = a13.row_key)
join ldb.d_configuration_item_mdm a110
on (a13.mdm_key = a110.row_key)
union
select 'ldb.d_incident_state_from a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_state a11
join ldb.d_incident_state_from a111
on (a11.from_state_src_key = a111.row_key)
union
select 'ldb.d_incident_state_tribe_c a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_state a11
join ldb.d_incident_state_tribe_c a112
on (a11.tribe_c_key = a112.row_key)
union
select 'ldb.d_incident_state_to a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_state a11
join ldb.d_incident_state_to a113
on (a11.to_state_src_key = a113.row_key)
union
select 'ldb.d_lov_segment_type_c a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_state a11
join ldb.d_segment_c a14
on (a11.segment_c_key = a14.row_key)
join ldb.d_lov_segment_type_c a114
on (a14.segment_type_c_key = a114.row_key)
union
select 'ldb.d_incident_priority a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_state a11
join ldb.d_incident_priority a115
on (a11.priority_src_key = a115.row_key)
union
select 'ldb.d_incident_state a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_state a11
join ldb.d_incident a17
on (a11.incident_key = a17.row_key)
join ldb.d_incident_state a116
on (a17.state_src_key = a116.row_key)
