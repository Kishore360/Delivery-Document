select 'ldb.f_incident_resolved a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
union
select 'ldb.d_incident a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
union
select 'ldb.d_segment_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_segment_c a13
on (a11.segment_c_key = a13.row_key)
union
select 'ldb.d_calendar_date a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_calendar_date a14
on (a11.last_resolved_on_key = a14.row_key)
union
select 'ldb.d_incident_priority a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_incident_priority a15
on (a12.priority_src_key = a15.row_key)
union
select 'ldb.d_lov_incident_status_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_lov_incident_status_c a16
on (a12.incident_status_c_key = a16.row_key)
union
select 'ldb.d_lov_segment_type_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_segment_c a13
on (a11.segment_c_key = a13.row_key) join ldb.d_incident a12
on (a11.incident_key = a12.row_key) join ldb.d_incident_state a13
on (a12.state_src_key = a13.row_key)
join ldb.d_lov_segment_type_c a17
on (a13.segment_type_c_key = a17.row_key)
union
select 'ldb.d_incident_state a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_incident_state a13
on (a12.state_src_key = a13.row_key)