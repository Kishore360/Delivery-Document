select 'ldb.f_incident_outage a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
union
select 'ldb.d_software_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_software_c a12
on (a11.archer_id_c_key = a12.row_key)
union
select 'ldb.d_calendar_date a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_calendar_date a13
on (a11.start_on_key = a13.row_key)
union
select 'ldb.d_archer_application_c a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_archer_application_c a14
on (a11.application_archer_c_key = a14.row_key)
union
select 'ldb.d_incident a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_incident a15
on (a11.incident_key = a15.row_key)
union
select 'ldb.d_calendar_month a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_calendar_date a13
on (a11.start_on_key = a13.row_key)
join ldb.d_calendar_month a16
on (a13.month_start_date_key = a16.row_key)
union
select 'ldb.d_outage a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_outage a17
on (a11.outage_key = a17.row_key)
union
select 'ldb.d_internal_organization_group a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_internal_organization_group a18
on (a11.assignment_group_key = a18.row_key)
union
select 'ldb.d_incident_priority a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_incident a15
on (a11.incident_key = a15.row_key)
join ldb.d_incident_priority a19
on (a15.priority_src_key = a19.row_key)
union
select 'ldb.d_outage_type a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage a11
join ldb.d_outage a17
on (a11.outage_key = a17.row_key)
join ldb.d_outage_type a110
on (a17.outage_type_src_key = a110.row_key)