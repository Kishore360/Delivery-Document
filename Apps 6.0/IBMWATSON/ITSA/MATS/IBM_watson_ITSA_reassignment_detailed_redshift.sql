select 'ldb.f_incident_activity a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11
union
select 'ldb.d_segment_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11
join ldb.d_segment_c a12
on (a11.segment_c_key = a12.row_key)
union
select 'ldb.d_internal_organization_group a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11
join ldb.d_internal_organization_group a13
on (a11.current_assignment_group_key = a13.row_key)
union
select 'ldb.d_incident_activity_date a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11
join ldb.d_incident_activity_date a14
on (a11.incident_activity_date_key = a14.row_key)
union
select 'ldb.d_incident a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11
join ldb.d_incident a15
on (a11.incident_key = a15.row_key)
union
select 'ldb.d_incident_assignment_group a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11
join ldb.d_incident a15
on (a11.incident_key = a15.row_key)
join ldb.d_incident_assignment_group a16
on (a15.assignment_group_key = a16.row_key)
union
select 'ldb.d_configuration_item_incident a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11
join ldb.d_incident a15
on (a11.incident_key = a15.row_key)
join ldb.d_configuration_item_incident a17
on (a15.configuration_item_key = a17.row_key)
union
select 'ldb.d_incident_configuration_item_mdm a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11
join ldb.d_incident a15
on (a11.incident_key = a15.row_key) join ldb.d_configuration_item_incident a17
on (a15.configuration_item_key = a17.row_key)
join ldb.d_incident_configuration_item_mdm a18
on (a17.mdm_key = a18.row_key)
union
select 'ldb.d_calendar_date a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11
join ldb.d_calendar_date a19
on (a11.date_key = a19.row_key)
union
select 'ldb.d_internal_contact_to a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11
join ldb.d_internal_contact_to a110
on (a11.to_assigned_to_key = a110.row_key)
union
select 'ldb.d_internal_organization_group_to a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11
join ldb.d_internal_organization_group_to a111
on (a11.to_assignment_group_key = a111.row_key)
union
select 'ldb.d_internal_contact_from a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11
join ldb.d_internal_contact_from a112
on (a11.from_assigned_to_key = a112.row_key)
union
select 'ldb.d_internal_organization_group_from a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11
join ldb.d_internal_organization_group_from a113
on (a11.from_assignment_group_key = a113.row_key)
union
select 'ldb.d_lov_segment_type_c a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11
join ldb.d_segment_c a12
on (a11.segment_c_key = a12.row_key)
join ldb.d_lov_segment_type_c a114
on (a12.segment_type_c_key = a114.row_key)
union
select 'ldb.d_incident_activity_calendar_month a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11
join ldb.d_incident_activity_date a14
on (a11.incident_activity_date_key = a14.row_key)
join ldb.d_incident_activity_calendar_month a115
on (a14.month_start_date_key = a115.row_key)
union
select 'ldb.d_incident_priority a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11
join ldb.d_incident a15
on (a11.incident_key = a15.row_key)
join ldb.d_incident_priority a116
on (a15.priority_src_key = a116.row_key)
union
select 'ldb.d_incident_state a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11
join ldb.d_incident a15
on (a11.incident_key = a15.row_key)
join ldb.d_incident_state a117
on (a15.state_src_key = a117.row_key)
union
select 'ldb.d_incident_tribe_c a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11
join ldb.d_incident a15
on (a11.incident_key = a15.row_key) join ldb.d_configuration_item_incident a17
on (a15.configuration_item_key = a17.row_key) join ldb.d_incident_configuration_item_mdm a18
on (a17.mdm_key = a18.row_key)
join ldb.d_incident_tribe_c a118
on (a18.incident_tribe_c_key = a118.row_key)