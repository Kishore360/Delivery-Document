select 'ldb.f_incident_activity a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11
union
select 'ldb.d_internal_organization_group a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11
join ldb.d_internal_organization_group a12
on (a11.current_assignment_group_key = a12.row_key)
union
select 'ldb.d_calendar_date a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11
join ldb.d_calendar_date a13
on (a11.date_key = a13.row_key)
union
select 'ldb.d_incident a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11
join ldb.d_incident a14
on (a11.incident_key = a14.row_key)
union
select 'ldb.d_internal_organization_assignment_group_from_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11
join ldb.d_internal_organization_assignment_group_from_c a15
on (a11.from_assignment_group_key = a15.row_key)
union
select 'ldb.d_calendar_month a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11
join ldb.d_calendar_date a13
on (a11.date_key = a13.row_key)
join ldb.d_calendar_month a16
on (a13.month_start_date_key = a16.row_key)
union
select 'ldb.d_calendar_quarter a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11
join ldb.d_calendar_date a13
on (a11.date_key = a13.row_key) join ldb.d_calendar_month a16
on (a13.month_start_date_key = a16.row_key)
join ldb.d_calendar_quarter a17
on (a16.quarter_start_date_key = a17.row_key)
union
select 'ldb.d_calendar_week a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11
join ldb.d_calendar_date a13
on (a11.date_key = a13.row_key)
join ldb.d_calendar_week a18
on (a13.week_start_date_key = a18.row_key)
union
select 'ldb.d_calendar_year a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11
join ldb.d_calendar_date a13
on (a11.date_key = a13.row_key) join ldb.d_calendar_month a16
on (a13.month_start_date_key = a16.row_key) join ldb.d_calendar_quarter a17
on (a16.quarter_start_date_key = a17.row_key)
join ldb.d_calendar_year a19
on (a17.year_start_date_key = a19.row_key)
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
select 'ldb.d_incident_priority a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11
join ldb.d_incident a14
on (a11.incident_key = a14.row_key)
join ldb.d_incident_priority a113
on (a14.priority_src_key = a113.row_key)
union
select 'ldb.d_incident_state a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11
join ldb.d_incident a14
on (a11.incident_key = a14.row_key)
join ldb.d_incident_state a114
on (a14.state_src_key = a114.row_key)
union
select 'ldb.d_incident_subcategory a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11
join ldb.d_incident a14
on (a11.incident_key = a14.row_key)
join ldb.d_incident_subcategory a115
on (a14.sub_category_src_key = a115.row_key)
