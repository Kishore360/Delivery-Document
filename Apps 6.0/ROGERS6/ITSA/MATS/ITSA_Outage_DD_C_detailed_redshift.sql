select 'ldb.f_incident_outage a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
union
select 'ldb.d_application_event_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_application_event_c a12
on (a11.application_key = a12.row_key)
union
select 'ldb.d_configuration_item a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_configuration_item a14
on (a11.configuration_item_key=a14.row_key )
union
select 'ldb.d_internal_contact_director_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_configuration_item a14
on (a11.configuration_item_key=a14.row_key )
join ldb.d_internal_contact_director_c a15
on (a14.support_director_c_key = a15.row_key)
union
select 'ldb.d_internal_contact_manager_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_configuration_item a14
on (a11.configuration_item_key=a14.row_key )
join ldb.d_internal_contact_manager_c a16
on (a14.managed_by_c_key = a16.row_key)
union
select 'ldb.d_internal_contact_vp_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_configuration_item a14
on (a11.configuration_item_key=a14.row_key )
join ldb.d_internal_contact_vp_c a17
on (a14.vp_c_key = a17.row_key)
union
select 'ldb.d_calendar_date a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_calendar_date a18
on (a11.date_key = a18.row_key)
union
select 'ldb.d_calendar_month a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_calendar_date a18
on (a11.date_key = a18.row_key)
join ldb.d_calendar_month a19
on (a18.month_start_date_key = a19.row_key)
union
select 'ldb.d_calendar_quarter a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_calendar_date a18
on (a11.date_key = a18.row_key) join ldb.d_calendar_month a19
on (a18.month_start_date_key = a19.row_key)
join ldb.d_calendar_quarter a110
on (a19.quarter_start_date_key = a110.row_key)
union
select 'ldb.d_incident a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_incident a111
on (a11.incident_key = a111.row_key)
union
select 'ldb.d_calendar_year a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_calendar_date a18
on (a11.date_key = a18.row_key) join ldb.d_calendar_month a19
on (a18.month_start_date_key = a19.row_key) join ldb.d_calendar_quarter a110
on (a19.quarter_start_date_key = a110.row_key)
join ldb.d_calendar_year a112
on (a110.year_start_date_key = a112.row_key)
union
select 'ldb.d_calendar_date_critical_day_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_calendar_date_critical_day_c a113
on (a11.start_on_key = a113.row_key)
union
select 'ldb.d_outage a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_outage a114
on (a11.outage_key = a114.row_key)
union
select 'ldb.d_configuration_item a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_configuration_item a115
on (a11.configuration_item_key = a115.row_key)
union
select 'ldb.d_incident_priority a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_incident a111
on (a11.incident_key = a111.row_key)
join ldb.d_incident_priority a116
on (a111.priority_src_key = a116.row_key)
union
select 'ldb.d_incident_state a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_incident a111
on (a11.incident_key = a111.row_key)
join ldb.d_incident_state a117
on (a111.state_src_key = a117.row_key)
union
select 'ldb.d_lov_incident_sub_status_c a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_incident a111
on (a11.incident_key = a111.row_key)
join ldb.d_lov_incident_sub_status_c a118
on (a111.sub_status_src_c_key = a118.row_key)
union
select 'ldb.d_outage_type a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_outage a114
on (a11.outage_key = a114.row_key)
join ldb.d_outage_type a119
on (a114.outage_type_src_key = a119.row_key)
