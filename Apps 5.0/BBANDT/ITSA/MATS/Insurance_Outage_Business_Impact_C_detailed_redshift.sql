select 'ldb.f_outage a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_outage a11
union
select 'ldb.d_outage a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_outage a11
join ldb.d_outage a12
on (a11.outage_key = a12.row_key)
union
select 'ldb.d_archer_application_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_outage a11
join ldb.d_archer_application_c a13
on (a11.application_archer_c_key = a13.row_key)
union
select 'ldb.d_software_c a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_outage a11
join ldb.d_software_c a14
on (a11.archer_id_c_key = a14.row_key)
union
select 'ldb.d_incident a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_outage a11
join ldb.d_incident a15
on (a11.incident_key = a15.row_key)
union
select 'ldb.d_incident_priority a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_outage a11
join ldb.d_incident a15
on (a11.incident_key = a15.row_key)
join ldb.d_incident_priority a16
on (a15.priority_src_key = a16.row_key)
union
select 'ldb.d_outage_type a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_outage a11
join ldb.d_outage a12
on (a11.outage_key = a12.row_key)
join ldb.d_outage_type a17
on (a12.outage_type_src_key = a17.row_key)