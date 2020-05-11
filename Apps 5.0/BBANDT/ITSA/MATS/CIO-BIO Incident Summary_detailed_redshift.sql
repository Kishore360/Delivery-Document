select 'ldb.f_incident_resolved a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_calendar_date a12
on (a11.last_resolved_on_key = a12.row_key)
union
select 'ldb.d_archer_application_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_archer_application_c a13
on (a11.application_archer_c_key = a13.row_key)
union
select 'ldb.d_incident a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_incident a14
on (a11.incident_key = a14.row_key)
union
select 'ldb.d_calendar_month a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_calendar_date a12
on (a11.last_resolved_on_key = a12.row_key)
join ldb.d_calendar_month a15
on (a12.month_start_date_key = a15.row_key)
union
select 'ldb.d_internal_organization_group a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_internal_organization_group a16
on (a11.assignment_group_key = a16.row_key)
union
select 'ldb.d_incident_priority a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_incident a14
on (a11.incident_key = a14.row_key)
join ldb.d_incident_priority a17
on (a14.priority_src_key = a17.row_key)
union
select 'ldb.d_incident_state a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_incident a14
on (a11.incident_key = a14.row_key)
join ldb.d_incident_state a18
on (a14.state_src_key = a18.row_key)