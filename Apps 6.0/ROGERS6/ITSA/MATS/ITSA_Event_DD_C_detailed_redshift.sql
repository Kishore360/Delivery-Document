select 'ldb.f_incident_event_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_event_c a11
union
select 'ldb.d_incident a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_event_c a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
union
select 'ldb.d_configuration_item a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_event_c a11
join ldb.d_configuration_item a13
on (a11.configuration_item_key = a13.row_key)
union
select 'ldb.d_internal_contact_director_c a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_event_c a11
join ldb.d_configuration_item a13
on (a11.configuration_item_key = a13.row_key)
join ldb.d_internal_contact_director_c a14
on (a13.support_director_c_key = a14.row_key)
union
select 'ldb.d_internal_contact_manager_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_event_c a11
join ldb.d_configuration_item a13
on (a11.configuration_item_key = a13.row_key)
join ldb.d_internal_contact_manager_c a15
on (a13.managed_by_c_key = a15.row_key)
union
select 'ldb.d_internal_contact_vp_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_event_c a11
join ldb.d_configuration_item a13
on (a11.configuration_item_key = a13.row_key)
join ldb.d_internal_contact_vp_c a16
on (a13.vp_c_key = a16.row_key)
union
select 'ldb.d_internal_organization_group a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_event_c a11
join ldb.d_internal_organization_group a17
on (a11.assignment_group_key = a17.row_key)
union
select 'ldb.d_calendar_date a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_event_c a11
join ldb.d_calendar_date a18
on (a11.opened_on_key = a18.row_key)
union
select 'ldb.d_calendar_month a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_event_c a11
join ldb.d_calendar_date a18
on (a11.opened_on_key = a18.row_key)
join ldb.d_calendar_month a19
on (a18.month_start_date_key = a19.row_key)
union
select 'ldb.d_calendar_quarter a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_event_c a11
join ldb.d_calendar_date a18
on (a11.opened_on_key = a18.row_key) join ldb.d_calendar_month a19
on (a18.month_start_date_key = a19.row_key)
join ldb.d_calendar_quarter a110
on (a19.quarter_start_date_key = a110.row_key)
union
select 'ldb.d_incident_requester_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_event_c a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_incident_requester_c a111
on (a12.row_key = a111.row_key)
union
select 'ldb.d_calendar_year a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_event_c a11
join ldb.d_calendar_date a18
on (a11.opened_on_key = a18.row_key) join ldb.d_calendar_month a19
on (a18.month_start_date_key = a19.row_key) join ldb.d_calendar_quarter a110
on (a19.quarter_start_date_key = a110.row_key)
join ldb.d_calendar_year a112
on (a110.year_start_date_key = a112.row_key)
union
select 'ldb.d_application_event_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_event_c a11
join ldb.d_application_event_c a113
on (a11.application_key = a113.row_key)
union
select 'ldb.d_internal_contact_assigned_to a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_event_c a11
join ldb.d_internal_contact_assigned_to a114
on (a11.assigned_to_key = a114.row_key)
union
select 'ldb.d_internal_organization_last_resolved_by_c a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_event_c a11
join ldb.d_internal_organization_last_resolved_by_c a115
on (a11.resolved_by_group_key = a115.row_key)
union
select 'ldb.d_incident_priority a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_event_c a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_incident_priority a116
on (a12.priority_src_key = a116.row_key)
union
select 'ldb.d_incident_state a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_event_c a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_incident_state a117
on (a12.state_src_key = a117.row_key)
union
select 'ldb.d_lov_incident_sub_status_c a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_event_c a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_lov_incident_sub_status_c a118
on (a12.sub_status_src_c_key = a118.row_key)
union
select 'ldb.requester = '' ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_event_c a11
