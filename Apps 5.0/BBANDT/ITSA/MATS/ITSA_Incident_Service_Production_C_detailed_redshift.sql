select 'ldb.f_incident a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
union
select 'ldb.d_archer_application_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_archer_application_c a12
on (a11.application_archer_c_key = a12.row_key)
union
select 'ldb.d_calendar_date a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_date a13
on (a11.opened_on_key = a13.row_key)
union
select 'ldb.d_software_c a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_software_c a14
on (a11.archer_id_c_key = a14.row_key)
union
select 'ldb.d_incident a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a15
on (a11.incident_key = a15.row_key)
union
select 'ldb.d_calendar_month a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_date a13
on (a11.opened_on_key = a13.row_key)
join ldb.d_calendar_month a16
on (a13.month_start_date_key = a16.row_key)
union
select 'ldb.d_calendar_week a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_date a13
on (a11.opened_on_key = a13.row_key)
join ldb.d_calendar_week a17
on (a13.week_start_date_key = a17.row_key)
union
select 'ldb.d_change_request_caused_by a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_change_request_caused_by a18
on (a11.caused_by_change_key = a18.row_key)
union
select 'ldb.d_calendar_quarter a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_date a13
on (a11.opened_on_key = a13.row_key)
join ldb.d_calendar_quarter a19
on (a13.quarter_start_date_key = a19.row_key)
union
select 'ldb.d_lov_incident_cause_code_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a15
on (a11.incident_key = a15.row_key)
join ldb.d_lov_incident_cause_code_c a110
on (a15.cause_code_c_key = a110.row_key)
union
select 'ldb.d_calendar_year a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_date a13
on (a11.opened_on_key = a13.row_key)
join ldb.d_calendar_year a111
on (a13.year_start_date_key = a111.row_key)