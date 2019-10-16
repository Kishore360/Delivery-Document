select 'ldb.f_task_sla a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla a11
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla a11
join ldb.d_calendar_date a12
on (a11.start_on_key = a12.row_key)
union
select 'ldb.d_calendar_month a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla a11
join ldb.d_calendar_date a12
on (a11.start_on_key = a12.row_key)
join ldb.d_calendar_month a13
on (a12.month_start_date_key = a13.row_key)
union
select 'ldb.d_calendar_quarter a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla a11
join ldb.d_calendar_date a12
on (a11.start_on_key = a12.row_key) join ldb.d_calendar_month a13
on (a12.month_start_date_key = a13.row_key)
join ldb.d_calendar_quarter a14
on (a13.quarter_start_date_key = a14.row_key)
union
select 'ldb.d_incident a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla a11
join ldb.d_incident a15
on (a11.incident_key = a15.row_key)
union
select 'ldb.d_incident_task_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla a11
join ldb.d_incident_task_c a16
on (a11.incident_task_key = a16.row_key)
union
select 'ldb.d_calendar_year a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla a11
join ldb.d_calendar_date a12
on (a11.start_on_key = a12.row_key) join ldb.d_calendar_month a13
on (a12.month_start_date_key = a13.row_key) join ldb.d_calendar_quarter a14
on (a13.quarter_start_date_key = a14.row_key)
join ldb.d_calendar_year a17
on (a14.year_start_date_key = a17.row_key)
union
select 'ldb.d_task_sla a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla a11
join ldb.d_task_sla a18
on (a11.sla_key = a18.row_key)
union
select 'ldb.d_application_event_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla a11
join ldb.d_application_event_c a19
on (a11.application_key = a19.row_key)
union
select 'ldb.d_internal_contact_assigned_to a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla a11
join ldb.d_internal_contact_assigned_to a110
on (a11.assigned_to_key = a110.row_key)
union
select 'ldb.d_internal_organization_group a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla a11
join ldb.d_internal_organization_group a111
on (a11.assignment_group_key = a111.row_key)
union
select 'ldb.d_incident_priority a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla a11
join ldb.d_incident a15
on (a11.incident_key = a15.row_key)
join ldb.d_incident_priority a112
on (a15.priority_src_key = a112.row_key)
union
select 'ldb.d_incident_state a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla a11
join ldb.d_incident a15
on (a11.incident_key = a15.row_key)
join ldb.d_incident_state a113
on (a15.state_src_key = a113.row_key)
union
select 'ldb.d_lov_incident_sub_status_c a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla a11
join ldb.d_incident a15
on (a11.incident_key = a15.row_key)
join ldb.d_lov_incident_sub_status_c a114
on (a15.sub_status_src_c_key = a114.row_key)
union
select 'ldb.d_task_sla_name a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla a11
join ldb.d_task_sla a18
on (a11.sla_key = a18.row_key)
join ldb.d_task_sla_name a115
on (a18.sla_category_key = a115.row_key)
