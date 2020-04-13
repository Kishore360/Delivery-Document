select 'ldb.f_incident a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
union
select 'ldb.d_application a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_application a12
on (a11.application_key = a12.row_key)
union
select 'ldb.f_change_request pa13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_application a12
on (a11.application_key = a12.row_key)
join ldb.f_change_request pa13
on (a12.mdm_key = pa13.row_key)
union
select 'ldb.d_calendar_date a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_date a14
on (a11.date_key = a14.row_key)
union
select 'ldb.d_incident a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a15
on (a11.incident_key = a15.row_key)
union
select 'ldb.d_calendar_month a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_date a14
on (a11.date_key = a14.row_key)
join ldb.d_calendar_month a16
on (a14.month_start_date_key = a16.row_key)
union
select 'ldb.d_incident_application a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident_application a17
on (a11.incident_application_key = a17.row_key)